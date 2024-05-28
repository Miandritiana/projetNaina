package itu.examen.projetnaina.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.sql.Timestamp;

@Entity
@Table(name = "livre")
public class Livre {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Titre is mandatory")
    @Size(max = 255, message = "Titre cannot exceed 255 characters")
    private String titre;

    @NotBlank(message = "Auteur is mandatory")
    @Size(max = 255, message = "Auteur cannot exceed 255 characters")
    private String auteur;

    @Size(max = 255, message = "Collection cannot exceed 255 characters")
    private String collection;

    @Size(max = 255, message = "Resume cannot exceed 255 characters")
    private String resume;

    @NotNull(message = "ID Categorie is mandatory")
    @ManyToOne
    @JoinColumn(name = "id_categorie", referencedColumnName = "id")
    private Categorie categorie;

    @Size(max = 255, message = "Tome cannot exceed 255 characters")
    private String tome;

    @Size(max = 255, message = "Motcle cannot exceed 255 characters")
    private String motcle;

    @Size(max = 255, message = "Langue cannot exceed 255 characters")
    private String langue;

    @Size(max = 255, message = "Num Code cannot exceed 255 characters")
    private String num_code;

    @Size(max = 255, message = "ISBN cannot exceed 255 characters")
    private String isbn;

    @Size(max = 255, message = "Edition cannot exceed 255 characters")
    private String edition;

    private Timestamp date_edition;

    @NotNull(message = "Nombre de pages is mandatory")
    private Integer nb_page;

    @Size(max = 255, message = "Couverture cannot exceed 255 characters")
    private String couverture;

    @NotNull(message = "Age Requis is mandatory")
    private Integer age_requis;

    @NotNull(message = "Type Utilisation is mandatory")
    private Integer type_utilisation;

    @Size(max = 5, message = "Emporter cannot exceed 5 characters")
    private String emporter;

    public Livre() {
    }

    // Getters and Setters for all fields
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getAuteur() {
        return auteur;
    }

    public void setAuteur(String auteur) {
        this.auteur = auteur;
    }

    public String getCollection() {
        return collection;
    }

    public void setCollection(String collection) {
        this.collection = collection;
    }

    public String getResume() {
        return resume;
    }

    public void setResume(String resume) {
        this.resume = resume;
    }

    public Categorie getCategorie() {
        return categorie;
    }

    public void setCategorie(Categorie categorie) {
        this.categorie = categorie;
    }

    public String getTome() {
        return tome;
    }

    public void setTome(String tome) {
        this.tome = tome;
    }

    public String getMotcle() {
        return motcle;
    }

    public void setMotcle(String motcle) {
        this.motcle = motcle;
    }

    public String getLangue() {
        return langue;
    }

    public void setLangue(String langue) {
        this.langue = langue;
    }

    public String getNum_code() {
        return num_code;
    }

    public void setNum_code(String num_code) {
        this.num_code = num_code;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getEdition() {
        return edition;
    }

    public void setEdition(String edition) {
        this.edition = edition;
    }

    public Timestamp getDate_edition() {
        return date_edition;
    }

    public void setDate_edition(Timestamp date_edition) {
        this.date_edition = date_edition;
    }

    public Integer getNb_page() {
        return nb_page;
    }

    public void setNb_page(Integer nb_page) {
        this.nb_page = nb_page;
    }

    public String getCouverture() {
        return couverture;
    }

    public void setCouverture(String couverture) {
        this.couverture = couverture;
    }

    public Integer getAge_requis() {
        return age_requis;
    }

    public void setAge_requis(Integer ageRequis) {
        this.age_requis = ageRequis;
    }

    public Integer getType_utilisation() {
        return type_utilisation;
    }

    public void setType_utilisation(Integer typeUtilisation) {
        this.type_utilisation = typeUtilisation;
    }

    public String getEmporter() {
        return emporter;
    }

    public void setEmporter(String emporter) {
        this.emporter = emporter;
    }
}
