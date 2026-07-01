<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Dashboard - SmartPharma</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial; background: #f4f4f4; }

        .header {
            background: #2ecc71;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header h1 { font-size: 22px; }
        .nav a {
            color: white;
            text-decoration: none;
            margin-left: 15px;
            padding: 7px 15px;
            border-radius: 4px;
            background: rgba(255,255,255,0.2);
        }
        .nav a:hover { background: rgba(255,255,255,0.4); }

        .container { padding: 30px; }

        .cards {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            margin-bottom: 30px;
        }
        .card {
            flex: 1;
            min-width: 200px;
            background: white;
            border-radius: 10px;
            padding: 25px;
            text-align: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .card .number {
            font-size: 48px;
            font-weight: bold;
            margin: 10px 0;
        }
        .card .label { color: #666; font-size: 14px; }
        .card.green .number { color: #2ecc71; }
        .card.blue .number  { color: #3498db; }
        .card.red .number   { color: #e74c3c; }
        .card.orange .number{ color: #f39c12; }

        .section {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .section h3 { margin-bottom: 15px; color: #333; }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            color: white;
            margin-right: 10px;
        }
        .btn-green  { background: #2ecc71; }
        .btn-blue   { background: #3498db; }
    </style>
</head>
<body>

<div class="header">
    <h1>🏥 SmartPharma Dashboard</h1>
    <div class="nav">
        <a href="MedicamentServlet">Médicaments</a>
        <a href="FournisseurServlet">Fournisseurs</a>
        <a href="LogoutServlet">Déconnexion</a>
    </div>
</div>

<div class="container">

    <div class="cards">
        <div class="card green">
            <div class="label">Total Médicaments</div>
            <div class="number"><%= request.getAttribute("totalMedicaments") %></div>
            <div class="label">médicaments enregistrés</div>
        </div>
        <div class="card blue">
            <div class="label">Total Fournisseurs</div>
            <div class="number"><%= request.getAttribute("totalFournisseurs") %></div>
            <div class="label">fournisseurs enregistrés</div>
        </div>
        <div class="card red">
            <div class="label">Médicaments Expirés</div>
            <div class="number"><%= request.getAttribute("expiredMedicaments") %></div>
            <div class="label">à retirer du stock</div>
        </div>
        <div class="card orange">
            <div class="label">Stock Faible</div>
            <div class="number"><%= request.getAttribute("lowStock") %></div>
            <div class="label">quantité moins de 10</div>
        </div>
    </div>

    <div class="section">
        <h3>🔗 Accès Rapide</h3>
        <br/>
        <a class="btn btn-green" href="MedicamentServlet?action=formulaire">+ Ajouter Médicament</a>
        <a class="btn btn-blue" href="FournisseurServlet?action=formulaire">+ Ajouter Fournisseur</a>
    </div>

</div>
</body>
</html>