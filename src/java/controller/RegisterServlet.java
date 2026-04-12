/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author lttru
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        processRequest(request, response);
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
        UserDAO dao = new UserDAO();

            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            String repass = request.getParameter("repassword");

            fullname = fullname == null ? "" : fullname.trim();
            email = email == null ? "" : email.trim();
            pass = pass == null ? "" : pass.trim();
            repass = repass == null ? "" : repass.trim();

            if(fullname.isEmpty() || email.isEmpty() || pass.isEmpty() || repass.isEmpty()){
                request.setAttribute("mess", "Hãy nhập đầy đủ thông tin");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            if(!pass.equals(repass)){
                request.setAttribute("mess", "Mật khẩu không khớp");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            try{

                User existingUser = dao.getUserByEmail(email);

                if(existingUser != null){
                    request.setAttribute("mess", "Email đã tồn tại");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                    return;
                }

                User u = new User();
                u.setFullName(fullname);
                u.setEmail(email);

                String hashedPass = BCrypt.hashpw(pass, BCrypt.gensalt());

                u.setPassword(hashedPass);
                u.setRole("user");

                dao.ins(u);

                request.getSession().setAttribute("mess", "Đăng ký thành công");
                response.sendRedirect("login.jsp");

            }catch(Exception e){
                request.setAttribute("mess", "Lỗi đăng ký");
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
