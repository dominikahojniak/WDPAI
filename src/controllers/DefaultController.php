<?php
require_once 'AppController.php';
class DefaultController extends AppController {

    function login() {
        //include __DIR__.'/../views/login.html';
        $this-> render("login");
    }
    public function dashboard() {
     //include __DIR__.'/../views/dashboard.html';
     $title = "MY BOOKS";
     //include __DIR__.'/../views/book.html';
     $this->render("dashboard",["title"=> $title]);
    }
    public function signup() {
     
        //include __DIR__.'/../views/signup.html';
        $this->render("signup");
    }
    public function book() {
     
        //include __DIR__.'/../views/book.html';
        $this->render("book");
    }
    public function home() {
     
        //include __DIR__.'/../views/home.html';
        $this->render("home");
    }
    public function premieres() {
     
        //include __DIR__.'/../views/premieres.html';
        $this->render("premieres");
    }
    public function profile() {
     
        //include __DIR__.'/../views/profile.html';
        $this->render("profile");
    }
    public function search() {
     
        //include __DIR__.'/../views/search.html';
        $this->render("search");
    }
    public function toRead() {
     
        //include __DIR__.'/../views/toRead.html';
        $this->render("toRead");
    }
}