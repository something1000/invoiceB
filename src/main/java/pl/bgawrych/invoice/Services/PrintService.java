package pl.bgawrych.invoice.Services;

import org.apache.fop.apps.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponentsBuilder;
import pl.bgawrych.invoice.Model.Customer;
import pl.bgawrych.invoice.Model.CustomerInvoiceWrapper;
import pl.bgawrych.invoice.Model.Invoice;
import pl.bgawrych.invoice.Model.RaportInvoiceList;
import pl.bgawrych.invoice.Repository.CustomerRepository;
import pl.bgawrych.invoice.Repository.GoodsRepository;
import pl.bgawrych.invoice.Repository.InvoiceRepository;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.transform.Result;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.time.LocalDate;

@Service
public class PrintService {

    @Autowired
    GoodsRepository goodsRepository;
    @Autowired
    CustomerRepository customerRepository;
    @Autowired
    InvoiceRepository invoiceRepository;
    @Autowired
    GoodsRepository towaryikody;

    @Value("classpath:static/xml/to-pdf.xsl")
    Resource toPDF;
    @Value("classpath:static/xml/to-pdf-raport.xsl")
    Resource toPDFRaport;
    @Value("classpath:static/pdf/conf.conf")
    Resource fopConfig;


    public String printInvoiceByID(Long id){
        Invoice invoice = invoiceRepository.findById(id).orElse(null);
        if(invoice == null) return null;
        return printInvoice(invoice);
    }

    public String newInvoicePrint(Long client, Invoice invoice){

        String uri = null;
        Customer customer = customerRepository.findById(client).get();
        invoice.setDataWystawienia(LocalDate.now());
        invoice.setCustomer(customer);
        invoice.setKod(towaryikody.findGoodByNazwa(invoice.getNazwa()).getKod());
        invoice.setNumerWMiesiacu(invoiceRepository.countAllByDataWystawieniaAfter(LocalDate.now().minusDays(LocalDate.now().getDayOfMonth()))+1);
        invoiceRepository.save(invoice);

        uri = printInvoice(invoice);

        return uri;
    }

    private String printInvoice(Invoice invoice) {
        JAXBContext jaxbContext = null;
        FopFactory fopFactory = null;
        FOUserAgent foUserAgent = null;
        StreamSource xmlSource = null;
        InputStream xsltSource = null;
        try {
            jaxbContext = JAXBContext.newInstance(CustomerInvoiceWrapper.class);
            Marshaller marshaller = jaxbContext.createMarshaller();
            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
            marshaller.marshal(invoice, new File("test.xml"));


            xsltSource = toPDF.getInputStream();
            // the XML file which provides the input
            File xml = new File("test.xml");
            xmlSource = new StreamSource(xml);
            fopFactory = FopFactory.newInstance(fopConfig.getURI(),fopConfig.getInputStream());
            // a user agent is needed for transformation
            foUserAgent = fopFactory.newFOUserAgent();
        } catch(Exception e){
            e.printStackTrace();
            return null;
        }
        // Setup output

        try( OutputStream out = new java.io.FileOutputStream("C:/Users/Public/pdf/z.pdf")) {
            // Construct fop with desired output format
            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);
            // Setup XSLT
            TransformerFactory factory = TransformerFactory.newInstance();

            Transformer transformer = factory.newTransformer(new StreamSource(xsltSource));

            // Resulting SAX events (the generated FO) must be piped through to
            // FOP
            Result res = new SAXResult(fop.getDefaultHandler());

            // Start XSLT transformation and FOP processing
            // That's where the XML is first transformed to XSL-FO and then
            // PDF is created
            transformer.transform(xmlSource, res);

            // xml.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return UriComponentsBuilder.newInstance().scheme("http").host("localhost:8080").path("pdf/z.pdf").build().toUriString();
    }


    public String printMonthlyRaport(LocalDate raportDate) {
        JAXBContext jaxbContext = null;
        FopFactory fopFactory = null;
        FOUserAgent foUserAgent = null;
        StreamSource xmlSource = null;
        InputStream xsltSource = null;
        RaportInvoiceList invoiceList = new RaportInvoiceList(invoiceRepository.findAllByDataWystawieniaBetween(raportDate, raportDate.plusDays(raportDate.lengthOfMonth())));
        invoiceList.getList().forEach(x->System.out.println(x.getNumerWMiesiacu()));
        try {
            jaxbContext = JAXBContext.newInstance(RaportInvoiceList.class);
            Marshaller marshaller = jaxbContext.createMarshaller();
            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
            marshaller.marshal(invoiceList, new File("raportc.xml"));


            xsltSource = toPDFRaport.getInputStream();
            // the XML file which provides the input
            File xml = new File("raportc.xml");
            xmlSource = new StreamSource(xml);
            fopFactory = FopFactory.newInstance(fopConfig.getURI(),fopConfig.getInputStream());
            // a user agent is needed for transformation
            foUserAgent = fopFactory.newFOUserAgent();
        } catch(Exception e){
            e.printStackTrace();
            return null;
        }
        // Setup output

        try( OutputStream out = new java.io.FileOutputStream("C:/Users/Public/pdf/r.pdf")) {
            // Construct fop with desired output format
            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);
            // Setup XSLT
            TransformerFactory factory = TransformerFactory.newInstance();

            Transformer transformer = factory.newTransformer(new StreamSource(xsltSource));

            // Resulting SAX events (the generated FO) must be piped through to
            // FOP
            Result res = new SAXResult(fop.getDefaultHandler());

            // Start XSLT transformation and FOP processing
            // That's where the XML is first transformed to XSL-FO and then
            // PDF is created
            transformer.transform(xmlSource, res);

            // xml.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return UriComponentsBuilder.newInstance().scheme("http").host("localhost:8080").path("pdf/r.pdf").build().toUriString();
    }

}
