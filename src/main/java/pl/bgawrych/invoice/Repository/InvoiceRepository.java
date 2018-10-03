package pl.bgawrych.invoice.Repository;

import javafx.collections.ObservableList;
import javafx.collections.transformation.SortedList;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import pl.bgawrych.invoice.Model.Invoice;

import java.time.LocalDate;
import java.util.List;


public interface InvoiceRepository extends PagingAndSortingRepository<Invoice,Long>{
    int countAllByDataWystawieniaAfter(LocalDate date);
    List<Invoice> findAllByCustomerCid(@Param(value = "cid")Long cid);
    Invoice findByIid(@Param(value="iid")Long iid);
    List<Invoice> findAllByDataWystawieniaBetween(@Param(value="startdate") LocalDate startdate, @Param(value="enddate") LocalDate enddate);
}
