<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="model.Medicament"%>
<html>
<head>
    <title>Modifier Médicament</title>
    <style>
        body { font-family: Arial; margin: 40px; background: #f4f4f4; }
        form { background: white; padding: 30px; border-radius: 8px; width: 400px; }
        input { width: 100%; padding: 8px; margin: 8px 0 16px; border: 1px solid #ddd; border-radius: 4px; }
        button { background: #f39c12; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
        a { color: #666; text-decoration: none; margin-left: 10px; }
    </style>
</head>
<body>
    <h2>Modifier Médicament</h2>
    <%
        Medicament m = (Medicament) request.getAttribute("medicament");
    %>
    <form action="MedicamentServlet" method="post">
        <input type="hidden" name="action" value="update"/>
        <input type="hidden" name="id" value="<%= m.getId() %>"/>
        <label>Nom:</label>
        <input type="text" name="nom" value="<%= m.getNom() %>" required/>
        <label>Prix:</label>
        <input type="number" step="0.01" name="prix" value="<%= m.getPrix() %>" required/>
        <label>Quantité:</label>
        <input type="number" name="quantite" value="<%= m.getQuantite() %>" required/>
        <label>Date d'expiration:</label>
        <input type="date" name="dateExpiration" value="<%= m.getDateExpiration() %>" required/>
        <button type="submit">Modifier</button>
        <a href="MedicamentServlet">Retour</a>
    </form>
</body>
</html>