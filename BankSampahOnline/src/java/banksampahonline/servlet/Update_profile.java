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
import java.util.ArrayList;
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
@WebServlet(name = "Update_profile", urlPatterns = {"/Update_profile"})
public class Update_profile extends HttpServlet {

    HttpSession session;
    BankSampahOnlineDB db;

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
            out.println("<title>Servlet Update_profile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Update_profile at " + request.getContextPath() + "</h1>");
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
        if (session.getAttribute("account") != null) {
//            request.getRequestDispatcher("udpate_profile.jsp").forward(request, response);
            response.sendRedirect("update_profile.jsp");
            return;
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
        db = new BankSampahOnlineDB();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            request.setAttribute("errorMessage", "<label class=\"label label-danger\">Anda harus login terlebih dahulu</label>");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        } else {
            ArrayList<String> updates = new ArrayList<String>();
            boolean update = false;
            String error = null;
            String fname = request.getParameter("fname");
            if (fname != null && !fname.equals(account.getFirstname())) {
                if (UtilMethods.nameValidation(fname)) {
                    updates.add("firstname = '" + fname + "'");
                    update = true;
                } else {
                    error = "Nama Depan mengandung karakter illegal";
                }
            }

            String lname = request.getParameter("lname");
            if (lname != null && !lname.equals(account.getLastname())) {
                if (UtilMethods.nameValidation(lname)) {
                    updates.add("lastname = '" + lname + "'");
                    update = true;
                } else {
                    error = "Nama Belakang mengandung karakter illegal";
                }
            }

            String oldPassword = request.getParameter("oldPassword");
            String newPassword1 = request.getParameter("newPassword1");
            String newPassword2 = request.getParameter("newPassword2");

            boolean isOkay1 = oldPassword.length() != 0;
            boolean isOkay2 = (newPassword1.length() != 0) && (newPassword2.length() != 0);
            if (isOkay1 && isOkay2) {
                isOkay1 = db.isLoginValid(account.getUsername(), UtilMethods.hashInput(oldPassword));
                if (!isOkay1) {
                    error = "Password lama salah.";
                }
                isOkay2 = newPassword1.equals(newPassword2);
                if (!isOkay2) {
                    error = "Konfirmasi Password Baru tidak sesuai.";
                }
            }

            if (isOkay1 && isOkay2) {
                updates.add("password = '" + UtilMethods.hashInput(newPassword1) + "'");
                update = true;
            }

            String address = request.getParameter("address");
            if (address != null && !address.equals(account.getAlamat())) {
                updates.add("alamat = '" + address + "'");
                update = true;
            }

            String phone = request.getParameter("phone");
            if (phone != null && !phone.equals(account.getPhone())) {
                if (UtilMethods.phoneNumberValidation(phone)) {
                    updates.add("phone = '" + phone + "'");
                    update = true;
                } else {
                    error = "Nomor telepon tidak valid";
                }
            }

            boolean query = false;
            if (update) {
                query = db.updateProfile(updates, account.getId());
            }

            if (isOkay1 && isOkay2 && query) {
                session.setAttribute("account", null);
                request.setAttribute("errorMessage", "<label class=\"label label-success\">Penggantian Password Sukses, Silahkan Login Kembali</label>");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
//                response.sendRedirect("Login.jsp");
                return;
            }

            if (query) {
                account = db.login(account.getUsername(), account.getHashPassword());
                session.setAttribute("account", account);
                request.setAttribute("errorMessage", "<label class=\"label label-success\">Ubah Profile Sukses</label>");
                request.getRequestDispatcher("Riwayat.jsp").forward(request, response);
                return;
            } else {
                if (!update) {
                    if (error != null) {
                        request.setAttribute("errorMessage", "<label class=\"label label-danger\">" + error + "</label>");
                        request.getRequestDispatcher("update_profile.jsp").forward(request, response);
                        return;
                    } else {
                        response.sendRedirect("Riwayat.jsp");
                        return;
//                    request.getRequestDispatcher("Riwayat.jsp").forward(request, response);
                    }
                } else {
                    if (error != null) {
                        request.setAttribute("errorMessage", "<label class=\"label label-danger\">" + error + "</label>");
                        request.getRequestDispatcher("update_profile.jsp").forward(request, response);
                        return;
                    } else {
                        request.setAttribute("errorMessage", "<label class=\"label label-danger\">Ubah Profile Gagal</label>");
                        request.getRequestDispatcher("update_profile.jsp").forward(request, response);
                        return;
                    }
                }
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
