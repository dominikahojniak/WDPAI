<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
require_once 'AppController.php';
require_once __DIR__ .'/../models/Book.php';
require_once __DIR__.'/../repository/BookRepository.php';

class BookController extends AppController {
    private $bookRepository;
    private $message = [];
    const MAX_FILE_SIZE = 1024 * 1024;
    const SUPPORTED_TYPES = ['image/png', 'image/jpeg'];
    const UPLOAD_DIRECTORY = '/../public/uploads/';
    public function __construct()
    {
        parent::__construct();
        $this->bookRepository = new BookRepository();
    }
    public function books()
    {
        $books = $this->bookRepository->getBooks();
        $this->render('books', ['books' => $books]);
    }
    public function addBook()
    {
        if (!$this->isPost()) {
            return $this->render('addBook');
        }
        if ( is_uploaded_file($_FILES['file']['tmp_name']) && $this->validate($_FILES['file'])) {
            move_uploaded_file(
                $_FILES['file']['tmp_name'],
                dirname(__DIR__) . self::UPLOAD_DIRECTORY . $_FILES['file']['name']
            );
            $title = $_POST['title'];
            $author = $_POST['author'];
            $isbn = isset($_POST['ISBN']) ? $_POST['ISBN'] : null;
            $year = $_POST['date'];
            $language = $_POST['language'];
            $image = $_FILES['file']['name']; // Dodane przypisanie wartości do zmiennej $image
            $book = new Book($title, $author, $isbn, $year, $language, $image);
            $this->bookRepository->addBook($book);
        }
        $url = "http://$_SERVER[HTTP_HOST]";
        header("Location: {$url}/addBook");
    }
    private function validate(array $file): bool
    {
        if ($file['size'] > self::MAX_FILE_SIZE) {
            $this->message[] = 'File is too large for destination file system.';
            return false;
        }

        if (!isset($file['type']) || !in_array($file['type'], self::SUPPORTED_TYPES)) {
            $this->message[] = 'File type is not supported.';
            return false;
        }
        return true;
    }
}