package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import util.DBConnection;
import java.io.*;
import java.sql.*;

public class DashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        Connection conn = DBConnection.getConnection();
        try {
            ResultSet rs1 = conn.createStatement()
                .executeQuery("SELECT COUNT(*) FROM medicament");
            rs1.next();
            int totalMedicaments = rs1.getInt(1);

            ResultSet rs2 = conn.createStatement()
                .executeQuery("SELECT COUNT(*) FROM fournisseur");
            rs2.next();
            int totalFournisseurs = rs2.getInt(1);

            ResultSet rs3 = conn.createStatement()
                .executeQuery("SELECT COUNT(*) FROM medicament WHERE date_expiration < CURDATE()");
            rs3.next();
            int expiredMedicaments = rs3.getInt(1);

            ResultSet rs4 = conn.createStatement()
                .executeQuery("SELECT COUNT(*) FROM medicament WHERE quantite < 10");
            rs4.next();
            int lowStock = rs4.getInt(1);

            req.setAttribute("totalMedicaments", totalMedicaments);
            req.setAttribute("totalFournisseurs", totalFournisseurs);
            req.setAttribute("expiredMedicaments", expiredMedicaments);
            req.setAttribute("lowStock", lowStock);

            req.getRequestDispatcher("/dashboard.jsp").forward(req, res);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}