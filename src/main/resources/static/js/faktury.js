var invoice_row;
var host;
$(document).ready(function () {
    var cid = window.location.pathname.split('/')[2];
    console.log(cid);
    host = window.location.host;
    $(".invoice-list").append("<div class='loader'></div>");
    invoice_row = $(".singleinvoice").clone(true);
    $(".singleinvoice").remove();

    $.ajax({
        method: "GET",
        url: "/klient/"+cid
    })
        .done(function( msg ) {
            $(".client-info").first().text(msg.name +" "+ msg.surname);
            $(".client-address").first().text(msg.address);
            updateSingleInvoiceView(msg);
        });

});



function updateSingleInvoiceView(cstm){
        $(".singleinvoice").remove();
        cstm = cstm.invoices;
        $.each(cstm, function(index, element){
            var tmp = invoice_row.clone(true);
            $(tmp).find(".invoice-name").first().text(element.nazwa);
            $(tmp).find(".invoice-code").first().text(element.kod);
            $(tmp).find(".invoice-count").first().text(element.ilosc);
            $(tmp).find(".invoice-dest").first().text(element.przeznaczenie);
            $(tmp).find(".invoice-date").first().text(element.dataWystawienia);
            $(tmp).find(".edit-invoice").first().attr("href","../edit-invoice/"+element.iid);
            $(tmp).find(".invoiceid").first().attr("value",element.iid);
            $(tmp).find(".delete-invoice").first().attr("value",element.iid);
            $(".invoice-list").append(tmp);
        });
        $(".invoice-list").children(".loader").remove();

}




function printInvoice(invoiceid){
    var iid = $(invoiceid).find(".invoiceid").first().val();
    var url = host+"/print/"+iid;
    data: '{"command":"on"}',
        $.ajax({
            contentType: 'application/json',
            success: function(data, status, jqxhr){
                var test = jqxhr.getResponseHeader("Content-Location");
                var link = document.createElement("a");
                link.href=test;
                link.target = "_blank";
                link.click();
            },
            error: function(x, status, error){
                alert(this.url);
            },
            processData: false,
            type: 'GET',
            url: "/print/"+iid
        });
    return false;

}

function deleteDocument(invoice){

    var conf = confirm('Czy na pewno chcesz usunac wpis?');

    if(conf){
        //console.log();
        var invoiceid = $(invoice).attr("value")
        $.ajax({
            method: "DELETE",
            url: "/invoices/"+invoiceid
        })
            .done(function( msg ) {
                alert("Pomyślnie usunięto");
                location.reload();
            });
    } else {
        return false;
    }
}

