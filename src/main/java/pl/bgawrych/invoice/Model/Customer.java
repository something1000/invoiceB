package pl.bgawrych.invoice.Model;

import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.*;
import java.util.List;

@Entity
@XmlRootElement(name="klient")
@XmlAccessorType(value = XmlAccessType.PROPERTY)
@Table(name="CUSTOMER")
public class Customer{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long cid;

    @NotNull
    private String name;

    @NotNull
    private String surname;

    //@JsonIgnore
    @NotNull
    @JsonProperty(access= JsonProperty.Access.WRITE_ONLY)
    private String city;

    //@JsonIgnore
    @JsonProperty(access= JsonProperty.Access.WRITE_ONLY)
    @NotNull
    private String street;

    //@JsonIgnore
    @NotNull
    @JsonProperty(access= JsonProperty.Access.WRITE_ONLY)
    private String postCode;


    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL)
    @XmlTransient
    private List<Invoice> invoices;


    public Customer(@NotNull String name, @NotNull String surname, @NotNull String city, @NotNull String street, @NotNull String postCode) {
        this.name = name;
        this.surname = surname;
        this.city = city;
        this.street = street;
        this.postCode = postCode;
    }
    public Customer(){}

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }
    public void setSurname(String surname) {
        this.surname = surname;
    }

   // @JsonProperty(value = "cid")
    public Long getCid() {
        return cid;
    }

    public void setCid(Long cid) {
        this.cid = cid;
    }

    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }

    public String getStreet() {
        return street;
    }
    public void setStreet(String street) {
        this.street = street;
    }

    public String getPostCode() {
        return postCode;
    }
    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }

    @JsonProperty(value = "address")
    public String getAddres(){
        return this.city + ", " + this.street + ", " + this.postCode;
    }
    @XmlTransient
    public List<Invoice> getInvoices() {
        return invoices;
    }

    public void setInvoices(List<Invoice> invoices) {
        this.invoices = invoices;
    }
}
