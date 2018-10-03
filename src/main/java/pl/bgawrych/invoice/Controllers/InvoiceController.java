package pl.bgawrych.invoice.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import pl.bgawrych.invoice.Model.Good;
import pl.bgawrych.invoice.Model.Invoice;
import pl.bgawrych.invoice.Repository.GoodsRepository;
import pl.bgawrych.invoice.Repository.InvoiceRepository;
import pl.bgawrych.invoice.Services.InvoiceService;

import javax.validation.Valid;
import java.util.HashMap;

@Controller
public class InvoiceController {

    @Autowired
    InvoiceService invoiceService;

    @Autowired
    InvoiceRepository invoiceRepository;

    @Autowired
    GoodsRepository goodsRepository;

    @RequestMapping("/invoicesList")
    @ResponseBody
    public ResponseEntity getInvoiceList(){
        HashMap<String,Object> x = invoiceService.getGoodsList();
        return ResponseEntity.ok().body(x);
    }

    @RequestMapping("/faktury/*")
    public String faktury(){
        return "faktury";
    }

    @GetMapping("/edit-invoice/*")
    public String edycjaFaktur(){
        return "edycja_faktur";
    }


    @PutMapping("/edit-invoice/{iid}")
    @ResponseBody
    public ResponseEntity editInvoice(@RequestBody Invoice invoice, @PathVariable(name="iid") Long iid){

        Invoice toUpdate = invoiceRepository.findByIid(iid);
        if(toUpdate == null) return ResponseEntity.noContent().build();

        toUpdate.setNazwa(invoice.getNazwa());
        System.out.println(invoice.getNazwa());
        toUpdate.setKod(goodsRepository.findGoodByNazwa(invoice.getNazwa()).getKod());
        toUpdate.setIlosc(invoice.getIlosc());
        toUpdate.setPrzeznaczenie(invoice.getPrzeznaczenie());

        invoiceRepository.save(toUpdate);
        return ResponseEntity.ok().build();
    }
}
