<?php
function isLogged(){
    if (!isset($_SESSION['id'])){
        return false;
    }
    return true;
}
