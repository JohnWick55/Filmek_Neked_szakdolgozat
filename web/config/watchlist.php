<?php
if($_SERVER['REQUEST_METHOD'] == 'POST'){
$movieId = $_POST('filmid');//paraméteres lekérdezés
$userId = $_SESSION['id'];
$sql = "SELECT filmid, felhasznid FROM filmlista WHERE filmid=$movieId AND felhasznid=$userId";
$result=$conn->query($sql);
if($result->num_rows < 1)
{
    $sqlInsert="INSERT INTO `filmlista`(`filmid`, `felhasznid`) VALUES ($movieId,$userId)";
    $resultInsert=$conn->query($sqlInsert);
}
else{
    $sqlInsert="DELETE FROM `filmlista` WHERE filmid=$movieId AND felhasznid=$userId";
    $resultDelete=$conn->query($sqlInsert);
}
}