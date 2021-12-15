$(document).ready(function () {
    loadcards();

    $(document).on("click", ".nextpage", function () {
        var page = $(this).attr("data-id");
        console.log(page);
        $.ajax({
            url: 'config/cards.php',
            method: 'GET',
            data: { page: page },
            datatype: "html",
            success: function (adat) {
                $('.container').html(adat);
                // loadcards();
            },
            error: function () {
                alert('Hiba történt az adat feldolgozásakor');
            }
        });

         });
         $(document).on("click",".previouspage",function () {
             var page=$(this).attr("data-id");
             console.log(page);
             $.ajax({
                 url : 'config/cards.php',
                 method : 'GET',
                 data : {page:page},
                 datatype : "html",
                 success : function(adat){
                     // loadcards();
                     $('.container').html(adat);
                 },
                 error : function(){
                     alert('Hiba történt az adat feldolgozásakor');
                 }
             });     
         });
         $(document).on("click",".allpages-notcurrent",function () {
             var page=$(this).attr("data-id");
             console.log(page);
             $.ajax({
                 url : 'config/cards.php',
                 method : 'GET',
                 data : {page:page},
                 datatype : "html",
                 success : function(adat){
                     // loadcards();
                     $('.container').html(adat);
                 },
                 error : function(){
                     alert('Hiba történt az adat feldolgozásakor');
                 }
             });
});    
        $(document).on("click", ".searchButton", function () {

            let movie = (document.getElementById("moviesInput").value) ? document.getElementById("moviesInput").value : 0;
            let person = (document.getElementById("personsInput").value) ? document.getElementById("personsInput").value : 0;
            let categid = (document.getElementById("categList").value) ? document.getElementById("categList").value : 0;
            console.log(movie, person, categid);
            $.ajax({
                url: 'config/cards.php',
                method: 'GET',
                data: { movie: movie, person: person, categid: categid },
                dataType: "html",
                success: function (adat) {
                    $('.container').html(adat);
                },
                error: function () {
                    alert('Hiba történt az adatok feldolgozásakor');
                }
            });
        });
    });

    function movieChange() {
        document.getElementById("personsInput").value = "";
        document.getElementById("categList").value = 0;
    };
    function personChange() {
        document.getElementById("moviesInput").value = "";
        document.getElementById("categList").value = 0;
    };
    function categChange() {
        document.getElementById("moviesInput").value = "";
        document.getElementById("personsInput").value = "";
    };
    function clearAllFilters() {
        document.getElementById("moviesInput").value = "";
        document.getElementById("personsInput").value = "";
        document.getElementById("categList").value = 0;
    };

    function loadcards() {
        $.get("config/cards.php", function (data, status) {
            $(".container").html(data);
        });
    }
