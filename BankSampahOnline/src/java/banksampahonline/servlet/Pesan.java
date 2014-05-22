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
            } else if (account.getRole().equals("admin")) {
                request.getRequestDispatcher("PesanKePengguna.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("index.jsp").forward(request, response);
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
        //initialize variable
        session = request.getSession();
        db = new BankSampahOnlineDB();
        account = (Account) session.getAttribute("account");

        String penerima = request.getParameter("penerima");
        //int id_penerima = db.getAccountID(penerima);
        String subjek = request.getParameter("subjek");
        String isi = request.getParameter("isi");
        java.util.Date date = new java.util.Date();
        Date sDate = new Date(date.getTime());
        java.sql.Time sTime = new java.sql.Time(date.getTime());
//        PrintWriter out = response.getWriter();
//        out.println("pengirim: "+account.getUsername());
//        out.println("id_pengirim: "+account.getId());
//        out.println("penerima: "+penerima);
        // out.println("id penerima: "+id_penerima);
//        out.println("subjek: "+subjek);
//        out.println("isi: "+isi);
//        out.println("date: "+date.toString());
//        out.println("sqlDate: "+sDate.toString());
//        out.println("sql Time: "+sTime.toString());

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
            } else if (account.getRole().equals("pengguna")) {
                response.sendRedirect("PesanKeAdmin.jsp");
            } else {
                response.sendRedirect("index.jsp?logout=1");
            }
        } else {
            request.setAttribute("errorMessage", "<label class=\"label label-danger\">Tidak ada pengguna dengan username: "+penerima+" "+db.failBecause+"</label>");
            if (account.getRole().equals("admin")) {
                request.getRequestDispatcher("PesanKePengguna.jsp").forward(request, response);
            } else if (account.getRole().equals("pengguna")) {
                request.getRequestDispatcher("PesanKeAdmin.jsp").forward(request, response);
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
