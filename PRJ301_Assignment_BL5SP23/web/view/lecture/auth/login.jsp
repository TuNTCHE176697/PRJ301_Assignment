<%-- 
    Document   : login
    Created on : Apr 19, 2023, 1:12:12 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>FAP University Academic Portal</title>
        <link rel="icon" href="https://inbienquangcao.vn/wp-content/uploads/2020/12/Nhu%CC%9B%CC%83ng-tho%CC%82ng-%C4%91ie%CC%A3%CC%82p-sa%CC%82u-sa%CC%86%CC%81c-phi%CC%81a-sau-logo-FPT.png" />
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' rel='stylesheet'>
        <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style>::-webkit-scrollbar {
                width: 8px;
            }
            /* Track */
            ::-webkit-scrollbar-track {
                background: #f1f1f1;
            }

            /* Handle */
            ::-webkit-scrollbar-thumb {
                background: #888;
            }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: #555;
            }
            html, body{
                height: 100%
            }
            body{
                background-color: #bf7e84;
                display: grid;
                place-items: center
            }
            .card{
                padding: 0px 15px;
                border-radius: 20px
            }
            .c1{
                background-color: #fff2f1;
                border-radius: 20px
            }
            a{
                margin: 0px;
                font-size: 13px;
                border-radius: 7px;
                text-decoration: none;
                color: black
            }
            a:hover{
                color: #e0726c;
                background-color: #fff2f1
            }
            .nav-link{
                padding: 1rem 1.4rem;
                margin: 0rem 0.7rem
            }
            .ac{
                font-weight: bold;
                color: #e0726c;
                font-size: 13px
            }
            input, button{
                width: 96%;
                background-color: #fff2f1;
                border-radius: 8px;
                padding: 8px 17px;
                font-size:13px;
                border: 1px solid #f5f0ef;
                color: #dccece
            }
            input:{
                text-decoration: none
            }
            .bt{
                background-color: #ff4133;
                border: 1px solid rgb(300, 200, 200)
            }
            form{
                margin-top: 70px
            }
            form >*{
                margin: 10px 0px
            }
            #forgot{
                margin: 0px -60px
            }
            #register{
                text-align: center
            }
            img{
                background-color: antiquewhite
            }
            .wlcm{
                font-size: 30px
            }
            .sp1{
                font-size: 5px
            }
            .sp1 >span{
                background-color: #f0c3be
            }</style>
    </head>
    <body className='snippet-body'>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-12 col-sm-10 col-md-12 col-lg-11 col-xl-10">
                    <div class="card d-flex mx-auto my-5">
                        <div class="row">
                            <div class="col-md-5 col-sm-12 col-xs-12 c1 p-5">
                                <div class="row mb-5 m-3"> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/FPT_logo_2010.svg/1200px-FPT_logo_2010.svg.png" width="70vw" height="55vh" alt=""> </div> <img src="https://i.imgur.com/kdE7GKw.jpg" width="120vw" height="210vh" class="mx-auto d-flex" alt="Teacher">
                                <div class="row justify-content-center">
                                    <div class="w-75 mx-md-5 mx-1 mx-sm-2 mb-5 mt-4 px-sm-5 px-md-2 px-xl-1 px-2">
                                        <h1 class="wlcm">Welcome to FPT University Academic Portal</h1> <span class="sp1"> <span class="px-3 bg-danger rounded-pill"></span> <span class="ml-2 px-1 rounded-circle"></span> <span class="ml-2 px-1 rounded-circle"></span> </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-7 col-sm-12 col-xs-12 c2 px-5 pt-5">
                                <div class="row">
                                    <nav class="nav font-weight-500 mb-1 mb-sm-2 mb-lg-5 px-sm-2 px-lg-5"> <a class="nav-link ac" href="login">Lecture</a> <a class="nav-link" href="../student/login">Student</a> </nav>
                                </div>
                                <form action ="login" method="post"  name="myform"  class="px-5 pb-5">
                                    <div class="d-flex"> <img src="https://i.imgur.com/oGcceAH.jpg" height="35px" width="35px" alt="" class="mr-3 mt-2">
                                        <h3 class="font-weight-bold">Lecture Login</h3>
                                    </div> 
                                    <form>
                                    <input type="text" name="email" placeholder="Email"/> 
                                           <input type="password" name="password" placeholder="Password"/> 
                                           <span class="ac" id="forgot">Forgot?</span> 
                                           <p>${notice}</p>
                                           <input class="text-white text-weight-bold bt" type="submit" value="Continue" />
                                   
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
        <script type='text/javascript' src='#'></script>
        <script type='text/javascript' src='#'></script>
        <script type='text/javascript' src='#'></script>
        <script type='text/javascript'>#</script>
        <script type='text/javascript'>var myLink = document.querySelector('a[href="#"]');
            myLink.addEventListener('click', function (e) {
                e.preventDefault();
            });</script>

    </body>
</html>
