<?php

class Book {
    // Properties
    private $title;

    private $author;
    private $isbn;
    private $date;
    private $language;
    private $image;
    private $description;
    private $id;
    private $subscriptionPlatforms = [];
    private $purchasePlatforms = [];


    // Constructor
    public function __construct($title, $author, $isbn, $date, $language,$image,$description, $id = null) {
        $this->title = $title;
        $this->author = $author;
        $this->isbn = $isbn;
        $this->date = $date;
        $this->language = $language;
        $this->image = $image;
        $this->description = $description;
        $this->id = $id;
    }

    // Getter methods
    public function getAuthor() {
        return $this->author;
    }

    public function getISBN() {
        return $this->isbn;
    }

    public function getDate() {
        return $this->date;
    }

    public function getLanguage() {
        return $this->language;
    }
    public function getTitle()
    {
        return $this->title;
    }
    public function getId()
    {
        return $this->id;
    }
    public function getImage()
    {
        return $this->image;
    }
    public function getDescription() {
        return $this->description;
    }

    public function setDescription($description) {
        $this->description = $description;
    }
    public function setImage($image)
    {
        $this->image = $image;
    }
    public function setTitle($title): void
    {
        $this->title = $title;
    }
    public function setAuthor($author) {
        $this->author = $author;
    }

    public function setISBN($isbn) {
        $this->isbn = $isbn;
    }

    public function setLanguage($language) {
        $this->language = $language;
    }
    public function setId($id): void
    {
        $this->id = $id;
    }
    public function setSubscriptionPlatforms(array $subscriptionPlatforms) {
        $this->subscriptionPlatforms = $subscriptionPlatforms;
    }

    public function setPurchasePlatforms(array $purchasePlatforms) {
        $this->purchasePlatforms = $purchasePlatforms;
    }

    // Getter methods
    public function getSubscriptionPlatforms() {
        return $this->subscriptionPlatforms;
    }

    public function getPurchasePlatforms() {
        return $this->purchasePlatforms;
    }

}
