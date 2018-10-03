$(document).ready(function () {
    var iid = window.location.pathname.split('/')[2];
    host = window.location.host;

    $.ajax({
        method: "GET",
        url: "/invoices/"+iid+"/customer",
        error:function(a,b,c){
            alert(this.url);
        }
    })
        .done(function( msg ) {
            $("input[name=name]").first().val(msg.name + " " + msg.surname);
            $("#edit-form").val(msg.cid);
        });
    ////
    $.ajax({
        method: "GET",
        url: "/invoices/"+ iid,
        error:function(a,b,c){
            alert(this.url);
        }
    })
        .done(function( msg ) {
            $("select[name=invoices]").first().val(msg.nazwa);
            document.getElementsByName("dest")[0].checked = (msg.przeznaczenie == "MOPS");
            $("input[name=data]").first().val(msg.dataWystawienia);
            $("input[name=count]").first().val(msg.ilosc);
        });

    ///
    $.ajax({method:"GET", url:"/invoicesList"}).done(function(msg){
        invoiceList =$(msg.invoices);
        $(invoiceList).each(function(i,invoiceName){
            //  console.log($(".customer-invoices").get(0));
            $(".customer-invoices").append("<option value='"+invoiceName.valueOf()+"'>"+invoiceName.valueOf()+"</option>");
        });
    });

});




function editInvoice(){
    var iid = window.location.pathname.split('/')[2];
    var nazwa =  $("[name=invoices]")[0].value;
    var ilosc = $("[name=count]")[0].value;
    var chbx = document.getElementsByName("dest")[0].checked;
    var dest = (chbx ? "MOPS" : "Gospodarstwo domowe Art. (31a ust 2 pkt 3)");
    console.log(iid + " "+nazwa +" ");

    data: '{"command":"on"}',
        $.ajax({
            contentType: 'application/json',
            data:
                JSON.stringify({
                    iid: iid,
                    nazwa: nazwa,
                    ilosc: ilosc,
                    przeznaczenie: dest
                }),
            dataType: 'text',
            success: function(data, status, jqxhr){
                alert("Pomyslnie zaktualizowano")
                window.location.href = '/faktury/'+ $("#edit-form").val();
            },
            error: function(x, status, error){
                alert("Wystapil blad podczas aktualizowania");
            },
            processData: false,
            type: 'PUT',
            url: '/edit-invoice/'+iid
        });
}