<?php
require_once 'AppController.php';
class DefaultController extends AppController {

    function login() {
        $this-> render("login");
    }
    public function signup() {
        $this->render("signup");
    }
    public function profile() {
        $this->render("profile");
    }
    public function addBook() {
        if ($_SESSION['user']['role'] !== 'admin') {
            header("Location: /home");
            exit();
        }
        $this->render("addBook");
    }
    public function help() {
        $this->render("help");
    }
    public function aboutUs() {
        $this->render("aboutUs");
    }
    public function contact() {
        $this->render("contact");
    }
}