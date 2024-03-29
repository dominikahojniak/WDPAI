<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../public/css/premiers.css ">
    <title>PREMIERS</title>
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
            <li><a href="premieres"><img src="../../img/clock-green.svg">Premieres</a></li>
            <li><a href="toRead"><img src="../../img/heart.svg">ToRead</a></li>
            <li><a href="search"><img src="../../img/search.svg">Search</a></li>
        </ul>
        <div class="images-container">
            <a href="profile"><img src="../../img/maleprofil.svg"></a>
        </div>
    </nav>
    <main>
        <div class="premieres">
            Premieres
        </div>
        <div class="news">
            <?php foreach($premieres as $premiere): ?>
            <div class="news-container">
                <div class="date"> <h3><?= date('d M Y', strtotime($premiere->getDate()));?></h3> </div>
                <div class="right">
                <div class="news-description">
                    <p><?= $premiere-> getTitle();?> <br>by <?= $premiere-> getAuthor();?></p>
                </div>
                <img class="news-image" src="public/uploads/<?= $premiere->getImage(); ?>" alt="News Image 1">
                </div>
            </div>
            <?php endforeach; ?>
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