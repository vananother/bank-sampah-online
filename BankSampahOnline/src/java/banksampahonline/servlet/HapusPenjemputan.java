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
@WebServlet(name = "HapusPenjemputan", urlPatterns = {"/HapusPenjemputan"})
public class HapusPenjemputan extends HttpServlet {

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
            out.println("<title>Servlet HapusPenjemputan</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HapusPenjemputan at " + request.getContextPath() + "</h1>");
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
        db = new BankSampahOnlineDB();
        session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            session.setAttribute("account", null);
            request.setAttribute("errorMessage", "<label class=\"label label-danger\">Anda harus login terlebih dahulu</label>");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        String idSampah = request.getParameter("jemput");
        boolean jemput = db.jemputSampah(idSampah);
        response.sendRedirect("RiwayatB.jsp");
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
        String idSampah = request.getParameter("hapus");
        boolean jemput = db.hapusSampah(idSampah);
        response.sendRedirect("RiwayatB.jsp");
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