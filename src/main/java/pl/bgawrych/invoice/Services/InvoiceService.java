package pl.bgawrych.invoice.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.bgawrych.invoice.Repository.GoodsRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class InvoiceService {

    @Autowired
    GoodsRepository goodsRepository;

    public HashMap<String,Object> getGoodsList(){
        HashMap<String,Object> x = new HashMap<>();
        List<String> goodsList = new ArrayList<>();
        goodsRepository.findAll().forEach(good->
                goodsList.add(good.getNazwa())
        );
        x.put("invoices",goodsList);
        return x;
    }
}
