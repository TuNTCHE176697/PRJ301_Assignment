<%-- 
    Document   : timetable
    Created on : Apr 23, 2023, 2:51:52 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="DateTimeHelper" class="util.DateTimeHelper"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FAP University Academic Portal</title>
        <link rel="icon" href="https://inbienquangcao.vn/wp-content/uploads/2020/12/Nhu%CC%9B%CC%83ng-tho%CC%82ng-%C4%91ie%CC%A3%CC%82p-sa%CC%82u-sa%CC%86%CC%81c-phi%CC%81a-sau-logo-FPT.png" />

        <!-- link bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <!-- link font-awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- link style.css -->
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
                            <a href="information"><i class="fa-solid fa-user-tie"></i></a>
                            <div class="dropdown-content" >
                                <a href="information">
                                    <i style="color: black;" class="fa-solid fa-address-card"></i>
                                    <c:if test ="${sessionScope.account ne null}">
                                        <b>${sessionScope.account.username}</b>
                                    </c:if>

                                </a>
                                <a href="#"><i style="color: black;" class="fa-solid fa-earth-americas"></i> Language</a>
                                <a href="#"><i style="color: black;" class="fa-solid fa-comment"></i> Feedback</a>
                                <a href="#"><i style="color: black;" class="fa-solid fa-circle-half-stroke"></i> Dark Mode (Off)</a>
                                <a href="logout"><i style="color: black;" class="fa-solid fa-right-from-bracket"></i> Logout</a>
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
                                <a href="timetable?email=${sessionScope.account.email}" ><i class="fas fa-table"></i> Timetable</a>
                            </li>
                            <li>
                                <a href="group?email=${sessionScope.account.email}&gid=-1" ><i class="fa-solid fa-file"></i> View Report Attendance</a>
                            </li>
                            <li>
                                <a href="getInfo?emailInfo=${sessionScope.account.email}&gidInfo=-1&seInfo=-1&gid=-1&seid=-1&email=${sessionScope.account.email}" ><i class="fas fa-calendar-check"></i> Take Attendance</a>
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
                        <div>
                            <div class="description">
                                <div style=" text-align: center">
                                    <form action="timetable">
                                        <input type="hidden" name="leid" value="${requestScope.leid}"/> 
                                        <input type="hidden" name="email" value="${sessionScope.account.email}"/>
                                        From: <input type="date" name="from" value="${requestScope.from}"/>
                                        <input type="submit" value="View"/> 
                                        <b> ( View by 1 week after from ) </b>
                                    </form>
                                </div>
                                <div class="table">
                                    <table>
                                        <tr class="htable">
                                            <td></td>
                                            <c:forEach items="${requestScope.dates}" var="d">
                                                <td>${DateTimeHelper.getDayNameofWeek(d)}<br>${d}</td>
                                                </c:forEach>
                                        </tr>
                                        <c:forEach items="${requestScope.slots}" var="slot">
                                            <tr>
                                                <td class="timeslot"><a class="tname">${slot.name}: </a><br><a class="tdes">(${slot.description})</a></td>
                                                    <c:forEach items="${requestScope.dates}" var="d">
                                                    <td style="text-align: center">
                                                        <c:forEach items="${requestScope.sessions}" var="ses">
                                                            <c:if test="${DateTimeHelper.compare(ses.date,d) eq 0 and (ses.timeslot.id eq slot.id)}">
                                                                <a href="takeattend?seid=${ses.id}">${ses.group.name}-${ses.group.subject.name}</a>
                                                                <br/>
                                                                at ${ses.room.name}<br>
                                                                <c:if test="${ses.attendated}">
                                                                    <a class="attended">(Status: Attend)</a>
                                                                </c:if>
                                                                <c:if test="${!ses.attendated}">
                                                                    <a class="not_yet">(Status: Not Yet)</a>
                                                                </c:if>
                                                            </c:if>

                                                        </c:forEach>
                                                    </td>
                                                </c:forEach>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
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