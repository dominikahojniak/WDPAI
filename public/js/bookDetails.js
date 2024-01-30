
document.querySelectorAll('.news-container').forEach(container => {
    container.addEventListener('click', redirectToBookPage);
});

function redirectToBookPage(event) {
    const bookId = event.currentTarget.getAttribute('data-book-id');
    if (bookId) {
        window.location.href = `book?id=${bookId}`;
    } else {
        console.error('Brak identyfikatora książki');
    }
}

