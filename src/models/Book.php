<?php

class Book {
    // Properties
    private $title;

    private $author;
    private $isbn;
    private $date;
    private $language;
    private $image;
    private $id;

    // Constructor
    public function __construct($title, $author, $isbn, $date, $language,$image, $id = null) {
        $this->title = $title;
        $this->author = $author;
        $this->isbn = $isbn;
        $this->date = $date;
        $this->language = $language;
        $this->image = $image;
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

    public function setYear($year) {
        $this->year = $year;
    }

    public function setLanguage($language) {
        $this->language = $language;
    }
    public function setId($id): void
    {
        $this->id = $id;
    }
}
