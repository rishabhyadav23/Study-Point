package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.DBConnection;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author bloototh music
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

            // form data to edit
            String user_name = request.getParameter("user_name");
            String user_email = request.getParameter("user_email");
            String password = request.getParameter("password");
            Part part = request.getPart("image");
            String img_name = part.getSubmittedFileName();

            // set the user from the session
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            user.setUser_name(user_name);
            user.setUser_email(user_email);
            user.setUser_pass(password);
            String oldPic = user.getUser_profile();
            if(!"".equals(img_name)){
                user.setUser_profile(img_name);
            }

            // update information
            UserDao dao = new UserDao((DBConnection.getConnection()));
            boolean ans = dao.updateUser(user);
            if (ans) {
                String path = request.getRealPath("//")+ "profile_pics" + File.separator+user.getUser_profile();
                String pathOldPic = request.getRealPath("//")+ "profile_pics" + File.separator+oldPic;
                //String pathOldPic = request.getRealPath("/")+"profile_pics"+File.separator+user.getUser_profile();
                    //if(!oldPic.equals("default.png")&& !"".equals(img_name)){
                       Helper.deleteFile(pathOldPic);
                    //}
                if (Helper.saveFile(part.getInputStream(), path)) {
                    out.println("Updated Succesfully");
                    Message msg = new Message("Profile Details Updated SuccesFully !", "success", "alert-success");
                    session.setAttribute("msg", msg);
                } else {
                    Message msg = new Message("Something went wrong!", "error", "alert-danger");
                    session.setAttribute("msg", msg);
                }
                Message msg = new Message("Profile Details Updated SuccesFully !", "success", "alert-success");
                session.setAttribute("msg", msg);
            } else {
                out.println("Try again");
                Message msg = new Message("Something went wrong!", "error", "alert-danger");
                session.setAttribute("msg", msg);
            }
            response.sendRedirect("profile.jsp");
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
        processRequest(request, response);
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
