<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Ajouter Médicament</title>
    <style>
        body { font-family: Arial; margin: 40px; background: #f4f4f4; }
        form { background: white; padding: 30px; border-radius: 8px; width: 400px; }
        input { width: 100%; padding: 8px; margin: 8px 0 16px; border: 1px solid #ddd; border-radius: 4px; }
        button { background: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
        a { color: #666; text-decoration: none; margin-left: 10px; }
    </style>
</head>
<body>
    <h2>Ajouter un Médicament</h2>
    <form action="MedicamentServlet" method="post">
        <label>Nom:</label>
        <input type="text" name="nom" required/>
        <label>Prix:</label>
        <input type="number" step="0.01" name="prix" required/>
        <label>Quantité:</label>
        <input type="number" name="quantite" required/>
        <label>Date d'expiration:</label>
        <input type="date" name="dateExpiration" required/>
        <button type="submit">Ajouter</button>
        <a href="MedicamentServlet">Retour à la liste</a>
    </form>
</body>
</html>