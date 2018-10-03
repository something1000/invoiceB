package pl.bgawrych.invoice.Model;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.SortedList;
import pl.bgawrych.invoice.Converter.LocalDateXmlAdapter;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
import java.time.LocalDate;
import java.time.temporal.TemporalField;
import java.util.Comparator;
import java.util.List;

@XmlRootElement(name="root")
public class RaportInvoiceList {

    @XmlElement(name="date")
    @XmlJavaTypeAdapter(value = LocalDateXmlAdapter.class)
    private LocalDate date;

    @XmlElement(name="month")
    private String month;

    @XmlElement(name="lista")
    private SortedList<Invoice> sortedList;

    @XmlElement(name="razem")
    private int razem;

    public RaportInvoiceList(){}

    public RaportInvoiceList(List<Invoice> list){
        sortedList = new SortedList<Invoice>(FXCollections.observableList(list),
                (o1, o2) -> o1.getNumerWMiesiacu() - o2.getNumerWMiesiacu());
        date = sortedList.get(0).getDataWystawienia().minusDays(sortedList.get(0).getDataWystawienia().getDayOfMonth()-1);

        switch(date.getMonth()){
            case JANUARY:
                month = "Styczeń";
                break;
            case FEBRUARY:
                month = "Luty";
                break;
            case MARCH:
                month = "Marzec";
                break;
            case APRIL:
                month = "Kwiecień";
                break;
            case MAY:
                month = "Maj";
                break;
            case JUNE:
                month = "Czerwiec";
                break;
            case JULY:
                month = "Lipiec";
                break;
            case AUGUST:
                month = "Sierpień";
                break;
            case SEPTEMBER:
                month = "Wrzesień";
                break;
            case OCTOBER:
                month = "Październik";
                break;
            case NOVEMBER:
                month = "Listopad";
                break;
            case DECEMBER:
                month = "Grudzień";
                break;
        }

        razem = 0;
        sortedList.forEach(x->razem += x.getIlosc());
    }


    public SortedList<Invoice> getList(){
        return sortedList;
    }
}

