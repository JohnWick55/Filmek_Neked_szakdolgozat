<?php
require_once("dbh.php");
$conn->set_charset("utf8");
$sql = "SELECT filmcim FROM filmek";
$result= $conn->query($sql);
$movies='';
while($row=$result->fetch_array())
{
    $movies.='<option value="'.$row[0].'">';
}
echo $movies;