<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.List, model.Medicament, java.time.LocalDate"%>
<html>
<head>
    <title>Liste Médicaments</title>
    <style>
        body { font-family: Arial; margin: 40px; background: #f4f4f4; }
        h2 { color: #333; display: inline-block; }
        table { background: white; border-collapse: collapse; width: 100%; border-radius: 8px; overflow: hidden; margin-top: 20px; }
        th { background: #4CAF50; color: white; padding: 12px; }
        td { padding: 10px; border-bottom: 1px solid #eee; text-align: center; }
        a.btn    { background: #4CAF50; color: white; padding: 8px 16px; border-radius: 4px; text-decoration: none; }
        a.mod    { background: #f39c12; color: white; padding: 6px 12px; border-radius: 4px; text-decoration: none; }
        a.del    { background: #e74c3c; color: white; padding: 6px 12px; border-radius: 4px; text-decoration: none; }
        a.four   { background: #3498db; color: white; padding: 8px 16px; border-radius: 4px; text-decoration: none; }
        a.dash   { background: #9b59b6; color: white; padding: 8px 16px; border-radius: 4px; text-decoration: none; }
        a.logout { background: #e74c3c; color: white; padding: 8px 16px; border-radius: 4px; text-decoration: none; }
        .legende { margin-top: 10px; margin-bottom: 10px; font-size: 13px; }
        .legende span { padding: 4px 10px; border-radius: 4px; margin-right: 10px; }
        .leg-rouge { background: #fde8e8; border: 1px solid #e74c3c; }
        .leg-jaune { background: #fef9e7; border: 1px solid #f39c12; }
        .search-form { display:inline-block; margin-left:10px; }
        .search-form input[type=text] { padding:8px; border:1px solid #ddd; border-radius:4px; width:200px; }
        .search-form button { padding:8px 16px; background:#3498db; color:white; border:none; border-radius:4px; cursor:pointer; }
        .search-form a { padding:8px 16px; background:#95a5a6; color:white; border-radius:4px; text-decoration:none; }
    </style>
</head>
<body>
    <h2>Liste des Médicaments</h2>
    <div style="float:right;">
        <a class="dash" href="DashboardServlet">Dashboard</a>
        &nbsp;
        <a class="four" href="FournisseurServlet">Fournisseurs</a>
        &nbsp;
        <a class="logout" href="LogoutServlet">Déconnexion</a>
    </div>
    <br/><br/>
    <a class="btn" href="MedicamentServlet?action=formulaire">+ Ajouter</a>

    <form action="MedicamentServlet" method="get" class="search-form">
        <input type="hidden" name="action" value="rechercher"/>
        <input type="text" name="nom" placeholder="Rechercher un médicament..."
               value="<%= request.getAttribute("recherche") != null ? request.getAttribute("recherche") : "" %>"/>
        <button type="submit">🔍 Rechercher</button>
        <a href="MedicamentServlet">Réinitialiser</a>
    </form>

    <div class="legende">
        <span class="leg-rouge">🔴 Rupture de Stock (quantité = 0)</span>
        <span class="leg-jaune">🟡 Stock Faible (moins de 10)</span>
    </div>

    <table>
        <tr>
            <th>ID</th><th>Nom</th><th>Prix</th><th>Quantité</th><th>Date Expiration</th><th>Action</th>
        </tr>
        <%
            List<Medicament> liste = (List<Medicament>) request.getAttribute("liste");
            if (liste != null) {
                for (Medicament m : liste) {
                    String bgColor = "";
                    if (m.getQuantite() == 0) {
                        bgColor = "#fde8e8"; // Rupture de stock -> rouge
                    } else if (m.getQuantite() < 10) {
                        bgColor = "#fef9e7"; // Stock faible -> jaune
                    }
        %>
        <tr style="background-color: <%= bgColor %>;">
            <td><%= m.getId() %></td>
            <td><%= m.getNom() %></td>
            <td><%= m.getPrix() %></td>
            <td><%= m.getQuantite() %></td>
            <td><%= m.getDateExpiration() %></td>
            <td>
                <a class="mod" href="MedicamentServlet?action=modifier&id=<%= m.getId() %>">Modifier</a>
                &nbsp;
                <a class="del" href="MedicamentServlet?action=supprimer&id=<%= m.getId() %>"
                   onclick="return confirm('Supprimer?')">Supprimer</a>
            </td>
        </tr>
        <% } } %>
    </table>
</body>
</html>