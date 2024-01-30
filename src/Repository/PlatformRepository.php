<?php

require_once 'Repository.php';
require_once __DIR__ . '/../models/Book.php';
require_once __DIR__.'/../models/Platform.php';
class PlatformRepository extends Repository
{
    public function getPlatforms()
    {
        $result = [];

        $stmt = $this->database->connect()->prepare('SELECT * FROM platforms');
        $stmt->execute();
        $platforms = $stmt->fetchAll(PDO::FETCH_ASSOC);

        foreach ($platforms as $platform) {
            $result[] = new Platform(
                $platform['id'],
                $platform['name'],
                $platform['image'],
                $platform['link']
            );
        }

        return $result;
    }
    public function getSubscriptionPlatforms()
    {
        $connection = $this->database->connect();

        $stmt = $connection->prepare('
        SELECT p.id, p.name, p.image, p.link
        FROM platforms p
        JOIN subscriptions s ON p.id = s.platform_id
    ');

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
    public function getPurchasePlatforms()
    {
        $connection = $this->database->connect();

        $stmt = $connection->prepare('
        SELECT p.id, p.name, p.image, p.link
        FROM platforms p
        JOIN purchases s ON p.id = s.platform_id
    ');

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
        JOIN book_purchases bs ON p.id = bs.purchase_id
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
}