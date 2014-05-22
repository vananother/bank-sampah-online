/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package banksampahonline.servlet;

import banksampahonline.database.BankSampahOnlineDB;
import banksampahonline.util.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author van
 */
@WebServlet(name = "Pendataan", urlPatterns = {"/Pendataan"})
public class Pendataan extends HttpServlet {

    BankSampahOnlineDB db;
    HttpSession session;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Pendataan</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Pendataan at " + request.getContextPath() + "</h1>");
            String idSampah = request.getParameter("bayar");
            String bayaran = request.getParameter("bayaran");
            String username = request.getParameter("username");

            out.println("idSampah: " + idSampah + "<br>bayaran: " + bayaran + "<br>username: " + username);
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            if(account.getRole().equals("admin")){
                response.sendRedirect("PendataanB.jsp");
            } else if (account.getRole().equals("pengguna")){
                response.sendRedirect("RiwayatB.jsp");
            } else {
                response.sendRedirect("index.jsp?logout=1");
            }
            
        } else {
            session.setAttribute("account", null);
            request.setAttribute("errorMessage", "<label class=\"label label-danger\">Anda harus login terlebih dahulu</label>");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        db = new BankSampahOnlineDB();
        session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            session.setAttribute("account", null);
            request.setAttribute("errorMessage", "<label class=\"label label-danger\">Anda harus login terlebih dahulu</label>");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        String idSampah = request.getParameter("bayar");
        String bayaran = request.getParameter("bayaran");
        String username = request.getParameter("username");
        //processRequest(request, response);
        boolean bayar = db.bayarSampah(idSampah, username, bayaran);
        response.sendRedirect("PendataanB.jsp");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
