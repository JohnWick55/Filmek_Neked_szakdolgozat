<?php
session_start();
require_once("../config/dbh.php");
$sql = "SELECT filmek.filmid, filmcim, kiadas_eve, ertekeles 
FROM filmek";
if (isset($_GET['movie'])) {
  if (!empty(trim($_GET['movie']))) {
    $_SESSION['movie'] = trim($_GET['movie']);
  } 
  else if ($_GET['movie'] == 0 && isset($_SESSION['movie'])) {
    unset($_SESSION['movie']);
  }
}
if (isset($_GET['person'])) {
  if (!empty(trim($_GET['person']))) {
    $_SESSION['person'] = trim($_GET['person']);
  } 
  else if ($_GET['person'] == 0 && isset($_SESSION['person'])) {
    unset($_SESSION['person']);
  }
}
if (isset($_GET['categid'])) {
  if (!empty(trim($_GET['categid']))) {
    $_SESSION['categid'] = trim($_GET['categid']);
  } 
  else if ($_GET['categid'] == 0 && isset($_SESSION['categid'])) {
    unset($_SESSION['categid']);
  }
}
if (isset($_SESSION['movie']) && !empty($_SESSION['movie'])) {
  $sql = 'SELECT filmid, filmcim, kiadas_eve, ertekeles FROM filmek WHERE filmcim LIKE "%' . $_SESSION['movie'] . '%"';
}
if (isset($_SESSION['person']) && !empty($_SESSION['person'])) {
  $sql = 'SELECT filmek.filmid, filmcim, kiadas_eve, ertekeles FROM filmek INNER JOIN feladat ON filmek.filmid = feladat.filmid INNER JOIN szemelyek ON feladat.szemelyid = szemelyek.szemelyid
  WHERE lower(szemelyek.nev) ="' . $_SESSION['person'] . '"';
}
if (isset($_SESSION['categid']) && !empty($_SESSION['categid'])) {
  $sql = 'SELECT filmek.filmid, filmcim, kiadas_eve, ertekeles 
  FROM filmek INNER JOIN filmkategoriak ON filmek.filmid = filmkategoriak.filmid INNER JOIN kategoria ON filmkategoriak.kategid = kategoria.kategid
  WHERE kategoria.kategid=' . $_SESSION['categid'];
}
$movieperpage = 8;
$result = $conn->query($sql);
$pagenum = ceil(($result->num_rows) / $movieperpage);
$page = (isset($_GET['page'])) ? $_GET['page'] : 1;
$limitpage = (($page - 1) * $movieperpage);
$previouspage = ($page == 1) ? 1 : $page - 1;
$nextpage = ($page == $pagenum) ? $pagenum : $page + 1;
$pageinterface = '';
for ($i = 1; $i <= $pagenum; $i++) {
  $pageinterface .= ($i == $page) ? '<label class="allpages-item text-light">' . $i . '</label>' :
    '<label class="allpages-item allpages-notcurrent" data-id="' . $i . '">' . $i . '</label>';
}
$sql .= " LIMIT " . $limitpage . " ,$movieperpage";
$result = $conn->query($sql);
if (!$result) {
  die("Hibás sql lekérdezés!");
}
$card = "";
$card = '<div class="row justify-content-center">';
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $filmid = $row["filmid"];
    $sqlPicSource = "SELECT borito_utv FROM tartalmak INNER JOIN filmek ON tartalmak.filmid = filmek.filmid WHERE filmek.filmid =" . $filmid;
    $resultPicSource = $conn->query($sqlPicSource)->fetch_array();
    $card .= '<div class="col-sm-12 col-md-6 col-lg-4 col-xl-3 d-flex align-items-stretch">
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
} else {
  echo '<p class="white">A megadott feltételekre nincsen keresési találat.</p>';
}
$card .= '</div>';
$card .= '<div class="page-control">
            <i class="fa fa-chevron-left previouspage" data-id="' . ($previouspage) . '"></i>
            <label class="allpages">
            ' . $pageinterface . '
            </label>
            <i class="fa fa-chevron-right nextpage" data-id="' . ($nextpage) . '"></i>
            </div>';
echo $card;
$conn->close();
