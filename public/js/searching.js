console.log("Script loaded!");
const searching = document.querySelector('input[placeholder="Search for title or author..."]');
const bookContainer = document.querySelector(".books");

searching.addEventListener("keydown", function (event) {
    console.log("Key pressed:", event.key);
    if (event.key === "Enter") {
        event.preventDefault();
        const data = { searching: this.value };
        console.log("Sending data:", data);

        fetch("/searching", {
            method: "POST",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        }).then(function (response) {
            if (!response.ok) {
                throw new Error(`Błąd HTTP! Status: ${response.status}`);
            }
            return response.json();
        }).then(function (books) {
            if (books.length > 0) {
                bookContainer.innerHTML = "";
                loadBooks(books);
            } else {
                bookContainer.innerHTML = "<p>No results found.</p>";
            }
        }).catch(function (error) {
            console.error('Błąd fetch:', error);
        });
    }
});

function loadBooks(books) {
    const bookContainer = document.querySelector('.books');

    books.forEach(book => {
        createBook(book, bookContainer);
    });

    // Dodanie obsługi kliknięcia na każdą książkę
    const bookElements = document.querySelectorAll('.book-link');
    bookElements.forEach(bookElement => {
        bookElement.addEventListener('click', function (event) {
            event.preventDefault(); // Zapobiega domyślnej akcji linku (przekierowaniu)

            const bookId = this.getAttribute('data-book-id');
            // Przekierowanie do strony z detalami książki
            redirectToBookDetails(bookId);
        });
    });
}

function createBook(book, container) {
    const template = document.querySelector("#book-template");

    const clone = template.content.cloneNode(true);
    const image = clone.querySelector("img");
    image.src = `/public/uploads/${book.image}`;
    const title = clone.querySelector("h3");
    title.innerHTML = book.title;
    const author = clone.querySelector("p");
    author.innerHTML = book.author;

    const newsContainer = clone.querySelector('.news-container');
    newsContainer.setAttribute('data-book-id', book.id);

    // Dodanie linku do strony z detalami książki
    const link = clone.querySelector('.book-link');
    link.href = `book?id=${book.id}`;
    link.setAttribute('data-book-id', book.id);
    container.appendChild(clone);
}

// Funkcja do przekierowania do strony z detalami książki
function redirectToBookDetails(bookId) {
    if (bookId !== null) {
        window.location.href = `book?id=${bookId}`;
    } else {
        console.error('Invalid book ID:', bookId);
    }
}