$(document).ready(function () {
    var cid = window.location.pathname.split('/')[2];
    console.log(cid);
    host = window.location.host;

    $.ajax({
        method: "GET",
        url: "/invoices/"+cid,
        error:function(a,b,c){
            alert(this.url);
        }
    })

        .done(function( msg ) {
            $("input[name=cid]").first().val(cid);
            $("input[name=name]").first().val(msg.name);
            $("input[name=surname]").first().val(msg.surname);
            var address = msg.address.split(',');
            $("input[name=city]").first().val(address[0]);
            $("input[name=street]").first().val(address[1].slice(1));
            $("input[name=postCode]").first().val(address[2].slice(1));
        });

});


function editCustomer(){
    var cid = $("[name=cid]")[0].value;
    var name = $("[name=name]")[0].value;
    var surname = $("[name=surname]")[0].value;
    var city = $("[name=city]")[0].value;
    var street = $("[name=street]")[0].value;
    var postCode = $("[name=postCode]")[0].value;
    console.log(cid + " "+name + " "+surname + " "+ city + " "+street + " "+postCode + " ");

    data: '{"command":"on"}',
        $.ajax({
            contentType: 'application/json',
            data:
                JSON.stringify({
                    cid: cid,
                    name: name,
                    surname: surname,
                    city: city,
                    street: street,
                    postCode: postCode
                }),
            dataType: 'text',
            success: function(data, status, jqxhr){
                alert("Pomyslnie zaktualizowano")
            },
            error: function(x, status, error){
                alert("Wystapil blad podczas aktualizowania");
            },
            processData: false,
            type: 'POST',
            url: '/addCustomer'
        });
}