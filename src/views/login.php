<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../public/css/login.css ">
    <title>LOGIN</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Grandstander:wght@300&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">

</head>
<body>
    <div class="login">
        <div class="images-container">
            <img src="../../img/logo.svg">
        </div>
        <form class="form" action="login" method="POST">
            <h1 id="login-title">Log In</h1>
            <div class="messages">
                    <?php
                        if(isset($messages)){
                            foreach($messages as $message) {
                                echo $message;
                            }
                        }
                    ?>
                </div>
            <input name="email" type="text" placeholder="email" id="email">
            <input name="password" type="password" placeholder="password" id="password">
            <button type="submit" id="login-button"> LOG IN </button>
            <div id='group7' class='group7'>
                <div id='donthaveanaccount' class='donthaveanaccount'>
                Don t have an account?</div>
                <!-- Dodane hiperłącze -->
                <a href="signup.html" class='signup'>
                    Sign Up
                </a>
            </div>
        </form>
    </div>
</body>
</html>