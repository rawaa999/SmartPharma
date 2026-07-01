package repository;

import model.Fournisseur;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FournisseurRepository {

    private Connection cn = DBConnection.getConnection();

    public void ajouter(Fournisseur f) throws SQLException {
        String sql = "INSERT INTO fournisseur(nom,telephone) VALUES(?,?)";
        PreparedStatement ps = cn.prepareStatement(sql);
        ps.setString(1, f.getNom());
        ps.setString(2, f.getTelephone());
        ps.executeUpdate();
        ps.close();
    }

    public List<Fournisseur> listerTous() throws SQLException {
        List<Fournisseur> liste = new ArrayList<>();
        String sql = "SELECT * FROM fournisseur ORDER BY id";
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery(sql);
        while (rs.next()) {
            liste.add(new Fournisseur(
                rs.getInt("id"),
                rs.getString("nom"),
                rs.getString("telephone")
            ));
        }
        rs.close();
        st.close();
        return liste;
    }

    public void supprimer(int id) throws SQLException {
        String sql = "DELETE FROM fournisseur WHERE id=?";
        PreparedStatement ps = cn.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
        ps.close();
    }

    public Fournisseur getFournisseurById(int id) throws SQLException {
        String sql = "SELECT * FROM fournisseur WHERE id=?";
        PreparedStatement ps = cn.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return new Fournisseur(
                rs.getInt("id"),
                rs.getString("nom"),
                rs.getString("telephone")
            );
        }
        return null;
    }

    public void modifier(Fournisseur f) throws SQLException {
        String sql = "UPDATE fournisseur SET nom=?, telephone=? WHERE id=?";
        PreparedStatement ps = cn.prepareStatement(sql);
        ps.setString(1, f.getNom());
        ps.setString(2, f.getTelephone());
        ps.setInt(3, f.getId());
        ps.executeUpdate();
        ps.close();
    }
}