package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static Connection cn;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            cn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/smartpharma",
                "root",
                ""
            );
            System.out.println("Connexion MySQL reussie !");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cn;
    }
}