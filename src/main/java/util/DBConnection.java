package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static Connection cn;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            String host = System.getenv("MYSQLHOST") != null ? 
                System.getenv("MYSQLHOST") : "localhost";
            String port = System.getenv("MYSQLPORT") != null ? 
                System.getenv("MYSQLPORT") : "3306";
            String db = System.getenv("MYSQLDATABASE") != null ? 
                System.getenv("MYSQLDATABASE") : "smartpharma";
            String user = System.getenv("MYSQLUSER") != null ? 
                System.getenv("MYSQLUSER") : "root";
            String pass = System.getenv("MYSQLPASSWORD") != null ? 
                System.getenv("MYSQLPASSWORD") : "";

            cn = DriverManager.getConnection(
                "jdbc:mysql://" + host + ":" + port + "/" + db,
                user, pass
            );
            System.out.println("Connexion MySQL reussie !");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cn;
    }
}