<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    <title>MoviesForYou</title>
    <link rel="stylesheet" href="style/style_user.css">
    <link rel="stylesheet" href="style/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.7/css/all.css">
    <script src="jquery-3.5.1.min.js"></script>
</head>
<?php
session_start();
require_once("config/dbh.php");
require_once('config/functions.php');
if (isLogged()) {
    echo file_get_contents('html/log_navbar.html');
} else {
    echo file_get_contents('html/unlog_navbar.html');
}

?>
    <!-- User -->
    <div class="container">
        <div class="white">
        <div class="name-container">
            <h2>
                <?php
                echo $_SESSION['felhasznev'];
                ?>
            </h2>
            <a class="button logout-button" href="config/logout.php">Kilépés</a>
        </div>
        <div class="profile-pics-container">
            <img src="images/pof_pics.jpg" class="cover">
        </div>
        <h2>Megnézendő filmek</h2>
        </div>
        <?php
        $userId = $_SESSION['id'];
            $sql = "SELECT filmek.filmid, filmek.filmcim, filmek.kiadas_eve, filmek.ertekeles FROM filmlista INNER JOIN filmek ON filmlista.filmid = filmek.filmid INNER JOIN felhasznalok ON filmlista.felhasznid=felhasznalok.id WHERE felhasznalok.id = $userId";
            $result = $conn->query($sql);
            if (!$result) {
                die("Hibás sql lekérdezés!");
            }

            if ($result->num_rows > 0) {
                echo '<div class="row justify-content-center">';
                while ($row = $result->fetch_assoc()) {
                    $filmid = $row["filmid"];
                    $sqlPicSource = "SELECT borito_utv FROM tartalmak INNER JOIN filmek ON tartalmak.filmid = filmek.filmid WHERE filmek.filmid =" . $filmid;
                    $resultPicSource = $conn->query($sqlPicSource)->fetch_array();
                    echo '<div class="col-sm-12 col-md-6 col-lg-4 col-xl-3 d-flex align-items-stretch">
                    <div class="card box-shadow">
                      <div class="inner">
                        <img src="images/' . $resultPicSource[0] . '" class="card-img-top" alt="...">
                      </div>
                      <div class="card-body">
                        <h5 class="card-title">' . $row["filmcim"] . '</h5>
                        <p class="card-text">' . $row["ertekeles"] . '<span class="star">&#11088;</span><br>1972</p>
                        <a href="movie.php?filmid=' . $filmid . '" class="btn btn-dark">Részletek</a>
                      </div>
                    </div>
                  </div>';
                }
                echo '</div>';
            } else {
                echo '<span class="white">Nincs hozzáadott film</span>';
            }
            $conn->close();
            ?>
    </div>
<?php
echo file_get_contents('html/footer.html');
?>