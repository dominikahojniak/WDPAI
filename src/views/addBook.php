<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../public/css/addBook.css ">
    <title>ADD_BOOK</title>
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
            <li><a href="home"><img src="../../img/home.svg">Home</a></li>
            <li><a href="premieres"><img src="../../img/clock.svg">Premieres</a></li>
            <li><a href="toRead"><img src="../../img/heart.svg">ToRead</a></li>
            <li><a href="search"><img src="../../img/search.svg">Search</a></li>
        </ul>
        <div class="images-container">
            <a href="profile"><img src="../../img/maleprofil.svg"></a>
        </div>
    </nav>
    <main>
        <div class="add">
            Add Book
        </div>
        <div class="news">
            <form class="form" action="addBook" method="POST" enctype="multipart/form-data">
                <input name="title" type="text" placeholder="title" id="email">
                <input name="author" type="text" placeholder="author" id="email">
                <input name="ISBN" type="text" placeholder="ISBN" id="email">
                <input name="date" type="text" placeholder="date" id="email">
                <input name="language" type="text" placeholder="language" id="email">
                <input name="description" type="text" placeholder="description" id="email">
                <input type="file" name="file"/>
                <!-- Subscription Platforms: -->
                <label for="platform-label">Subscription Platforms:</label>
                <div class="platform-container" id="subscription-platforms">
                <?php foreach ($subscriptionPlatforms as $platform): ?>
                    <input type="checkbox" name="subscription_platforms[]" value="<?php echo $platform->getId(); ?>">
                    <label for="subscription_platforms_<?php echo $platform->getId(); ?>"><?php echo $platform->getName(); ?></label>
                <?php endforeach; ?>
                </div>
                <!-- Purchase Platforms: -->
                <label for="platform-label">Buy Platforms:</label>
                <div class="platform-container" id="purchase-platforms">
                <?php foreach ($purchasePlatforms as $platform): ?>
                    <input type="checkbox" name="purchase_platforms[]" value="<?php echo $platform->getId(); ?>">
                    <label for="purchase_platforms_<?php echo $platform->getId(); ?>"><?php echo $platform->getName(); ?></label>
                <?php endforeach; ?>
                </div>
                <button type="submit" id="add-button"> ADD BOOK </button>
            </form>
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
    <script type="text/javascript" src="./public/js/addBookValidation.js" defer></script>
</body>
</html>