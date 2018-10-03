function addItem(){
    var nazwa =  $("[name=nazwaTowaru]")[0].value;
    var kodcn = $("[name=kodcn]")[0].value;

    data: '{"command":"on"}',
        $.ajax({
            contentType: 'application/json',
            data:
                JSON.stringify({
                    nazwa: nazwa,
                    kod: kodcn
                }),
            dataType: 'text',
            success: function(data, status, jqxhr){
                alert("Pomyslnie dodano");
                window.location.href="/"
            },
            error: function(x, status, error){
                alert("Wystapil blad podczas dodawania");
            },
            processData: false,
            type: 'POST',
            url: '/goods/'
        });
}