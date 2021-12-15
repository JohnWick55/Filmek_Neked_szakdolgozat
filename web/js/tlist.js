$(document).ready(function() {
    getDataLists();
});
function getDataLists(){
    $.get("config/tlistmovie.php",function(data, status){
        $("#tlistmovie").html(data);
    });  
    $.get("config/tlistpersons.php",function(data, status){
        $("#tlistpersons").html(data);
    });  
    $.get("config/categlist.php",function(data, status){
        $("#categList").html(data);
    });  
}
