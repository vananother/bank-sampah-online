/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package banksampahonline.servlet;

import banksampahonline.database.BankSampahOnlineDB;
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
        session = (HttpSession) request.getSession().getAttribute("account");
        if(session != null){
            request.getSession().setAttribute("account", null);
        }
        response.sendRedirect("register.jsp");
//        request.getRequestDispatcher("index.jsp").forward(request, response);
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
        session = (HttpSession) request.getSession().getAttribute("account");
        if(session != null){
            request.getSession().setAttribute("account", null);
        }
        boolean regSuccess = false;
        String username = request.getParameter("regusername");
        String password = request.getParameter("regpassword");
        String password2 = request.getParameter("regpassword2");
        String firstname = request.getParameter("regfirstname");
        String lastname = request.getParameter("reglastname");
        String email = request.getParameter("regemail");
        String address = request.getParameter("regalamat");
        String phone = request.getParameter("regphone");
        String encPass = UtilMethods.hashInput(password);

        String info = UtilMethods.regFormValidation(username, password, password2, firstname, lastname, email, address, phone);
        if (info.equals("")) {
            regSuccess = db.addAccount(username, encPass, firstname, lastname, email, address, phone);
        } else {
            request.setAttribute("errorMessage", info);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }

        if (regSuccess) {
            info = "<label class=\"label label-success\">Registrasi Sukses</label>";
            request.setAttribute("errorMessage", info);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            info = "<label class=\"label label-danger\">Registrasi Gagal, Username telah terdaftar:"+db.failBecause+"</label>";
            request.setAttribute("errorMessage", info);
            request.getRequestDispatcher("register.jsp").forward(request, response);
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
