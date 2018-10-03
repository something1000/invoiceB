package pl.bgawrych.invoice.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
public class HomeController {

    @Value("#{'${invoices.list}'.split(',')}")
    private List<String> invoiceslist = new ArrayList<>();


    @RequestMapping("/")
    public String home(Model model){
        return "home";
    }

    @RequestMapping("/dodaj_towar")
    public String dodajTowar(){
        return "dodaj_towar";
    }

}
