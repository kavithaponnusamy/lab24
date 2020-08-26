package co.grandcircus.lab24;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface PartyRepo extends JpaRepository<Party, Long>{
	
	
	List<Party> findByNameContainsIgnoreCase(String name);
	@Query("from Party order by date Desc")  
	List<Party>findAllOrderByDateDesc();

}
