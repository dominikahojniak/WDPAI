<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../public/css/signup.css ">
    <title>SIGN UP</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Grandstander:wght@300&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
</head>
<body>
    <div class="signup">
            <a href="login" class='login'>
                Login
            </a>
        <div class="signup-content">
            <div class="images-container">
                <img src="../../img/logo.svg">
            </div>
            <form class="form" action="signup" method="POST">
                <h1 id="signup-title">Sign Up</h1>
                <div class="messages">
                    <?php
                    if(isset($messages)){
                        foreach($messages as $message) {
                            echo $message;
                        }
                    }
                    ?>
                </div>
                <input name="name" type="text" placeholder="name" id="name">
                <input name="email" type="text" placeholder="email" id="email">
                <input name="phone" type="text" placeholder="phone" id="phone">
                <input name="password" type="password" placeholder="password" id="password">
                <button type="submit" id="signup-button"> SIGN UP </button>
            </form>
        </div>
    </div>
</body>
</html>