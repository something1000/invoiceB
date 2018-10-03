var customer_row;
var invoiceList;
$(document).ready(function () {
    $(".customer-list").append("<div class='loader'></div>");
    customer_row = $(".customer").clone(true);
    $(".customer").remove();
    $.ajax({
        method: "GET",
        url: "/customers?p=0"
    })
        .done(function( msg ) {

            updateCustomerView(msg);
        });

        $.ajax({method:"GET", url:"/invoicesList"}).done(function(msg){
                    invoiceList =$(msg.invoices);
            $(invoiceList).each(function(i,invoiceName){
              //  console.log($(".customer-invoices").get(0));
                $(".customer-invoices").append("<option value='"+invoiceName.valueOf()+"'>"+invoiceName.valueOf()+"</option>");
            });
        });
        var today = new Date();

    $('.datepicker').first().val(today.getFullYear() + "-" + ( (today.getMonth()>=10) ? (today.getMonth()+1) : ("0"+(today.getMonth()+1)) ) );

});

function addCustomer(){
    var name = $("[name=name]")[0].value;
    var surname = $("[name=surname]")[0].value;
    var city = $("[name=city]")[0].value;
    var street = $("[name=street]")[0].value;
    var postCode = $("[name=postCode]")[0].value;

   // alert("xd");
   // Console.log(name + " " +surname + " " +city + " " );
    var req = new XMLHttpRequest();


    data: '{"command":"on"}',
    $.ajax({
        contentType: 'application/json',
        data:
            JSON.stringify({
                     name: name,
                     surname: surname,
                     city: city,
                     street: street,
                     postCode: postCode
                 }),
        dataType: 'text',
        success: function(data, status, jqxhr){
                $(".szukajka")[0].value = name + " " + surname;

                search(name + " " + surname)
        },
        error: function(x, status, error){
            alert("Wystapil blad");
        },
        processData: false,
        type: 'POST',
        url: '/addCustomer'
    });
}


function printCustomer(){
    var name = $("[name=name]")[0].value;
    var surname = $("[name=surname]")[0].value;
    var city = $("[name=city]")[0].value;
    var street = $("[name=street]")[0].value;
    var postCode = $("[name=postCode]")[0].value;


    var req = new XMLHttpRequest();

    // req.open("POST", "/addandprint", true);
    // req.responseType = "blob";
    // req.onload = function (event) {
    //     var test = req.getResponseHeader("Content-Location");
    //     alert(req.getAllResponseHeaders());
    //     var link = document.createElement("a");
    //     link.href=test;
    //     link.target = "_blank";
    //     //link.download="Dossier_" + new Date() + ".pdf";
    //     link.click();
    // };
    //
    // req.send(
    // JSON.stringify({
    //     name: name,
    //     surname: surname,
    //     city: city,
    //     street: street,
    //     postCode: postCode
    // })
    // );


    data: '{"command":"on"}',
        $.ajax({
            contentType: 'application/json',
            data:
                JSON.stringify({
                    name: name,
                    surname: surname,
                    city: city,
                    street: street,
                    postCode: postCode
                }),
            dataType: 'text',
            success: function(data, status, jqxhr){
                var test = jqxhr.getResponseHeader("Content-Location");
                var link = document.createElement("a");
                link.href=test;
                link.target = "_blank";
                link.click();
            },
            error: function(x, status, error){
                alert("Wystapil blad");
            },
            processData: false,
            type: 'POST',
            url: '/addandprint'
        });

    // $.post("/addandprint",{
    //     name: name,
    //     surname: surname,
    //     city: city,
    //     street: street,
    //     postCode: postCode
    // },
    //   function(data,status){
    //     search("xd");
    //     console.log("xd");
    //       var blob=new Blob([data]);
    //       var link=document.createElement('a');
    //       link.href=window.URL.createObjectURL(blob);
    //       link.download="output.pdf";
    //       link.click();
    //   });
}


function updateCustomerView(cstm){
        $(".customer").remove();
        $.each(cstm._embedded.customers, function(index, element){
            var tmp = customer_row.clone(true);
            $(tmp).find(".customer-name").first().text(element.name);
            $(tmp).find(".customer-surname").first().text(element.surname);
            $(tmp).find(".customer-address").first().text(element.address);
            $(tmp).find(".clientid").first().attr("value",element.cid);

            $(tmp).find(".show-invoice").first().attr("href","faktury/"+element.cid);
            $(tmp).find(".edit-customer").first().attr("href","edit/"+element.cid);
            $(invoiceList).each(function(index,invoiceName){
                $(tmp).find(".customer-invoices").first().append("<option value='"+invoiceName.valueOf()+"'>"+invoiceName.valueOf()+"</option>");
            });
            $(".customer-list").append(tmp);
        });
        $(".customer-list").children(".loader").remove();

}

function addCustomerView(cstm){
    $.each(cstm._embedded.customers, function(index, element){
        var tmp = customer_row.clone(true);
        $(tmp).find(".customer-name").first().text(element.name);
        $(tmp).find(".customer-surname").first().text(element.surname);
        $(tmp).find(".customer-address").first().text(element.address);
        $(".customer-list").append(tmp);
    });
    $(".customer-list").children(".loader").remove();

}

function search(field){
    searchFor=field.split(" ",2);
    searchFor.push("");

    //console.log(searchFor[1]);
    $.ajax({method: "GET",
            url:"customers/search/nas?name="+searchFor[0]+"&surname="+searchFor[1]})
        .done(function(msg){updateCustomerView(msg)});
    $.ajax({method: "GET",
        url:"customers/search/nas?name="+searchFor[1]+"&surname="+searchFor[0]})
        .done(function(msg){updateCustomerView(msg)});
}


function invoice(clientid){
    var cid = $(clientid).find(".clientid").first().val();
    var count = $(clientid).find(".customer-invoice-count").first().val();
    var type = $(clientid).find(".customer-invoices").first().val();
    var chbx = clientid.getElementsByClassName("customer-invoice-type")[0].checked;
    var dest = (chbx ? "Jednostki organizacyjne pomocy społecznej Art. 6 pkt 5 ustawy z 12 marca 2004 r" : "Gospodarstwo domowe Art. (31a ust 2 pkt 3)");
    data: '{"command":"on"}',
        $.ajax({
            contentType: 'application/json',
            data:
                JSON.stringify({
                    nazwa: type,
                    ilosc: count,
                    przeznaczenie: dest
                }),
            dataType: 'text',
            success: function(data, status, jqxhr){
                var test = jqxhr.getResponseHeader("Content-Location");
                var link = document.createElement("a");
                link.href=test;
                link.target = "_blank";
                link.click();
            },
            error: function(x, status, error){
                alert("Wystapil blad ----");
            },
            processData: false,
            type: 'POST',
            url: '/printnew/'+cid
        });
        return false;

}

function createRaport(){

    var month = $(".datepicker")[0].value;
    console.log(month);

    data: '{"command":"on"}',
        $.ajax({
            success: function(data, status, jqxhr){
                var test = jqxhr.getResponseHeader("Content-Location");
                var link = document.createElement("a");
                link.href=test;
                link.target = "_blank";
                link.click();

            },
            error: function(x, status, error){
                alert("Wystapil blad ----");
            },
            processData: false,
            type: 'GET',
            url: '/raport/'+month
        });
    return false;

}