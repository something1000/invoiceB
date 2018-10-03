package pl.bgawrych.invoice.Repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RestResource;
import pl.bgawrych.invoice.Model.Customer;


public interface CustomerRepository extends PagingAndSortingRepository<Customer,Long> {

    @RestResource(path="nas", rel="nas")
    Page<Customer> findAllByNameContainingAndSurnameContaining(@Param(value = "name")String name, @Param("surname")String surname, Pageable pageable);

    @Override
    @RestResource(exported = false)
    public Customer save(Customer s);

    @Override
    @RestResource(exported = false)
    public void delete(Customer t);
}
