package servlet;

import model.Fournisseur;
import repository.FournisseurRepository;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.List;

public class FournisseurServlet extends HttpServlet {

    FournisseurRepository repo = new FournisseurRepository();

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        try {
            if ("formulaire".equals(action)) {
                req.getRequestDispatcher("/ajouterFournisseur.jsp").forward(req, res);
            } else if ("supprimer".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                repo.supprimer(id);
                res.sendRedirect("FournisseurServlet");
            } else if ("modifier".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                Fournisseur f = repo.getFournisseurById(id);
                req.setAttribute("fournisseur", f);
                req.getRequestDispatcher("/modifierFournisseur.jsp").forward(req, res);
            } else {
                List<Fournisseur> liste = repo.listerTous();
                req.setAttribute("liste", liste);
                req.getRequestDispatcher("/listeFournisseurs.jsp").forward(req, res);
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
                String telephone = req.getParameter("telephone");
                Fournisseur f = new Fournisseur(id, nom, telephone);
                repo.modifier(f);
            } else {
                String nom = req.getParameter("nom");
                String telephone = req.getParameter("telephone");
                Fournisseur f = new Fournisseur(0, nom, telephone);
                repo.ajouter(f);
            }
            res.sendRedirect("FournisseurServlet");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
