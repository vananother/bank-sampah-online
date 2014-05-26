/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package banksampahonline.servlet;

import banksampahonline.database.BankSampahOnlineDB;
import banksampahonline.util.Account;
import banksampahonline.util.UtilMethods;
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
@WebServlet(name = "TambahAdmin", urlPatterns = {"/TambahAdmin"})
public class TambahAdmin extends HttpServlet {

    BankSampahOnlineDB db;
    HttpSession session;
    Account account;

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
            out.println("<title>Servlet TambahAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TambahAdmin at " + request.getContextPath() + "</h1>");
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
        account = (Account) session.getAttribute("account");
        if (account != null) {
            if (account.getRole().equals("pengguna")) {
//                request.getRequestDispatcher("Riwayat.jsp").forward(request, response);
                response.sendRedirect("Riwayat.jsp");
                return;
            } else if (account.getRole().equals("admin")) {
//                request.getRequestDispatcher("Pendataan.jsp").forward(request, response);
                response.sendRedirect("DaftarPenjemputan.jsp");
                return;
            } else if (account.getRole().equals("superadmin")) {
                response.sendRedirect(("TambahAdmin.jsp"));
                return;
            }
        } else {
            session.setAttribute("account", null);
            request.setAttribute("errorMessage", "<label class=\"label label-danger\">Anda harus login terlebih dahulu</label>");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
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
        session = request.getSession();
        account = (Account) session.getAttribute("account");
        if (account != null) {
            if (!account.getRole().equals("superadmin")) {
                response.sendRedirect("Login");
                return;
            }
            db = new BankSampahOnlineDB();
            String username = request.getParameter("username");
            request.setAttribute("username", username);
            String password1 = request.getParameter("password1");
            request.setAttribute("password1", password1);
            String password2 = request.getParameter("password2");
            request.setAttribute("password2", password2);

            if (!password1.equals(password2)) {
                //confirm password gagal
                request.setAttribute("errorMessage", "<label class=\"label label-danger\">Password tidak sesuai</label>");
                request.getRequestDispatcher("TambahAdmin.jsp").forward(request, response);
                return;
            } else {
                boolean success = db.addAdmin(username, UtilMethods.hashInput(password1));
                if (success) {
                    request.setAttribute("errorMessage", "<label class=\"label label-success\">Penambahan Admin Sukses</label>");
                    request.getRequestDispatcher("TambahAdmin.jsp").forward(request, response);
                    return;
                } else {
                    request.setAttribute("errorMessage", "<label class=\"label label-danger\">Penambahan Admin Gagal</label>");
                    request.getRequestDispatcher("TambahAdmin.jsp").forward(request, response);
                    return;
                }
            }
        } else {
            session.setAttribute("account", null);
            request.setAttribute("errorMessage", "<label class=\"label label-danger\">Login Gagal, Salah Username atau Password</label>");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }
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
