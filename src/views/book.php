<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../public/css/book.css ">
    <title>BOOK</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Grandstander:wght@300&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
</head>

<body>
    <nav>
        <div class="images-container">
            <img src="../../img/malelogo.svg">
        </div>
        <ul>
            <li><a href="home"><img src="../../img/home-green.svg">Home</a></li>
            <li><a href="premieres"><img src="../../img/clock.svg">Premieres</a></li>
            <li><a href="toRead"><img src="../../img/heart.svg">ToRead</a></li>
            <li><a href="search"><img src="../../img/search.svg">Search</a></li>
        </ul>
        <div class="images-container">
            <a href="profile"><img src="../../img/maleprofil.svg"></a>
        </div>
    </nav>
    <main>
        <div class="left">
            <div class="x">
                <a href="home"><img src="../../img/x.svg"></a>
            </div>
        </div>
        <div class="middle">
            <div class="image">
                <img class="news-image" src="public/uploads/<?= $book->getImage(); ?>" alt="News Image 1">
            </div>
            <form class="form" action="/addBookToList" method="POST">
                <input type="hidden" name="book_id" value="<?= $book->getId() ?>">
                <button id="add-button"> + To Read </button>
            </form>
            <?php
            if (isset($_GET['success']) && $_GET['success'] === 'true') {
                echo '<p style="color: green;">Book added to ToRead list successfully!</p>';
            } elseif (isset($_GET['error']) && $_GET['error'] === 'exists') {
                echo '<p style="color: red;">Book is already in ToRead list!</p>';
            }
            ?>
        </div>
        <div class="right">
            <div class="news-description">
                <h3><?= $book->getTitle(); ?> </h3>
                <p>by <?= $book->getAuthor(); ?></p>
                <p>date: <?= $book->getDate(); ?></p>
            </div>
            <div class="subscription">
                <div class="news-title-container">
                    <div class="news-title">
                        <h3>Subscription </h3>
                    </div>
                </div>
                <div class="items">
                        <?php foreach ($subscriptionPlatforms as $platform): ?>
                            <?php if (is_object($platform) && $platform instanceof Platform): ?>
                            <div class="platform-item">
                                <img src="public/platforms/<?= $platform->getImage(); ?>"class="platform-image">
                                <div class="options">
                                    <img src="../../img/ebook.svg">
                                    <img src="../../img/headphones.svg">
                                </div>
                            </div>
                            <?php endif; ?>
                        <?php endforeach; ?>
                </div>
            </div>
            <div class="buy">
                <div class="news-title-container">
                    <div class="news-title">
                        <h3>Buy </h3>
                    </div>
                </div>
                <div class="items">
                    <?php foreach ($purchasePlatforms as $platform): ?>
                        <?php if (is_object($platform) && $platform instanceof Platform): ?>
                            <div class="platform-item">
                                <img src="public/platforms/<?= $platform->getImage(); ?>"class="platform-image">
                                <div class="options">
                                    <img src="../../img/ebook.svg">
                                    <img src="../../img/headphones.svg">
                                </div>
                            </div>
                        <?php endif; ?>
                    <?php endforeach; ?>
                </div>
            </div>
            <div class="news-description">
                <p><?= $book->getDescription(); ?></p>
            </div>
        </div>
    </main>
    <footer>
        <ul>
            <li><a href="help">Help</a></li>
            <li><a href="aboutUs">About Us</a></li>
            <li><a href="contact">Contact</a></li>
        </ul>
        <div class="media">
            <a href="https://www.linkedin.com/notifications/?filter=all" target="_blank"><img src="../../img/linkedin.svg"></a>
            <a href="https://www.facebook.com/?locale=pl_PL" target="_blank"><img src="../../img/fb.svg"></a>
            <a href="https://www.instagram.com" target="_blank"><img src="../../img/ig.svg"></a>
        </div>
        <div class="store">
            <a href="https://www.apple.com/pl/app-store/" target="_blank"><img src="../../img/AppStore.svg"></a>
            <a href="https://play.google.com/store/apps" target="_blank"><img src="../../img/GooglePlay.svg"></a>
        </div>
    </footer>
</body>

</html>