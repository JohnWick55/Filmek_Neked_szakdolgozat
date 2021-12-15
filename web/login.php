<?php
session_start();
require_once('config/dbh.php');
require_once('config/functions.php');
if (($_SERVER['REQUEST_METHOD'] == 'POST') && !empty(trim($_POST['username'])) && !empty(trim($_POST['password']))) {
    $username = $conn-> real_escape_string(trim($_POST['username']));
    $passwd = $conn-> real_escape_string(trim($_POST['password']));
    $sqlPasswd = "SELECT id, jelszo, felhasznev FROM felhasznalok WHERE felhasznev = ?";
    $stmt = $conn->prepare($sqlPasswd); 
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $resultPasswd = $stmt->get_result();

    $passwdMatch = false;
    $usernameMatch = false;
    if (!$resultPasswd) {
        print("SQL Hiba!");
    } else {
        if ($resultPasswd->num_rows == 1) {
            $dbuser = $resultPasswd->fetch_array();
            $usernameMatch = true;
            $hashedPwd = encrypt($passwd);
            if ($hashedPwd == $dbuser[1]) {
                $_SESSION['id'] = $dbuser[0];
                $_SESSION['felhasznev'] = $dbuser[2];
                header('Location: index.php');
                exit();
                $passwdMatch = true;
            }
        }
        $conn->close();
    }
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
<?php
if (isLogged()) {
    echo file_get_contents('html/log_navbar.html');
} else {
    echo file_get_contents('html/unlog_navbar.html');
}
?>
 <!-- Bejelentkezés-->
 <div class="feedback-container">
        <h2>Bejelentkezés</h2>
        <form action="" method="POST" class="feedback-form">
            <div class="form-group">
                <label for="Username">Felhasználónév</label>
                <input type="text" class="form-control" name="username" aria-describedby="UsernameHelp" placeholder="Felhasználónév" required>
                <?php
                if (isset($usernameMatch) && $usernameMatch == false)
                    echo "Ez a felhasználónév nem létezik";
                ?>
            </div>
            <div class="form-group">
                <label for="Password">Jelszó</label>
                <input type="password" class="form-control" name="password" aria-describedby="PasswordHelp" placeholder="Jelszó" required>
                <?php
                if (isset($passwdMatch) && $passwdMatch == false)
                    echo "Sikertelen belépés";
                else if (isset($passwdMatch) && $passwdMatch == true)
                    echo "Sikeres belépés";
                ?>
            </div>
            <button type="submit" class="button-submit">Bejelentkezés</button>
            <p class="register-link">Ha még nincs regisztrálva azt <a href="register.php"><span class="bolder">ITT</span></a> megteheti</p>
        </form>
    </div>
<?php
echo file_get_contents('html/footer.html');
?>
