<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Ajouter Fournisseur</title>
    <style>
        body { font-family: Arial; margin: 40px; background: #f4f4f4; }
        form { background: white; padding: 30px; border-radius: 8px; width: 400px; }
        input { width: 100%; padding: 8px; margin: 8px 0 16px; border: 1px solid #ddd; border-radius: 4px; }
        button { background: #3498db; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
        a { color: #666; text-decoration: none; margin-left: 10px; }
    </style>
</head>
<body>
    <h2>Ajouter un Fournisseur</h2>
    <form action="FournisseurServlet" method="post">
        <label>Nom:</label>
        <input type="text" name="nom" required/>
        <label>Téléphone:</label>
        <input type="text" name="telephone" required/>
        <button type="submit">Ajouter</button>
        <a href="FournisseurServlet">Retour</a>
    </form>
</body>
</html>