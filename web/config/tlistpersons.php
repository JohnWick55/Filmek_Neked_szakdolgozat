<?php
require_once("dbh.php");
$conn->set_charset("utf8");
$sql = "SELECT szemelyek.nev
FROM szemelyek";
$result= $conn->query($sql);
$persons='';
while($row=$result->fetch_array())
{
    $persons.='<option value="'.$row[0].'">';
}
echo $persons;