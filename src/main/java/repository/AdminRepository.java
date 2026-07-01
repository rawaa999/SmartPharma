package repository;

import model.Admin;
import util.DBConnection;
import java.sql.*;

public class AdminRepository {

    private Connection cn = DBConnection.getConnection();

    public Admin login(String email, String password) throws SQLException {
        String sql = "SELECT * FROM admin_user WHERE email=? AND password=?";
        PreparedStatement ps = cn.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return new Admin(
                rs.getInt("id"),
                rs.getString("email"),
                rs.getString("password")
            );
        }
        return null;
    }
}