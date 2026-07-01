package repository;
import model.Medicament;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MedicamentRepository {
    private Connection cn = DBConnection.getConnection();

    public void ajouter(Medicament m) throws SQLException {
        String sql = "INSERT INTO medicament(nom,prix,quantite,date_expiration) VALUES(?,?,?,?)";
        PreparedStatement ps = cn.prepareStatement(sql);
        ps.setString(1, m.getNom());
        ps.setDouble(2, m.getPrix());
        ps.setInt(3, m.getQuantite());
        ps.setDate(4, m.getDateExpiration());
        ps.executeUpdate();
        ps.close();
    }

    public List<Medicament> listerTous() throws SQLException {
        List<Medicament> liste = new ArrayList<>();
        String sql = "SELECT * FROM medicament ORDER BY id";
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery(sql);
        while (rs.next()) {
            liste.add(new Medicament(
                rs.getInt("id"),
                rs.getString("nom"),
                rs.getDouble("prix"),
                rs.getInt("quantite"),
                rs.getDate("date_expiration")
            ));
        }
        rs.close();
        st.close();
        return liste;
    }

    public void supprimer(int id) throws SQLException {
        String sql = "DELETE FROM medicament WHERE id=?";
        PreparedStatement ps = cn.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
        ps.close();
    }

    public Medicament getMedicamentById(int id) throws SQLException {
        String sql = "SELECT * FROM medicament WHERE id=?";
        PreparedStatement ps = cn.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return new Medicament(
                rs.getInt("id"),
                rs.getString("nom"),
                rs.getDouble("prix"),
                rs.getInt("quantite"),
                rs.getDate("date_expiration")
            );
        }
        rs.close();
        ps.close();
        return null;
    }

    public void modifier(Medicament m) throws SQLException {
        String sql = "UPDATE medicament SET nom=?, prix=?, quantite=?, date_expiration=? WHERE id=?";
        PreparedStatement ps = cn.prepareStatement(sql);
        ps.setString(1, m.getNom());
        ps.setDouble(2, m.getPrix());
        ps.setInt(3, m.getQuantite());
        ps.setDate(4, m.getDateExpiration());
        ps.setInt(5, m.getId());
        ps.executeUpdate();
        ps.close();
    }

    public List<Medicament> rechercher(String nom) throws SQLException {
        List<Medicament> liste = new ArrayList<>();
        String sql = "SELECT * FROM medicament WHERE nom LIKE ? ORDER BY id";
        PreparedStatement ps = cn.prepareStatement(sql);
        ps.setString(1, "%" + nom + "%");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            liste.add(new Medicament(
                rs.getInt("id"),
                rs.getString("nom"),
                rs.getDouble("prix"),
                rs.getInt("quantite"),
                rs.getDate("date_expiration")
            ));
        }
        rs.close();
        ps.close();
        return liste;
    }
}