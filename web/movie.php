<?php
session_start();
require_once("config/dbh.php");
require_once('config/functions.php');
$id = $_GET['filmid'];
if (isset($_GET['filmid'])) {
    $sqlmovie = "SELECT filmek.filmcim, filmek.kiadas_eve, filmek.ismerteto, filmek.ertekeles, filmek.filmhossz, tartalmak.borito_utv, tartalmak.kepek_utv FROM filmek INNER JOIN tartalmak ON filmek.filmid = tartalmak.filmid WHERE filmek.filmid=$id";
    $resultmovie = $conn->query($sqlmovie);
    $movie = mysqli_fetch_assoc($resultmovie);
    $sqlcateg = "SELECT kategorianev FROM kategoria INNER JOIN filmkategoriak ON kategoria.kategid=filmkategoriak.kategid WHERE filmkategoriak.filmid=$id";
    $resultcateg = $conn->query($sqlcateg);
    if(!$resultcateg)
    {
        print("SQL Hiba!");
    }
    $categories = '';
    while ($row = $resultcateg->fetch_array()) {
        $categories .= $row[0] . ', ';
    }
    $sqlproducer = 'SELECT nev FROM szemelyek INNER JOIN feladat ON szemelyek.szemelyid = feladat.szemelyid WHERE feladat.filmid =' . $id . ' AND feladat.megnevezes="rendező"';
    $resultproducer = $conn->query($sqlproducer);
    if(!$resultproducer)
    {
        print("SQL Hiba!");
    }
    $producer = '';
    while ($row = $resultproducer->fetch_array()) {
        $producer .= $row[0] . ', ';
    }
    $sqlactors = 'SELECT nev FROM szemelyek INNER JOIN feladat ON szemelyek.szemelyid = feladat.szemelyid WHERE feladat.filmid =' . $id . ' AND feladat.megnevezes="színész"';
    $resultactors = $conn->query($sqlactors);
    if(!$resultactors)
    {
        print("SQL Hiba!");
    }
    $actors = '';
    while ($row = $resultactors->fetch_array()) {
        $actors .= $row[0] . ', ';
    }
}
if(isset($_SESSION['id'])){
$contain = false;
$userId = $_SESSION['id'];

$sql = "SELECT filmid, felhasznid FROM filmlista WHERE filmid=$id AND felhasznid=$userId";
$result=$conn->query($sql);
if($result->num_rows > 0)
{
    $contain=true;
}
}
if($_SERVER['REQUEST_METHOD'] == 'POST'){
    $userId = $_SESSION['id'];
    $sql = "SELECT filmid, felhasznid FROM filmlista WHERE filmid=$id AND felhasznid=$userId";
    $result=$conn->query($sql);
    if($result->num_rows < 1)
    {
        $sqlInsert="INSERT INTO `filmlista`(`filmid`, `felhasznid`) VALUES ($id,$userId)";
        $resultInsert=$conn->query($sqlInsert);
        $contain=true;
    }
    else{
        $sqlDelete="DELETE FROM `filmlista` WHERE filmid=$id AND felhasznid=$userId";
        $resultDelete=$conn->query($sqlDelete);
        $contain=false;
    }
    }

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    <title>MoviesForYou</title>
    <link rel="stylesheet" href="style/style_movie.css">
    <link rel="stylesheet" href="style/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.7/css/all.css">
</head>
<?php
if (isLogged()) {
    echo file_get_contents('html/log_navbar.html');
} else {
    echo file_get_contents('html/unlog_navbar.html');
}
?>
    <!-- Movie -->
    <div class="container">
        <div class="movie-image-container">
            <h1><?php echo  $movie['filmcim']; ?></h1>
            <img src="images/<?php echo $movie['borito_utv'] ?>" class="cover">
        </div>
       
        <?php
            if (isLogged()) {
                if($contain==true){
                    echo '<form method="POST" class="add-to-watchlist add"><button type="submit" class="add-button">x Eltávolítás</button></form>';
                }
                else{
                    echo '<form method="POST" class="add-to-watchlist remove"><button type="submit" class="add-button">+ Hozzáadás</button></form>';
                }        
                }
          
        ?>      
        <div class="movie-description">
            <div class="short-summary">
                <h2>Rövid leírás: </h2><?php echo  $movie['ismerteto']; ?>
            </div>
            <div class="aspect">
                <h2>Értékelés: </h2><?php echo  $movie['ertekeles']; ?><span class="star">&#11088;</span>
            </div>
            <div class="aspect">
                <h2>Kategória:</h2>
                <?php
                echo substr_replace($categories, "", -2);
                ?>
            </div>
            <div class="aspect">
                <h2>Filmhossz: </h2><?php echo  $movie['filmhossz']; ?>
            </div>
            <div class="aspect">
                <h2>Rendező:</h2> <?php echo substr_replace($producer, "", -2);?>
            </div>
            <div class="aspect fobb-szineszek">
                <h2>Főbb színészek:</h2>
                <?php
                echo substr_replace($actors, "", -2);
                ?>
            </div>
            <div class="aspect">
                <h2>Megjelenés:</h2> <?php echo  $movie['kiadas_eve']; ?>
            </div>
           
        </div>
    </div>
<?php
    echo file_get_contents('html/footer.html');
?>