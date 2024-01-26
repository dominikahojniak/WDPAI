<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
require_once 'AppController.php';
require_once __DIR__ .'/../models/Book.php';
require_once __DIR__.'/../repository/BookRepository.php';
require_once __DIR__.'/../repository/ToReadRepository.php';
require_once __DIR__.'/../repository/PlatformRepository.php';
class BookController extends AppController {
    private $bookRepository;
    private $platformRepository;
    private $message = [];
    const MAX_FILE_SIZE = 1024 * 1024;
    const SUPPORTED_TYPES = ['image/png', 'image/jpeg'];
    const UPLOAD_DIRECTORY = '/../public/uploads/';

    public function __construct()
    {
        parent::__construct();
        $this->bookRepository = new BookRepository();
        $this->platformRepository = new PlatformRepository();
    }
    public function books()
    {
        $books = $this->bookRepository->getBooks();
        $this->render('books', ['books' => $books]);
    }
    public function addBook()
    {
        $subscriptionPlatforms = $this->platformRepository->getSubscriptionPlatforms();
        $purchasePlatforms = $this->platformRepository->getPurchasePlatforms();
        $books = $this->bookRepository->getBooks();
        if ($this->isPost()) {
            if (is_uploaded_file($_FILES['file']['tmp_name']) && $this->validate($_FILES['file'])) {
                move_uploaded_file(
                    $_FILES['file']['tmp_name'],
                    dirname(__DIR__) . self::UPLOAD_DIRECTORY . $_FILES['file']['name']
                );

                $title = $_POST['title'];
                $author = $_POST['author'];
                $isbn = isset($_POST['ISBN']) ? $_POST['ISBN'] : null;
                $year = $_POST['date'];
                $language = $_POST['language'];
                $image = $_FILES['file']['name'];
                $description = $_POST['description'];
                $book = new Book($title, $author, $isbn, $year, $language, $image,$description);
                $lastInsertId = $this->bookRepository->addBook($book); // Implement this method in your BookRepository if not already present.

// Przypisywanie platform subskrypcyjnych
                $subscriptionPlatforms = isset($_POST['subscription_platforms']) ? $_POST['subscription_platforms'] : [];
                $this->bookRepository->addBookPlatforms($lastInsertId, $subscriptionPlatforms, 'subscription');

// Przypisywanie platform zakupowych
                $purchasePlatforms = isset($_POST['purchase_platforms']) ? $_POST['purchase_platforms'] : [];
                $this->bookRepository->addBookPlatforms($lastInsertId, $purchasePlatforms, 'purchase');
            }
        }
        $subscriptionPlatforms = $this->platformRepository->getSubscriptionPlatforms();
        $purchasePlatforms = $this->platformRepository->getPurchasePlatforms();
        $this->render('addBook', ['books' => $books, 'subscriptionPlatforms' => $subscriptionPlatforms, 'purchasePlatforms' => $purchasePlatforms]);
    }
    public function home() {
        $books = $this->bookRepository->getBooks();
        $this->render('home', ['books' => $books]);
    }
    public function search() {
        $books = $this->bookRepository->getBooks();
        $this->render('search', ['books' => $books]);
    }
    public function premieres()
    {
        $premieres = $this->bookRepository->getPremieres();
        $this->render('premieres', ['premieres' => $premieres]);
    }
    public function book()
    {
        if (isset($_GET['id'])) {
            $bookId = intval($_GET['id']);
            if ($bookId) {
                $book = $this->bookRepository->getBook($bookId);
                $subscriptionPlatforms = $this->platformRepository->getSubscriptionPlatforms(); // Dodaj tę linię
                $purchasePlatforms = $this->platformRepository->getPurchasePlatforms(); // Dodaj tę linię
                if ($book) {
                    $subscriptionPlatforms = $this->platformRepository->getBookSubscriptionPlatforms($bookId);
                    $purchasePlatforms = $this->platformRepository->getBookPurchasePlatforms($bookId);

                    $book->setSubscriptionPlatforms($subscriptionPlatforms);
                    $book->setPurchasePlatforms($purchasePlatforms);

                    $this->render('book', ['book' => $book, 'subscriptionPlatforms' => $subscriptionPlatforms, 'purchasePlatforms' => $purchasePlatforms]);
                    return;
                }
            }
        }
        echo "Brak identyfikatora książki.";
    }
    public function searching()
    {
        error_log("Reached the searching function");
        $contentType = isset($_SERVER["CONTENT_TYPE"]) ? trim($_SERVER["CONTENT_TYPE"]) : '';
        if ($contentType === "application/json") {
            $content = trim(file_get_contents("php://input"));
            $decoded = json_decode($content, true);
            error_log(print_r($decoded, true));
            header('Content-type: application/json');
            http_response_code(200);

            echo json_encode($this->bookRepository->getBookByTitle($decoded['searching']));
        }
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