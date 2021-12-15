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
    <h2>Regiszráció</h2>
    <form method="POST" class="feedback-form">
        <div class="form-group">
            <label for="Email">Felhasználónév <span class="questionmark" title="A felhasználónév minimum 6 és maximum 20 karakter hosszú lehet">&#63;</span></label>
            <input type="text" class="form-control" name="username" aria-describedby="EmailHelp" placeholder="Felhasználónév" required>
            <?php
            if (isset($usernameMatch) && $usernameMatch == true)
                echo "Ez a felhasználónév már létezik";

            ?>
        </div>
        <div class="form-group">
            <label for="Email">Email</label>
            <input type="email" class="form-control" name="email" aria-describedby="EmailHelp" placeholder="Email" required>
            <?php
            if (isset($emailMatch) && $emailMatch == true)
                echo "Ez az email már regisztrálva van";
            ?>
        </div>
        <div class="form-group">
            <label for="Password">Jelszó <span class="questionmark" title="A jelszónak legalább 8 karakterből kell álnia és tartalmaznia kell minimum 1 nagy betűt és 1 számot">&#63;</span></label>
            <input type="password" class="form-control" name="password" aria-describedby="PasswordHelp" placeholder="Jelszó" required>
        </div>
        <div class="form-group">
            <label for="Password">Jelszó megerősítése</label>
            <input type="password" class="form-control" name="passwordConfirm" aria-describedby="PasswordHelp" placeholder="Jelszó megerősítése" required>
            <?php
            if (isset($passwdMatch) && $passwdMatch == false)
                echo "A megadott jelszavak nem egyeznek meg";
            ?>
        </div>
        <button type="submit" class="button-submit">Regiszráció</button>
        <?php
        if (isset($success) && $success == false)
            echo "Sikertelen regisztráció";
        else if (isset($success) && $success == true)
            echo "Sikeres regisztráció";
        ?>
    </form>
</div>
<?php
echo file_get_contents("html/footer.html");