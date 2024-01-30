<?php

require_once 'Repository.php';
require_once __DIR__ . '/../models/Book.php';
class ToReadRepository extends Repository{
    public function addToReadList(int $userId, int $bookId)
    {
        $connection = $this->database->connect();

        $connection->beginTransaction();
        try {
            $stmt = $this->database->connect()->prepare('
        INSERT INTO to_read (user_id, book_id, timestamp)
        VALUES (?, ?, NOW())
    ');

            $stmt->execute([$userId, $bookId]);
            $connection->commit();
        }catch (PDOException $e) {
            $connection->rollBack();
            throw $e;
        }
    }
    public function removeFromToReadList(int $userId, int $bookId)
    {
        $connection = $this->database->connect();

        $connection->beginTransaction();
        try {
            $stmt = $this->database->connect()->prepare('
            DELETE FROM to_read WHERE user_id = :userId AND book_id = :bookId
        ');

            $stmt->bindParam(':userId', $userId, PDO::PARAM_INT);
            $stmt->bindParam(':bookId', $bookId, PDO::PARAM_INT);
            $stmt->execute();
            $connection->commit();
        }catch (PDOException $e) {
            $connection->rollBack();
            throw $e;
        }
    }
    public function isBookInToReadList(int $userId, int $bookId): bool
    {
        $stmt = $this->database->connect()->prepare('
        SELECT * FROM to_read WHERE user_id = ? AND book_id = ?
    ');

        $stmt->execute([$userId, $bookId]);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        return $result !== false;
    }
    public function getToReadBooks(int $userId): array
    {
        $result = [];

        $stmt = $this->database->connect()->prepare('
       SELECT b.* FROM books b
        JOIN to_read tr ON b.id = tr.book_id
        WHERE tr.user_id = :userId
        ORDER BY tr.timestamp ASC
    ');
        $stmt->bindParam(':userId', $userId, PDO::PARAM_INT);
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
}
