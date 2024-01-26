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
            // Sprawdź, czy użytkownik jest zalogowany
            if (!isset($_SESSION['user'])) {
                // Przekieruj na stronę logowania lub wyświetl odpowiedni komunikat
                // (w zależności od Twoich wymagań)
                header("Location: /login");
                exit();
            }
            $userId = $_SESSION['user']['id'];
            $bookId = $_POST['book_id'];
            // Sprawdź, czy książka nie jest już na liście "ToRead" użytkownika
            $isBookInList = $this->toReadRepository->isBookInToReadList($userId, $bookId);

            if (!$isBookInList) {
                // Dodaj książkę do listy "ToRead"
                $this->toReadRepository->addToReadList($userId, $bookId);
                // Przekieruj na stronę z informacją o powodzeniu lub inny widok
                header("Location: /book?id=$bookId&success=true");
                exit();
            } else {
                // Książka już istnieje na liście - przekieruj z odpowiednim komunikatem
                header("Location: /book?id=$bookId&error=exists");
                exit();
            }
        }
    }
    public function removeBookFromList()
    {
        if ($this->isPost()) {
            // Sprawdź, czy użytkownik jest zalogowany
            if (!isset($_SESSION['user'])) {
                // Przekieruj na stronę logowania lub wyświetl odpowiedni komunikat
                // (w zależności od Twoich wymagań)
                header("Location: /login");
                exit();
            }

            $userId = $_SESSION['user']['id'];
            $bookId = $_POST['book_id'];

            // Sprawdź, czy książka jest na liście "ToRead" użytkownika
            $isBookInList = $this->toReadRepository->isBookInToReadList($userId, $bookId);

            if ($isBookInList) {
                // Usuń książkę z listy "ToRead"
                $this->toReadRepository->removeFromToReadList($userId, $bookId);
                // Przekieruj na stronę z informacją o powodzeniu lub inny widok
                header("Location: /toRead?success=true");
                exit();
            } else {
                // Książka nie istnieje na liście - przekieruj z odpowiednim komunikatem
                header("Location: /toRead?error=not_in_list");
                exit();
            }
        }
    }
    public function toRead()
    {
        // Sprawdź, czy użytkownik jest zalogowany
        if (!isset($_SESSION['user'])) {
            // Przekieruj na stronę logowania lub wyświetl odpowiedni komunikat
            header("Location: /login");
            exit();
        }

        // Pobierz ID zalogowanego użytkownika
        $userId = $_SESSION['user']['id'];

        // Pobierz książki z listy "ToRead" danego użytkownika
        $toReadBooks = $this->toReadRepository->getToReadBooks($userId);

        // Przekazuj dane do widoku
        $this->render('toRead', ['toReadBooks' => $toReadBooks]);
    }
}