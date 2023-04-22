<%-- 
    Document   : home
    Created on : Apr 19, 2023, 10:24:28 AM
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

        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        </head>
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