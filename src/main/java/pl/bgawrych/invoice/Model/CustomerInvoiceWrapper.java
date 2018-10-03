package pl.bgawrych.invoice.Model;

import javax.xml.bind.annotation.*;

@XmlRootElement(name="info")
@XmlAccessorType(value = XmlAccessType.FIELD)
public class CustomerInvoiceWrapper {

    @XmlElement(name = "klient")
    private Customer customer;
    @XmlElement(name = "faktura")
    private Invoice invoice;

    public CustomerInvoiceWrapper(Customer customer, Invoice invoice) {
        this.customer = customer;
        this.invoice = invoice;
    }

    public CustomerInvoiceWrapper() {
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Invoice getInvoice() {
        return invoice;
    }

    public void setInvoice(Invoice invoice) {
        this.invoice = invoice;
    }
}
