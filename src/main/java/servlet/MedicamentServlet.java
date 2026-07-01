package servlet;
import model.Medicament;
import repository.MedicamentRepository;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.Date;
import java.util.List;
public class MedicamentServlet extends HttpServlet {
    MedicamentRepository repo = new MedicamentRepository();
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        try {
            if ("formulaire".equals(action)) {
                req.getRequestDispatcher("/ajouter.jsp").forward(req, res);
            } else if ("supprimer".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                repo.supprimer(id);
                res.sendRedirect("MedicamentServlet?action=liste");
            } else if ("modifier".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                Medicament m = repo.getMedicamentById(id);
                req.setAttribute("medicament", m);
                req.getRequestDispatcher("/modifier.jsp").forward(req, res);
            } else if ("rechercher".equals(action)) {
                String nom = req.getParameter("nom");
                List<Medicament> liste = repo.rechercher(nom);
                req.setAttribute("liste", liste);
                req.setAttribute("recherche", nom);
                req.getRequestDispatcher("/liste.jsp").forward(req, res);
            } else {
                List<Medicament> liste = repo.listerTous();
                req.setAttribute("liste", liste);
                req.getRequestDispatcher("/liste.jsp").forward(req, res);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        try {
            if ("update".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                String nom = req.getParameter("nom");
                double prix = Double.parseDouble(req.getParameter("prix"));
                int quantite = Integer.parseInt(req.getParameter("quantite"));
                Date date = Date.valueOf(req.getParameter("dateExpiration"));
                Medicament m = new Medicament(id, nom, prix, quantite, date);
                repo.modifier(m);
                res.sendRedirect("MedicamentServlet?action=liste");
            } else {
                String nom = req.getParameter("nom");
                double prix = Double.parseDouble(req.getParameter("prix"));
                int quantite = Integer.parseInt(req.getParameter("quantite"));
                Date date = Date.valueOf(req.getParameter("dateExpiration"));
                Medicament m = new Medicament(0, nom, prix, quantite, date);
                repo.ajouter(m);
                res.sendRedirect("MedicamentServlet?action=liste");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}