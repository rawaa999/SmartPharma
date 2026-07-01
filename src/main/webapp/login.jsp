<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>SmartPharma - Login</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial; background: #f4f4f4; display: flex; justify-content: center; align-items: center; height: 100vh; }
        .login-box { background: white; padding: 40px; border-radius: 10px; width: 380px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #4CAF50; margin-bottom: 30px; }
        label { font-size: 13px; color: #555; }
        input { width: 100%; padding: 10px; margin: 6px 0 16px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px; }
        button { width: 100%; padding: 12px; background: #4CAF50; color: white; border: none; border-radius: 4px; font-size: 15px; cursor: pointer; }
        button:hover { background: #45a049; }
        .error { background: #ffebee; color: #c62828; padding: 10px; border-radius: 4px; margin-bottom: 16px; font-size: 13px; }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>🏥 SmartPharma</h2>
        <% String error = (String) request.getAttribute("error");
           if (error != null) { %>
            <div class="error"><%= error %></div>
        <% } %>
        <form action="LoginServlet" method="post">
            <label>Email:</label>
            <input type="email" name="email" placeholder="admin@gmail.com" required/>
            <label>Mot de passe:</label>
            <input type="password" name="password" placeholder="••••••" required/>
            <button type="submit">Se connecter</button>
        </form>
    </div>
</body>
</html>