<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="model.Fournisseur"%>
<html>
<head>
    <title>Modifier Fournisseur</title>
    <style>
        body { font-family: Arial; margin: 40px; background: #f4f4f4; }
        form { background: white; padding: 30px; border-radius: 8px; width: 400px; }
        input { width: 100%; padding: 8px; margin: 8px 0 16px; border: 1px solid #ddd; border-radius: 4px; }
        button { background: #f39c12; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
        a { color: #666; text-decoration: none; margin-left: 10px; }
    </style>
</head>
<body>
    <h2>Modifier Fournisseur</h2>
    <%  Fournisseur f = (Fournisseur) request.getAttribute("fournisseur"); %>
    <form action="FournisseurServlet" method="post">
        <input type="hidden" name="action" value="update"/>
        <input type="hidden" name="id" value="<%= f.getId() %>"/>
        <label>Nom:</label>
        <input type="text" name="nom" value="<%= f.getNom() %>" required/>
        <label>Téléphone:</label>
        <input type="text" name="telephone" value="<%= f.getTelephone() %>" required/>
        <button type="submit">Modifier</button>
        <a href="FournisseurServlet">Retour</a>
    </form>
</body>
</html>