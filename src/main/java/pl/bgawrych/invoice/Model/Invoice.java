package pl.bgawrych.invoice.Model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import pl.bgawrych.invoice.Converter.LocalDateXmlAdapter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.*;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
import java.time.LocalDate;

@Entity
@XmlRootElement(name="faktura")
@XmlAccessorType(value = XmlAccessType.FIELD)
@Table(name="INVOICES")
public class Invoice{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long iid;

    @NotNull
    private String nazwa;

    private String kod;

    @NotNull
    private double ilosc;

    @NotNull
    private String przeznaczenie;

    private int numerWMiesiacu;

    public int getNumerWMiesiacu() {
        return numerWMiesiacu;
    }

    public void setNumerWMiesiacu(int numerWMiesiacu) {
        this.numerWMiesiacu = numerWMiesiacu;
    }

    // @Convert(converter = LocalDateAttributeConverter.class)
    @XmlJavaTypeAdapter(type=LocalDate.class, value = LocalDateXmlAdapter.class)
    @XmlElement(name="data",type = String.class)
    private LocalDate dataWystawienia;

    @ManyToOne
    @JoinColumn(name = "customer_cid")
    @JsonIgnore
    private Customer customer;


    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Invoice() {
    }

    public Invoice(@NotNull String nazwa, @NotNull double ilosc, @NotNull String przeznaczenie, String kod) {
        this.nazwa = nazwa;
        this.ilosc = ilosc;
        this.przeznaczenie = przeznaczenie;
        this.dataWystawienia = LocalDate.now();
        this.kod = kod;
    }


    public Invoice(@NotNull String nazwa, @NotNull double ilosc, @NotNull String przeznaczenie, LocalDate data) {
        this.nazwa = nazwa;
        this.ilosc = ilosc;
        this.przeznaczenie = przeznaczenie;

        this.dataWystawienia = data;
        if(data == null){
            this.dataWystawienia = LocalDate.now();
        }
    }


    public long getIid() {
        return iid;
    }

    public void setIid(long iid) {
        this.iid = iid;
    }

    public String getNazwa() {
        return nazwa;
    }

    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }

    public double getIlosc() {
        return ilosc;
    }

    public void setIlosc(double ilosc) {
        this.ilosc = ilosc;
    }

    public String getPrzeznaczenie() {
        return przeznaczenie;
    }

    public void setPrzeznaczenie(String przeznaczenie) {
        this.przeznaczenie = przeznaczenie;
    }


    public LocalDate getDataWystawienia() {
        return dataWystawienia;
    }

    public void setDataWystawienia(LocalDate dataWystawienia) {
        this.dataWystawienia = dataWystawienia;
    }

    public String getKod() {
        return kod;
    }

    public void setKod(String kod) {
        this.kod = kod;
    }
}
