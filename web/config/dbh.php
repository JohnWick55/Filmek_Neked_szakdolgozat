<?php

$Servername = "localhost";
$Username = "root";
$Password = "";
$Name = "m4u";

$conn = mysqli_connect($Servername, $Username, $Password, $Name);
if($conn->errno)
{
    echo 'Hiba az adatbázis betöltése során.';
}
if(!$conn->set_charset('utf8'))
{
    echo 'Hiba a karakterkódolás során.';
}
