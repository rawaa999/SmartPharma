<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.List, model.Fournisseur"%>
<html>
<head>
    <title>Liste Fournisseurs</title>
    <style>
        body { font-family: Arial; margin: 40px; background: #f4f4f4; }
        h2 { color: #333; display: inline-block; }
        table { background: white; border-collapse: collapse; width: 100%; border-radius: 8px; overflow: hidden; margin-top: 20px; }
        th { background: #3498db; color: white; padding: 12px; }
        td { padding: 10px; border-bottom: 1px solid #eee; text-align: center; }
        tr:hover { background: #f9f9f9; }
        a.btn    { background: #3498db; color: white; padding: 8px 16px; border-radius: 4px; text-decoration: none; }
        a.mod    { background: #f39c12; color: white; padding: 6px 12px; border-radius: 4px; text-decoration: none; }
        a.del    { background: #e74c3c; color: white; padding: 6px 12px; border-radius: 4px; text-decoration: none; }
        a.back   { background: #4CAF50; color: white; padding: 8px 16px; border-radius: 4px; text-decoration: none; }
        a.dash   { background: #9b59b6; color: white; padding: 8px 16px; border-radius: 4px; text-decoration: none; }
        a.logout { background: #e74c3c; color: white; padding: 8px 16px; border-radius: 4px; text-decoration: none; }
    </style>
</head>
<body>
    <h2>Liste des Fournisseurs</h2>
    <div style="float:right;">
        <a class="dash" href="DashboardServlet">Dashboard</a>
        &nbsp;
        <a class="back" href="MedicamentServlet">Médicaments</a>
        &nbsp;
        <a class="logout" href="LogoutServlet">Déconnexion</a>
    </div>
    <br/><br/>
    <a class="btn" href="FournisseurServlet?action=formulaire">+ Ajouter</a>
    <br/><br/>
    <table>
        <tr>
            <th>ID</th><th>Nom</th><th>Téléphone</th><th>Action</th>
        </tr>
        <%
            List<Fournisseur> liste = (List<Fournisseur>) request.getAttribute("liste");
            if (liste != null) {
                for (Fournisseur f : liste) {
        %>
        <tr>
            <td><%= f.getId() %></td>
            <td><%= f.getNom() %></td>
            <td><%= f.getTelephone() %></td>
            <td>
                <a class="mod" href="FournisseurServlet?action=modifier&id=<%= f.getId() %>">Modifier</a>
                &nbsp;
                <a class="del" href="FournisseurServlet?action=supprimer&id=<%= f.getId() %>"
                   onclick="return confirm('Supprimer?')">Supprimer</a>
            </td>
        </tr>
        <% } } %>
    </table>
</body>
</html>