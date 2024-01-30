<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
require_once 'AppController.php';
require_once __DIR__ .'/../models/Book.php';
require_once __DIR__.'/../repository/ToReadRepository.php';

class ToReadController extends AppController
{
    private $toReadRepository;

    public function __construct()
    {
        parent::__construct();
        $this->toReadRepository = new ToReadRepository();
    }
    public function addBookToList()
    {
        if ($this->isPost()) {
            if(empty($_SESSION['user'])) {
                $this->render('login', ['messages' => ['Log in to continue']]);
                exit();
            }
            $userId = $_SESSION['user']['id'];
            $bookId = $_POST['book_id'];
            $isBookInList = $this->toReadRepository->isBookInToReadList($userId, $bookId);
            if (!$isBookInList) {
                $this->toReadRepository->addToReadList($userId, $bookId);
                header("Location: /book?id=$bookId&success=true");
                exit();
            } else {
                header("Location: /book?id=$bookId&error=exists");
                exit();
            }
        }
    }
    public function removeBookFromList()
    {
        if ($this->isPost()) {
            $userId = $_SESSION['user']['id'];
            $bookId = $_POST['book_id'];
            $isBookInList = $this->toReadRepository->isBookInToReadList($userId, $bookId);
            if ($isBookInList) {
                $this->toReadRepository->removeFromToReadList($userId, $bookId);
                header("Location: /toRead");
                exit();
            }
        }
    }
    public function toRead()
    {
        if(empty($_SESSION['user'])) {
            $this->render('login', ['messages' => ['Log in to continue']]);
            exit();
        }
        $userId = $_SESSION['user']['id'];
        $toReadBooks = $this->toReadRepository->getToReadBooks($userId);
        $this->render('toRead', ['toReadBooks' => $toReadBooks]);
    }
}