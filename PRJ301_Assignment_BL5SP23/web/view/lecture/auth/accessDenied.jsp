<%-- 
    Document   : accessDenied
    Created on : Apr 25, 2023, 4:27:41 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Access Denied!</title>
        <link rel="icon" href="assets/favicon/fu-favicon.jpg" />
        <style>
            body{
                background-color: black;
            }
            .content{
                margin: 10em auto;
                width: 50%;
                padding: 15px;
                text-align: center;
                border: 1px solid #ccc;
                border-radius: 9px;
            }
            .content h2{
                font-size: 50px;
                font-family: cursive;
                color: red;
            }
            .content h3{
                font-size: 18px;
                font-family: cursive;
                color: white;
            }
            button{
                border: 1px solid #ccc;
                border-radius: 9px;
                font-family: cursive;
                color: red;
                font-weight: bold;
                font-size: 16px;
            }
            .noti{
                width: 70%;
                text-align: center;
                margin: 10px auto;

            }
        </style>

    </head>
    <body>
        <div class="content">
            <img style="width: 100px;" src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/FPT_logo_2010.svg/1200px-FPT_logo_2010.svg.png">
            <h2>Access denied!</h2>
            <h3><< You must have account to access >></h3>
            <div class="noti">
                <a style="color: white;
                   font-family: cursive;
                   font-weight: bold;
                   font-size: 16px;">If you are not logged in</a>
                <button onclick="Login();">> Click here to login</a</button
            </div>
        </div>
        <script>
            function Login() {
                window.location = "login";
            }
        </script>
    </body>
</html>
