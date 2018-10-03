package pl.bgawrych.invoice.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pl.bgawrych.invoice.Services.PrintService;
import pl.bgawrych.invoice.Model.Invoice;

import javax.validation.Valid;
import java.time.LocalDate;
@RestController
public class PrintController {

    @Autowired
    PrintService printService;

    @GetMapping(value = "/print/{iid}")
    public ResponseEntity<?> printInvoice(@PathVariable Long iid){

        String uri = printService.printInvoiceByID(iid);
        if(uri==null ) return ResponseEntity.notFound().build();
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Location",uri);
        ResponseEntity<?> response= new ResponseEntity<>(null,responseHeaders, HttpStatus.OK);
        return response;
    }

    @PostMapping(value="/printnew/{client}", headers = "Accept=*/*")
    public ResponseEntity<?> addAndPrint(@PathVariable Long client, @RequestBody @Valid Invoice invoice){
        String uri = printService.newInvoicePrint(client,invoice);

        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Location",uri);
        ResponseEntity<?> response= new ResponseEntity<>(null,responseHeaders,HttpStatus.OK);
        return response;
    }

    @GetMapping(value = "/raport/{month}")
    public ResponseEntity<?> printRaport(@PathVariable(name = "month") String month){
        LocalDate raportDate = LocalDate.parse(month + "-01");
        String uri = printService.printMonthlyRaport(raportDate);

        System.out.println(raportDate.plusDays(raportDate.lengthOfMonth()-1));
        System.out.println(raportDate);
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Location",uri);
        ResponseEntity<?> response= new ResponseEntity<>(null,responseHeaders,HttpStatus.OK);
        return response;
    }


}
