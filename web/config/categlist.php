<?php
require_once("dbh.php");
$conn->set_charset("utf8");
$sql = "SELECT kategid, kategorianev FROM kategoria";
$result= $conn->query($sql);
$categ='<option value="0" selected disabled>Kategória kiválasztása</option>';
while($row=$result->fetch_array())
{
    $categ.='<option value="'.$row[0].'">'.$row[1].'</option>';
}
echo $categ;