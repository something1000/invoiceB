package pl.bgawrych.invoice.Repository;

import org.springframework.data.repository.CrudRepository;
import pl.bgawrych.invoice.Model.Good;


public interface GoodsRepository extends CrudRepository<Good, Long>{
    public Good findGoodByKod(String kod);
    public Good findGoodByNazwa(String nazwa);
}
