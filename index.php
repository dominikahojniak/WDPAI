<?php

require 'Routing.php';

$path = trim($_SERVER['REQUEST_URI'], '/');
$path = parse_url( $path, PHP_URL_PATH);

Router::get('', 'DefaultController');
Router::get('signup', 'DefaultController');
Router::get('login', 'DefaultController');
Router::get('book', 'BookController');
Router::get('home', 'BookController');
Router::get('premieres', 'BookController');
Router::get('profile', 'DefaultController');
Router::get('search', 'BookController');
Router::get('toRead', 'ToReadController');
Router::get('addBook', 'DefaultController');
Router::get('FileNotFound', 'ErrorController');
Router::post('login', 'SecurityController');
Router::post('signup', 'SecurityController');
Router::get('logout', 'SecurityController');
Router::post('addBook', 'BookController');
Router::get('help', 'DefaultController');
Router::get('aboutUs', 'DefaultController');
Router::get('contact', 'DefaultController');
Router::get('books', 'BookController');
Router::post('searching', 'BookController');
Router::post('addBookToList', 'ToReadController');
Router::post('removeBookFromList', 'ToReadController');
Router::run($path);
