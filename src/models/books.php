<?php

class Book {
    // Properties
    private $author;
    private $isbn;
    private $year;
    private $language;

    // Constructor
    public function __construct($author, $isbn, $year, $language) {
        $this->author = $author;
        $this->isbn = $isbn;
        $this->year = $year;
        $this->language = $language;
    }

    // Getter methods
    public function getAuthor() {
        return $this->author;
    }

    public function getISBN() {
        return $this->isbn;
    }

    public function getYear() {
        return $this->year;
    }

    public function getLanguage() {
        return $this->language;
    }

    // Setter methods (if needed)
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
}

// Example usage
$book = new Book("John Doe", "1234567890", 2022, "English");

// Get book information
echo "Author: " . $book->getAuthor() . "<br>";
echo "ISBN: " . $book->getISBN() . "<br>";
echo "Year: " . $book->getYear() . "<br>";
echo "Language: " . $book->getLanguage() . "<br>";
