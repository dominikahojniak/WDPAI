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
            $book['image'],
            $book['description'],
            $book['id']
        );
    }
    public function addBook(Book $book)
    {
        $connection = $this->database->connect();

        $connection->beginTransaction();
        try {
            $stmt = $this->database->connect()->prepare('
            INSERT INTO books (title, author, isbn, date, language, image,description)
            VALUES (?, ?, ?, ?, ?,?,?)
                RETURNING id
        ');

            $stmt->execute([
                $book->getTitle(),
                $book->getAuthor(),
                $book->getISBN(),
                $book->getDate(),
                $book->getLanguage(),
                $book->getImage(),
                $book->getDescription()
            ]);
            $lastInsertId = $stmt->fetchColumn();
            $connection->commit();
            return $lastInsertId;
        }catch (PDOException $e) {
            $connection->rollBack();
            throw $e;
        }
    }
    public function getBooks(): array
    {
        $result = [];

        $stmt = $this->database->connect()->prepare('
            SELECT * FROM books ORDER BY id DESC;
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
                $book['image'],
                $book['description'],
                $book['id']
            );
        }

        return $result;
    }
    public function getBookByTitle(string $searchString)
    {
        $searchString = '%' . strtolower($searchString) . '%';

        $stmt = $this->database->connect()->prepare('
            SELECT * FROM books WHERE LOWER(title) LIKE :searching OR LOWER(author) LIKE :searching
        ');
        $stmt->bindParam(':searching', $searchString, PDO::PARAM_STR);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function getPremieres(): array
    {
        $currentDate = date('Y-m-d');

        $stmt = $this->database->connect()->prepare('
        SELECT * FROM books WHERE date > :currentDate ORDER BY date ASC LIMIT 10
    ');
        $stmt->bindParam(':currentDate', $currentDate, PDO::PARAM_STR);
        $stmt->execute();

        $result = [];
        $books = $stmt->fetchAll(PDO::FETCH_ASSOC);

        foreach ($books as $book) {
            $result[] = new Book(
                $book['title'],
                $book['author'],
                $book['isbn'],
                $book['date'],
                $book['language'],
                $book['image'],
                $book['description'],
                $book['id']
            );
        }

        return $result;
    }
    public function addBookPlatforms(int $bookId, array $platformIds, string $type)
    {
        $connection = $this->database->connect();

        $connection->beginTransaction();

        try {
            $table = ($type === 'subscription') ? 'subscriptions' : 'purchases';
            $foreignKey = ($type === 'subscription') ? 'subscription_id' : 'purchase_id';

            $placeholders = implode(', ', array_fill(0, count($platformIds), '(?, ?)'));
            $query = "INSERT INTO book_$table (book_id, $foreignKey) VALUES $placeholders";

            $stmt = $connection->prepare($query);

            $values = [];
            foreach ($platformIds as $platformId) {
                $values[] = $bookId;
                $values[] = $platformId;
            }
            $stmt->execute($values);

            $connection->commit();
        } catch (PDOException $e) {
            $connection->rollBack();
            throw $e;
        }
    }
    public function getLastInsertId()
    {
        return $this->database->connect()->lastInsertId();
    }
    public function getBookSubscriptionPlatforms(int $bookId)
    {
        $stmt = $this->database->connect()->prepare('
            SELECT p.id, p.name, p.image, p.link
            FROM platforms p
            JOIN book_subscriptions bs ON p.id = bs.subscription_id
            WHERE bs.book_id = :bookId
        ');

        $stmt->bindParam(':bookId', $bookId, PDO::PARAM_INT);
        $stmt->execute();

        $result = [];
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $result[] = new Platform(
                $row['id'],
                $row['name'],
                $row['image'],
                $row['link']
            );
        }

        return $result;
    }

    public function getBookPurchasePlatforms(int $bookId)
    {
        $stmt = $this->database->connect()->prepare('
            SELECT p.id, p.name, p.image, p.link
            FROM platforms p
            JOIN book_purchases bp ON p.id = bp.purchase_id
            WHERE bp.book_id = :bookId
        ');

        $stmt->bindParam(':bookId', $bookId, PDO::PARAM_INT);
        $stmt->execute();

        $result = [];
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $result[] = new Platform(
                $row['id'],
                $row['name'],
                $row['image'],
                $row['link']
            );
        }

        return $result;
    }
}
