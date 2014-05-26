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
import java.sql.Date;
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
@WebServlet(name = "Pesan", urlPatterns = {"/Pesan"})
public class Pesan extends HttpServlet {

    HttpSession session;
    BankSampahOnlineDB db;
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
            out.println("<title>Servlet Pesan</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Pesan at " + request.getContextPath() + "</h1>");
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
                request.getRequestDispatcher("PesanKeAdmin.jsp").forward(request, response);
                return;
            } else if (account.getRole().equals("admin")) {
                request.getRequestDispatcher("PesanKePengguna.jsp").forward(request, response);
                return;
            } else {
                request.getRequestDispatcher("Login").forward(request, response);
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
        //initialize variable
        session = request.getSession();
        db = new BankSampahOnlineDB();
        account = (Account) session.getAttribute("account");
        if (account == null) {
            session.setAttribute("account", null);
            request.setAttribute("errorMessage", "<label class=\"label label-danger\">Anda harus login terlebih dahulu</label>");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }
        
        String penerima = request.getParameter("penerima");
        request.setAttribute("penerima", penerima);
        //int id_penerima = db.getAccountID(penerima);
        String subjek = request.getParameter("subjek");
        request.setAttribute("subjek", subjek);
        String isi = request.getParameter("isi");
        request.setAttribute("isi", isi);
        java.util.Date date = new java.util.Date();
        Date sDate = new Date(date.getTime());
        java.sql.Time sTime = new java.sql.Time(date.getTime());

        banksampahonline.util.Pesan pesan = new banksampahonline.util.Pesan();
        pesan.setId_pengirim(account.getUsername());
        pesan.setId_penerima(penerima);
        pesan.setSubjek(subjek);
        pesan.setIsi(isi);
        pesan.setTanggal(sDate.toString());
        pesan.setJam(sTime.toString());
        pesan.setSeen(false);

        boolean kirimPesan;
        kirimPesan = db.sendMessage(pesan);
//        out.println("kirim pesan: "+kirimPesan);
//        out.println("failBecause: "+db.failBecause);
        if (kirimPesan) {
            if (account.getRole().equals("admin")) {
                response.sendRedirect("PesanKePengguna.jsp");
                return;
            } else if (account.getRole().equals("pengguna")) {
                response.sendRedirect("PesanKeAdmin.jsp");
                return;
            } else {
                response.sendRedirect("Login");
                return;
            }
        } else {
            request.setAttribute("errorMessage", "<label class=\"label label-danger\">Tidak ada pengguna dengan username: " + penerima + " " + db.failBecause + "</label>");
            if (account.getRole().equals("admin")) {
                request.getRequestDispatcher("PesanKePengguna.jsp").forward(request, response);
                return;
            } else if (account.getRole().equals("pengguna")) {
                request.getRequestDispatcher("PesanKeAdmin.jsp").forward(request, response);
                return;
            } else if (account.getRole().equals("superadmin")) {
                response.sendRedirect("Login");
                return;
            }

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
