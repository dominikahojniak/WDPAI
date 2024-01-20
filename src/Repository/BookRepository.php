<?php

require_once 'Repository.php';
require_once __DIR__ . '/../models/Book.php';

class BookRepository extends Repository
{

    public function getBook(int $id): ?Book
    {
        $stmt = $this->database->connect()->prepare('
            SELECT * FROM books WHERE id = :id
        ');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();

        $book = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($book == false) {
            return null;
        }

        return new Book(
            $book['title'],
            $book['author'],
            $book['isbn'],
            $book['date'],
            $book['language'],
            $book['image']
        );
    }
    public function addBook(Book $book)
    {

        $stmt = $this->database->connect()->prepare('
            INSERT INTO books (title, author, isbn, date, language, image)
            VALUES (?, ?, ?, ?, ?,?)
        ');

        $stmt->execute([
            $book->getTitle(),
            $book->getAuthor(),
            $book->getISBN(),
            $book->getDate(),
            $book->getLanguage(),
            $book->getImage()
        ]);

    }
    public function getBooks(): array
    {
        $result = [];

        $stmt = $this->database->connect()->prepare('
            SELECT * FROM books;
        ');
        $stmt->execute();
        $books = $stmt->fetchAll(PDO::FETCH_ASSOC);

        foreach ($books as $book) {
            $result[] = new Book(
                $book['title'],
                $book['author'],
                $book['isbn'],
                $book['date'],
                $book['language'],
                $book['image']
            );
        }

        return $result;
    }
}