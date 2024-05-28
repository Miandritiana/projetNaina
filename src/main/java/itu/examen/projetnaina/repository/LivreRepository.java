package itu.examen.projetnaina.repository;

import itu.examen.projetnaina.model.Livre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface LivreRepository extends JpaRepository<Livre, Long> {
    @Override
    List<Livre> findAll();

    @Override
    Optional<Livre> findById(Long aLong);

    @Query("SELECT l FROM Livre l WHERE LOWER(l.titre) LIKE LOWER(CONCAT('%', :searchTerm, '%')) " +
            "OR LOWER(l.auteur) LIKE LOWER(CONCAT('%', :searchTerm, '%')) " +
            "OR LOWER(l.collection) LIKE LOWER(CONCAT('%', :searchTerm, '%')) " +
            "OR LOWER(l.langue) LIKE LOWER(CONCAT('%', :searchTerm, '%')) " +
            "OR LOWER(l.motcle) LIKE LOWER(CONCAT('%', :searchTerm, '%')) " +
            "OR CAST(l.date_edition AS string) LIKE CONCAT('%', :searchTerm, '%')")
    List<Livre> searchLivres(@Param("searchTerm") String searchTerm);
}
