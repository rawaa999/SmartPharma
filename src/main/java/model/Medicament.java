package model;

import java.sql.Date;

public class Medicament {
    private int id;
    private String nom;
    private double prix;
    private int quantite;
    private Date dateExpiration;

    public Medicament() {}

    public Medicament(int id, String nom, double prix,
                      int quantite, Date dateExpiration) {
        this.id = id;
        this.nom = nom;
        this.prix = prix;
        this.quantite = quantite;
        this.dateExpiration = dateExpiration;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }
    public double getPrix() { return prix; }
    public void setPrix(double prix) { this.prix = prix; }
    public int getQuantite() { return quantite; }
    public void setQuantite(int quantite) { this.quantite = quantite; }
    public Date getDateExpiration() { return dateExpiration; }
    public void setDateExpiration(Date d) { this.dateExpiration = d; }
}