/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package banksampahonline.servlet;

import banksampahonline.database.BankSampahOnlineDB;
import banksampahonline.util.Account;
import banksampahonline.util.Sampah;
import banksampahonline.util.UtilMethods;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "PenjemputanSampah", urlPatterns = {"/PenjemputanSampah"})
public class PenjemputanSampah extends HttpServlet {

    BankSampahOnlineDB db;
    HttpSession session;
   
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
        if (session.getAttribute("account") != null) {
            //request.getRequestDispatcher("PenjemputanSampah.jsp").forward(request, response);
            response.sendRedirect("PenjemputanSampah.jsp");
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
        boolean fail = false;
        if (account == null) {
            session.setAttribute("account", null);
            request.setAttribute("errorMessage", "<label class=\"label label-danger\">Anda harus login terlebih dahulu</label>");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            fail = true;
        }

        //int acid = account.getId();
        String kategori = request.getParameter("jenisSampah");
        String berat = request.getParameter("berat");
        String tanggal = request.getParameter("tanggaljemput");
        if (!tanggal.matches("(\\d\\d\\d\\d-\\d{1,2}-\\d{1,2})")) {
            request.setAttribute("errorMessage", "<label class=\"label label-danger\">Format Tanggal Penjemputan salah1</label>");
            request.getRequestDispatcher("PenjemputanSampah.jsp").forward(request, response);
            fail = true;
        }
        Date now = new Date();
        Date input = new Date();
        try {
            input = new SimpleDateFormat("yyyy-MM-dd").parse(tanggal);
        } catch (ParseException ex) {
            request.setAttribute("errorMessage", "<label class=\"label label-danger\">Format Tanggal Penjemputan salah2</label>");
            request.getRequestDispatcher("PenjemputanSampah.jsp").forward(request, response);
            fail = true;
        }
        long n1 = input.getTime();
        long n2 = now.getTime();
        if (n1 - n2 < (86400000 * 7)) {
            request.setAttribute("errorMessage", "<label class=\"label label-danger\">Penjemputan minimal 1 minggu dari hari ini</label>");
            request.getRequestDispatcher("PenjemputanSampah.jsp").forward(request, response);
            fail = true;
        }

        String jam = request.getParameter("jamjemput");
        //Time time = new Time();
        if (!jam.matches("(\\d{1,2}:\\d{1,2})")) {
            request.setAttribute("errorMessage", "<label class=\"label label-danger\">Format Jam Penjemputan salah</label>");
            request.getRequestDispatcher("PenjemputanSampah.jsp").forward(request, response);
            fail = true;
        }
        //Time inputTime = Time.valueOf(jam);
        int timeTime = UtilMethods.getSeconds(jam);
        int lowBound = UtilMethods.getSeconds("08:00");
        int upBound = UtilMethods.getSeconds("22:00");
        if (timeTime < lowBound || timeTime > upBound) {
            request.setAttribute("errorMessage", "<label class=\"label label-danger\">Penjemputan hanya dapat dilakukan dari jam 8 pagi sampai jam 10 malam</label>");
//            request.setAttribute("errorMessage", "<label class=\"label label-danger\">"+lowBound+" "+timeTime+" "+upBound+"</label>");
            request.getRequestDispatcher("PenjemputanSampah.jsp").forward(request, response);
            fail = true;
        }
        
        String keterangan = request.getParameter("keterangan");
        Sampah sesampahan = new Sampah();
        sesampahan.setIdPengguna(account.getUsername());
        sesampahan.setJam(jam);
        sesampahan.setTanggal(tanggal);
        //session.setAttribute("account", null);
        sesampahan.setKategori(kategori);
        sesampahan.setJumlah(Double.parseDouble(berat));
        sesampahan.setKeterangan(keterangan);
        sesampahan.setStatus("Belum Dijemput");
        sesampahan.setBayaran(0);
        boolean addComplete = false;
        if (!fail) {
            addComplete = db.addSampah(sesampahan);
        }
        if (addComplete) {
            request.setAttribute("errorMessage", "<label class=\"label label-success\">Penambahan permintaan penjemputan berhasil</label>");
            request.getRequestDispatcher("Riwayat.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "<label class=\"label label-danger\">Penambahan permintaan penjemputan gagal: " + db.failBecause + "</label><br>");
            request.getRequestDispatcher("PenjemputanSampah.jsp").forward(request, response);
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
