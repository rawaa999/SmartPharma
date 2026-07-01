package servlet;

import model.Admin;
import repository.AdminRepository;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;

public class LoginServlet extends HttpServlet {

    AdminRepository repo = new AdminRepository();

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        try {
            Admin admin = repo.login(email, password);
            if (admin != null) {
                HttpSession session = req.getSession();
                session.setAttribute("admin", admin);
                res.sendRedirect("MedicamentServlet");
            } else {
                req.setAttribute("error", "Email ou mot de passe incorrect");
                req.getRequestDispatcher("/login.jsp").forward(req, res);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, res);
    }
}
