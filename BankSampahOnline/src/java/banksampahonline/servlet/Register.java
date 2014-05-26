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
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

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
        session = (HttpSession) request.getSession().getAttribute("account");
        if(session != null){
            request.getSession().setAttribute("account", null);
        }
        response.sendRedirect("register.jsp");
        return;
//        request.getRequestDispatcher("Login.jsp").forward(request, response);
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
        if(account != null){
            request.getSession().setAttribute("account", null);
            //return;
        }
        boolean regSuccess = false;
        String username = request.getParameter("regusername");
        request.setAttribute("regusername", username);
        String password = request.getParameter("regpassword");
        request.setAttribute("regpassword", password);
        String password2 = request.getParameter("regpassword2");
        request.setAttribute("regpassword2", password2);
        String firstname = request.getParameter("regfirstname");
        request.setAttribute("regfirstname", firstname);
        String lastname = request.getParameter("reglastname");
        request.setAttribute("reglastname", lastname);
        String email = request.getParameter("regemail");
        request.setAttribute("regemail", email);
        String address = request.getParameter("regalamat");
        request.setAttribute("regalamat", address);
        String phone = request.getParameter("regphone");
        request.setAttribute("regphone", phone);
        String encPass = UtilMethods.hashInput(password);

        String info = UtilMethods.regFormValidation(username, password, password2, firstname, lastname, email, address, phone);
        if (info.equals("")) {
            regSuccess = db.addAccount(username, encPass, firstname, lastname, email, address, phone);
        } else {
            request.setAttribute("errorMessage", info);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        if (regSuccess) {
            info = "<label class=\"label label-success\">Registrasi Sukses</label>";
            request.setAttribute("errorMessage", info);
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        } else {
            info = "<label class=\"label label-danger\">Registrasi Gagal: "+db.failBecause+"</label>";
            request.setAttribute("errorMessage", info);
            request.getRequestDispatcher("register.jsp").forward(request, response);
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
