package pl.bgawrych.invoice.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import pl.bgawrych.invoice.Model.Customer;
import pl.bgawrych.invoice.Repository.CustomerRepository;
import pl.bgawrych.invoice.Repository.InvoiceRepository;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class CustomerController {

    @Autowired
    CustomerRepository customerRepository;

    @Autowired
    InvoiceRepository invoiceRepository;


    @RequestMapping(value = "/addCustomer",method = RequestMethod.POST, headers = "Content-Type=application/json")
    public ResponseEntity<?> addCustomer(@RequestBody @Valid Customer customer, HttpServletRequest x){
        customerRepository.save(customer);
        return ResponseEntity.ok().build();
    }

    @RequestMapping("/edit/*")
    public String klient(){
        return "klient";
    }
    @GetMapping("/klient/{cid}")
    public ResponseEntity<Object> getConsumerInvoices(@PathVariable Long cid){
        Customer customer =customerRepository.findById(cid).orElse(null);
        if(customer == null) return ResponseEntity.notFound().build();
        return ResponseEntity.ok(customer);
    }


}
