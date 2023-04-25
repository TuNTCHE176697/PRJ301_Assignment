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
        <link rel="icon" href="https://inbienquangcao.vn/wp-content/uploads/2020/12/Nhu%CC%9B%CC%83ng-tho%CC%82ng-%C4%91ie%CC%A3%CC%82p-sa%CC%82u-sa%CC%86%CC%81c-phi%CC%81a-sau-logo-FPT.png" />
        <style>
            body{
                background-color: #bf7e84;
            }
            .content{
                background-color: #fff2f1;
                margin: 10em auto;
                width: 50%;
                padding: 15px;
                text-align: center;
                border: 1px solid #ccc;
                border-radius: 9px;
            }
            .content h2{
                font-size: 25px;
                font-family: cursive;
                color: #e0726c;
            }
            .content h3{
                font-size: 15px;
                font-family: cursive;
                color: black;
            }
            button{
                border: 1px solid #ccc;
                border-radius: 7px;
                font-family: cursive;
                color: white;
                font-weight: bold;
                font-size: 16px;
                background: #ff4133;
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
