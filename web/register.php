<?php
session_start();
require_once("config/dbh.php");
require_once('config/functions.php');


if (($_SERVER['REQUEST_METHOD'] == 'POST') && !empty(trim($_POST['username'])) && !empty(trim($_POST['email'])) && !empty(trim($_POST['password']) && !empty(trim($_POST['passwordConfirm'])))) {
    $username = $conn->real_escape_string(trim($_POST['username']));
    $email = $conn->real_escape_string(trim($_POST['email']));
    $passwd = $conn->real_escape_string(trim($_POST['password']));
    $passwdConfirm = $conn->real_escape_string(trim($_POST['passwordConfirm']));
    $sqlUsername = "SELECT felhasznev FROM felhasznalok WHERE felhasznev = ?";
    $sqlEmail = "SELECT email FROM felhasznalok WHERE email = ?";
    $stmtu = $conn->prepare($sqlUsername); 
    $stmtu->bind_param("s", $username);
    $stmtu->execute();
    $resultUsername = $stmtu->get_result();
    $stmte = $conn->prepare($sqlEmail); 
    $stmte->bind_param("s", $email);
    $stmte->execute();
    $resultEmail = $stmte->get_result();
    $usernameMatch = false;
    $emailMatch = false;
    $passwdMatch = false;
    $success = false;
    if ($resultUsername->num_rows == 1)
        $usernameMatch = true;
    if ($resultEmail->num_rows == 1)
        $emailMatch = true;
    if ($passwd == $passwdConfirm)
        $passwdMatch = true;
    if ($usernameMatch == false && $emailMatch == false && DataCheck($username, $email, $passwd, $passwdMatch) == true) {
        $hashedPwd = encrypt($passwd);
        $sql = "INSERT INTO felhasznalok (felhasznev, jelszo, email) VALUES (?,?,?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sss", $username, $hashedPwd, $email);
        $stmt->execute();
        if ($conn->errno) {
            die($conn->error);
        } else {
            $success = true;
            $stmt->close();
        }
        $conn->close();
    }
}
function DataCheck($username, $email, $passwd, $passwdMatch)
{
    $regexPasswd = "/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/";
    $regexUsername = '/^[A-Za-z][A-Za-z0-9]{5,21}$/';

    if (filter_var($email, FILTER_VALIDATE_EMAIL) && preg_match($regexPasswd, $passwd) && preg_match($regexUsername, $username) && $passwdMatch == true) {
        return true;
    } else
        return false;
}
function encrypt($pwd)
{
    $hashedPwd = hash('sha512', $pwd);
    return strtoupper($hashedPwd);
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    <title>MoviesForYou</title>
    <link rel="stylesheet" href="style/style_feedback.css">
    <link rel="stylesheet" href="style/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.7/css/all.css">
</head>
<?php if (isLogged()) {
    echo file_get_contents('html/log_navbar.html');
} else {
    echo file_get_contents('html/unlog_navbar.html');
}
?>
<!-- Registration -->
<div class="feedback-container">
    <h2>Regiszr??ci??</h2>
    <form method="POST" class="feedback-form">
        <div class="form-group">
            <label for="Email">Felhaszn??l??n??v <span class="questionmark" title="A felhaszn??l??n??v minimum 6 ??s maximum 20 karakter hossz?? lehet">&#63;</span></label>
            <input type="text" class="form-control" name="username" aria-describedby="EmailHelp" placeholder="Felhaszn??l??n??v" required>
            <?php
            if (isset($usernameMatch) && $usernameMatch == true)
                echo "Ez a felhaszn??l??n??v m??r l??tezik";

            ?>
        </div>
        <div class="form-group">
            <label for="Email">Email</label>
            <input type="email" class="form-control" name="email" aria-describedby="EmailHelp" placeholder="Email" required>
            <?php
            if (isset($emailMatch) && $emailMatch == true)
                echo "Ez az email m??r regisztr??lva van";
            ?>
        </div>
        <div class="form-group">
            <label for="Password">Jelsz?? <span class="questionmark" title="A jelsz??nak legal??bb 8 karakterb??l kell ??lnia ??s tartalmaznia kell minimum 1 nagy bet??t ??s 1 sz??mot">&#63;</span></label>
            <input type="password" class="form-control" name="password" aria-describedby="PasswordHelp" placeholder="Jelsz??" required>
        </div>
        <div class="form-group">
            <label for="Password">Jelsz?? meger??s??t??se</label>
            <input type="password" class="form-control" name="passwordConfirm" aria-describedby="PasswordHelp" placeholder="Jelsz?? meger??s??t??se" required>
            <?php
            if (isset($passwdMatch) && $passwdMatch == false)
                echo "A megadott jelszavak nem egyeznek meg";
            ?>
        </div>
        <button type="submit" class="button-submit">Regiszr??ci??</button>
        <?php
        if (isset($success) && $success == false)
            echo "Sikertelen regisztr??ci??";
        else if (isset($success) && $success == true)
            echo "Sikeres regisztr??ci??";
        ?>
    </form>
</div>
<?php
echo file_get_contents("html/footer.html");