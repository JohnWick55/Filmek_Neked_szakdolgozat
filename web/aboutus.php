<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    <title>MoviesForYou</title>
    <link rel="stylesheet" href="style/style_aboutus.css">
    <link rel="stylesheet" href="style/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.7/css/all.css">
</head>

<?php
session_start();
require_once('config/functions.php');
if (isLogged()) {
    echo file_get_contents('html/log_navbar.html');
} else {
    echo file_get_contents('html/unlog_navbar.html');
}
echo file_get_contents('html/aboutus.html');
echo file_get_contents('html/footer.html');
?>