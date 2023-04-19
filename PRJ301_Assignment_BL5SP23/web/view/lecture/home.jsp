<%-- 
    Document   : home
    Created on : Apr 19, 2023, 10:24:09 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FAP University Academic Portal</title>

        <!-- link bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <!-- link font-awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <style>
            body {
                background-color: #f1f2f7;
            }

            ul li {
                list-style: none;
            }

            .nav-pc {
                display: flex;
                justify-content: space-between;
                text-align: center;
                height: 3em;
                width: 100%;
                background:#e0726c;
                position: fixed;
                z-index: 100;
            }

            .nav-pc a {
                font-size: 20px;
                font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
                color: aliceblue;
                text-decoration: none;
                padding: 0.7em 0.7em;
            }

            .nav-pc .nav-link-pc {
                padding-bottom: 15px;
                position: relative;
                color: white !important;
            }

            .nav-pc-left{
                display: flex;
                text-align: center;

            }
            .nav-pc-left a:hover{

            }
            .nav-pc-left i{
                color: white;
            }
            .nav-pc .nav-link-pc::before {
                content: "";
                position: absolute;
                height: 4px;
                width: 0;
                bottom: 0;
                background-color: orange;

                /* animation center */
                left: 50%;
                transform: translateX(-50%);
                transition: all 0.5s ease;
            }

            .nav-pc .nav-link-pc:hover:before {
                width: 80%;
            }
            .nav-item {
                position: relative;
                top: 1em;
                z-index: 2;
                margin-top: 2em;
                color: #000;
                font-size: 22px;

            }

            .nav-item a {
                text-decoration: none;
                color: #000;
                margin-left: 1em;
                font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            }


            .nav-bars-btn {
                z-index: 50;
                position: fixed;
                width: 100%;
                background-image: linear-gradient(to right,rgb(201, 41, 198) , rgb(28, 63, 205));
            }

            .menu-item-btn {
                position: relative;
                margin: 0.5em;
                right: 0px;
                font-size: 22px;
                border: 2px solid #fff;
                border-radius: 5px;
                color: rgb(255, 255, 255);
                z-index: 3;
            }

            .close-menu {
                margin-top: 0.5em;
                margin-right: 0.5em;
                float: right;
                font-size: 22px;
                color: rgb(85, 85, 85);
                padding: 0.25em;
                margin: 0.25em;
                line-height: 22px;
                border: 2px solid rgb(85, 85, 85);
                border-radius: 6px;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f1f1f1;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
                margin-top: 3em;
                margin-left: -7.5em;
            }

            .dropdown-content a {
                color: black;
                padding: 5px 16px;
                text-decoration: none;
                text-align: left;
                display: block;
                font-size: 14px;
            }

            .dropdown-content a:hover {
                background-color: #bf7e84;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropdown:hover .dropbtn {
                background-color: #3e8e41;
            }

            .welcome{
                margin: 20px;
            }
            .main-content-home{
                margin: 40px auto;
                padding: 20px 10px;
                background-color: #fff2f1;
            }
            #btn-back-to-top {
                position: fixed;
                bottom: 20px;
                right: 20px;
                display: none;
            }
            .left ul li{
                padding: 5px;
                margin-bottom: 0.1em;
                border: 2px solid #bf7e84;
                border-radius: 9px;
            }
            .left ul li a{
                color: black;
                text-decoration: none;
                font-family: cursive;
                font-size: 16px;
                font-weight: bold;
            }
            .left ul li a:hover{
                color: white;
                
            }
            .left ul li:hover{
                background-color: #bf7e84;
            }
            .item{
                border: 2px solid background;
                border-radius: 9px;
                padding: 10px;
            }
            .item:hover{
                border: 2px solid orangered;
                border-radius: 9px;
            }
            .dhead{
                text-align: center;
                margin: 3px 0px 3px 0px;
                background-image: linear-gradient(to left, rgb(201, 41, 198) ,rgb(28, 63, 205));
            }
            .table{
                height: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-top: 10px;
            }

            .table a{
                font-size: 15px;
                text-decoration: none;
                font-weight: normal;
                font-weight: bold;
            }
            table tr td {
                border:1px solid background;
                padding: 3px 20px;
            }

            .table .htable{
                background-image: linear-gradient(to left, rgb(201, 41, 198) ,rgb(28, 63, 205));
                color: white;
                text-align: center;
            }

            .attended {
                text-decoration: none;
                color: green;
            }
            .not_yet {
                text-decoration: none;
                color: red;
            }
            .timeslot{
                text-align: left;
            }
            .tdes{
                color: #f08e01;
                text-decoration: none;
            }
            .tname{
                font-weight: bold;
                color:black;
                text-decoration: none;
            }

            .table-details{
                border-radius: 9px;
                overflow: hidden;
                white-space: nowrap;
                margin: 5px auto;
            }

            .table-details .dhead{
                color: white;
                background-image: linear-gradient(to left, rgb(201, 41, 198) ,rgb(28, 63, 205));
            }
            .table-details img{
                width: 20px;
            }
            .group-details{
                display: block;
                text-align: center;
                padding: 10px;
                height: auto;
                overflow: auto;
            }
            .gcontent{
                text-align: center;
            }
            .gcontent a{
                text-decoration: none;
            }
            .gcontent a:hover{
                color: #feb52a;
            }
            .main-content{
                width: 60%;
                margin: 50px auto;
                text-align: center;
                border: 1px solid #ccc;
                border-radius: 9px;
                padding: 30px 10px;
            }
            .getGroupAndSlot{
                margin: 40px auto;
            }
            .main-content a{
                text-decoration: none;
            }
            .input-info select{
                border-radius: 8px;
                padding: 3px;
                text-align: center;
            }
            .avt_img img{
                width: 150px;
                height: auto;
            }

            .add_button{
                width: 50px;
                margin: 0 auto;
            }
            .add_button input{
                border-radius: 7px;
                background-color: #6b90da;
                color: white;
                border: 1px solid white;
            }
            .container-fluid{
                background-color: #fff2f1;
            }
        </style></head>
    <body>
        <button type="button" class="btn btn-danger btn-floating btn-lg" id="btn-back-to-top">
            <i class="fas fa-arrow-up"></i> Back to top
        </button>
        <div class="header">
            <nav class="nav-main">
                <!-- Navigation for PC -->
                <nav class="nav-pc" data-spy="affix">
                    <div>
                        <a href="home" class="nav-link-pc"><img style="width: 3em;" src="https://inbienquangcao.vn/wp-content/uploads/2020/12/Nhu%CC%9B%CC%83ng-tho%CC%82ng-%C4%91ie%CC%A3%CC%82p-sa%CC%82u-sa%CC%86%CC%81c-phi%CC%81a-sau-logo-FPT.png">FPT University
                        </a>
                    </div>
                    <div class="nav-pc-left">               
                        <a href="#"><i class="fa-solid fa-bell"></i></a>
                        <div class="dropdown nav-pc-left">
                            <a href="#"><i class="fa-solid fa-user-tie"></i></a>
                            <div class="dropdown-content" >
                                <a href="information">
                                    <i style="color: black;" class="fa-solid fa-address-card"></i>
                                    
                                </a>
                                <a href="#"><i style="color: black;" class="fa-solid fa-earth-americas"></i> Language</a>
                                <a href="#"><i style="color: black;" class="fa-solid fa-comment"></i> Feedback</a>
                                <a href="#"><i style="color: black;" class="fa-solid fa-circle-half-stroke"></i> Dark Mode (Off)</a>
                                <a href="#"><i style="color: black;" class="fa-solid fa-right-from-bracket"></i> Logout</a>
                            </div>
                        </div>
                    </div>      
                </nav>
            </nav>
        </div>
        <div class="main">
            <br>    
            <div class="container-fluid main-content-home">
                <div class="row">
                    <div class="col-md-2 left">
                        <ul style="padding: 0;">
                            <li>
                                <a href="#" ><i class="fas fa-table"></i> Timetable</a>
                            </li>
                            <li>
                                <a href="#" ><i class="fa-solid fa-file"></i> View Report Attendance</a>
                            </li>
                            <li>
                                <a href="#" ><i class="fas fa-calendar-check"></i> Take Attendance</a>
                            </li>
                            <li>
                                <a href="#" ><i class="fa-solid fa-comment"></i> Feedback</a>
                            </li>
                            <li>
                                <a href="#" ><i class="fa-solid fa-triangle-exclamation"></i> Important Notice</a>
                            </li>
                        </ul>
                        <h2 style="font-size: 20px;">Available on</h2>
                        <ul style="padding: 0;">
                            <li>
                                <a target="_blank" href="https://apps.apple.com/app/id1527723314" ><img height="20px" src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Mac_App_Store_logo.png/900px-Mac_App_Store_logo.png"> App Store</a>
                            </li>
                            <li>
                                <a target="_blank" href="https://play.google.com/store/apps/details?id=com.fuct" ><img height="20px" src="https://cdn-icons-png.flaticon.com/512/732/732208.png"> Google Play</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-10 right">
                        <p>
                            Hello 
                            
                            Nice to see you back
                        </p>
                        <div class="banner">
                            <img style="width: 100%; border-radius: 9px;" src="https://scontent.fhan5-8.fna.fbcdn.net/v/t39.30808-6/341470798_875888624106977_4933184179781551004_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=Cg1pR1siTskAX9343K2&_nc_ht=scontent.fhan5-8.fna&oh=00_AfCJdLeNL5bJTMzZDNCdfWUidiunYirvux2H7DgxGeEilw&oe=6444A855">
                        </div>
                        <div >

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        //Get the button
        let mybutton = document.getElementById("btn-back-to-top");

        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function () {
            scrollFunction();
        };

        function scrollFunction() {
            if (
                    document.body.scrollTop > 20 ||
                    document.documentElement.scrollTop > 20
                    ) {
                mybutton.style.display = "block";
            } else {
                mybutton.style.display = "none";
            }
        }
        // When the user clicks on the button, scroll to the top of the document
        mybutton.addEventListener("click", backToTop);

        function backToTop() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>
</html>