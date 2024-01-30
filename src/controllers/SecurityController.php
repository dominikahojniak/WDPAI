<?php

require_once 'AppController.php';
require_once __DIR__ .'/../models/User.php';
require_once __DIR__.'/../repository/UserRepository.php';

class SecurityController extends AppController {
    private $userRepository;

    public function __construct()
    {
        parent::__construct();
        $this->userRepository = new UserRepository();
    }

    public function login()
    {

        if (!$this->isPost()) {
            return $this->render('login');
        }

        $email = $_POST['email'];
        $password = $_POST['password'];
        $user = $this->userRepository->getUser($email);

        if (!$user) {
            return $this->render('login', ['messages' => ['User not found!']]);
        }
        if ($user->getEmail() !== $email) {
            return $this->render('login', ['messages' => ['User with this email not exist!']]);
        }
        if (!password_verify($password,$user->getPassword())) {
            return $this->render('login', ['messages' => ['Wrong password!']]);
        }
        $_SESSION['user'] = [
            'id' => $user->getId(),
            'email' => $user->getEmail(),
            'name' => $user->getName(),
            'role' => $user->getRole()
        ];
        $url = "http://$_SERVER[HTTP_HOST]";
        if ($_SESSION['user']['role'] === 'admin') {
            header("Location: {$url}/addBook");
        } else {
            header("Location: {$url}/home");
        }
    }
    public function signup()
    {
        if (!$this->isPost()) {
            return $this->render('signup');
        }

        $email = $_POST['email'];
        $password = $_POST['password'];
        $name = $_POST['name'];
        $phone = $_POST['phone'];

        if ($this->userRepository->getUser($email)) {
            return $this->render('signup', ['messages' => ['Account with this email already exists!']]);
        }
        $hashedPassword = password_hash($password, PASSWORD_BCRYPT);
        $user = new User($email, $hashedPassword, $name);
        $user->setPhone($phone);
        $this->userRepository->addUser($user);
        return $this->render('login', ['messages' => ['You\'ve been succesfully registrated!']]);
    }
    public function logout() {

        session_destroy();


        $url = "http://$_SERVER[HTTP_HOST]";
        header("Location: {$url}/login");
    }
}