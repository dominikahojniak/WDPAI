<?php
require_once 'AppController.php';
class DefaultController extends AppController {

    function login() {
        include __DIR__.'/../views/login.html';
    }
    
    public function dashboard() {
     
        var_dump("ok");
        include __DIR__.'/../views/dashboard.html';
    }
}