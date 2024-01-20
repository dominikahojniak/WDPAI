<?php

require 'Routing.php';

$path = trim($_SERVER['REQUEST_URI'], '/');
$path = parse_url( $path, PHP_URL_PATH);

Router::get('', 'DefaultController');
Router::get('signup', 'DefaultController');
Router::get('login', 'DefaultController');
Router::get('dashboard', 'DefaultController');
Router::get('book', 'DefaultController');
Router::get('home', 'DefaultController');
Router::get('premieres', 'DefaultController');
Router::get('profile', 'DefaultController');
Router::get('search', 'DefaultController');
Router::get('toRead', 'DefaultController');
Router::get('addBook', 'DefaultController');
Router::get('FileNotFound', 'ErrorController');
Router::post('login', 'SecurityController');
Router::post('signup', 'SecurityController');
Router::get('logout', 'SecurityController');
Router::post('addBook', 'BookController');
Router::get('help', 'DefaultController');
Router::get('aboutUs', 'DefaultController');
Router::get('contact', 'DefaultController');
Router::run($path);
