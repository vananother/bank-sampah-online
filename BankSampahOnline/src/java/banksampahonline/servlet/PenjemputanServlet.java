/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package banksampahonline.servlet;

import banksampahonline.database.BankSampahOnlineDB;
import banksampahonline.util.Account;
import banksampahonline.util.Sampah;
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
@WebServlet(name = "PenjemputanServlet", urlPatterns = {"/PenjemputanServlet"})
public class PenjemputanServlet extends HttpServlet {

    BankSampahOnlineDB db;
    HttpSession session;
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        request.getRequestDispatcher("Riwayat.jsp").forward(request, response);
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
        int acid = account.getId();
        String kategori = request.getParameter("jenisSampah");
        String berat = request.getParameter("berat");
        String tanggal = request.getParameter("tanggaljemput");
        String jam = request.getParameter("jamjemput");
        String keterangan = request.getParameter("keterangan");
        Sampah sesampahan = new Sampah();
        sesampahan.setIdPengguna(acid);
        sesampahan.setJam(jam);
        sesampahan.setTanggal(tanggal);
        sesampahan.setKategori(kategori);
        sesampahan.setJumlah(Double.parseDouble(berat));
        sesampahan.setKeterangan(keterangan);
        sesampahan.setStatus("Belum Dijemput");
        boolean addComplete = db.addSampah(sesampahan);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet PenjemputanServlet</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet PenjemputanServlet at " + request.getContextPath() + "</h1>");
        out.println("kategori: "+kategori+"<br>");
        out.println("berat: "+berat+"<br>");
        out.println("tanggal: "+tanggal+"<br>");
        out.println("jam: "+jam+"<br>");
        out.println("keterangan: "+keterangan+"<br>");
        out.println("hasil add sampah: "+addComplete+"<br>");
        out.println("fail because: "+db.failBecause+"<br>");
        out.println("</body>");
        out.println("</html>");
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
