<?php
require_once 'AppController.php';
class DefaultController extends AppController {

    function login() {
        $this-> render("login");
    }
    public function dashboard() {
     $title = "MY BOOKS";
     $this->render("dashboard",["title"=> $title]);
    }
    public function signup() {
        $this->render("signup");
    }
    public function book() {
        $this->render("book");
    }
    public function home() {
        $this->render("home");
    }
    public function premieres() {
        $this->render("premieres");
    }
    public function profile() {
        $this->render("profile");
    }
    public function search() {
        $this->render("search");
    }
    public function toRead() {
        $this->render("toRead");
    }
    public function addBook() {
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