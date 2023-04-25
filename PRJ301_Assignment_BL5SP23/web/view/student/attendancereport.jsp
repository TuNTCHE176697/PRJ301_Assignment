<%-- 
    Document   : attendancereport
    Created on : Apr 25, 2023, 2:01:14 AM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                <a href="attendancereport?email=${sessionScope.account.email}&gid=-1" ><i class="fa-solid fa-file"></i> View Report Attendance</a>
                            </li>
                            <li>
                                <a href="#" ><i class="fas fa-calendar-check"></i> Mark Report</a>
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
                            <div class="main-contain">                
                                <p style="font-size: 20px; margin: 0;">Attendance report for student: ${requestScope.student.name} - ${requestScope.student.id}
                                </p>                   
                                <div>
                                    <div class="gcontent">
                                        <form action="attendancereport" method="post">
                                            <select name="gid" style="padding: 1.5px; border-radius: 6px;">
                                                <option id="groupid" value="-1">-- Select Group --</option>
                                                <c:forEach items="${requestScope.groups}" var="g">                            
                                                    <option "
                                                            <c:if test="${requestScope.group.id eq g.id}">
                                                                selected="selected"
                                                            </c:if>
                                                            value="${g.id}">
                                                        ${g.name} - ${g.subject.name}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            <input type="hidden" value="${sessionScope.account.email}" name="email">

                                            <input style="border-radius: 6px; border: 1px solid #ccc;" onload="loading()" type="submit" value="Search"/> 
                                          </form>
                                    </div>  
                                    <div class="group-details">
                                        <table class="table-details" border="1px">
                                            <tr class="dhead">
                                                <td>No</td>
                                                <td>Date</td>
                                                <td>Slot</td>
                                                <td>Room</td>
                                                <td>Lecturer</td>
                                                <td>Group Name</td>
                                                <td>Attendance Status</td>
                                                <td>Lecturer comment</td>
                                            </tr> 
                                            <% int x = 0; int y = 0; double k;%>
                                            <c:forEach items="${requestScope.sessionsByGid}" var="sesBG">
                                                <tr>
                                                    <td>${sesBG.index}</td>
                                                    <td>${sesBG.date}</td>
                                                    <td>${sesBG.timeslot.name} (${sesBG.timeslot.description})</td>
                                                    <td>${sesBG.room.name}</td>
                                                    <td>${sesBG.lecture.name}</td>
                                                    <td>${sesBG.group.name}</td>
                                                    <td>
                                                        <c:if test="${!sesBG.attendated}">
                                                            <a>- not yet -</a>
                                                        </c:if>
                                                        <c:if test="${sesBG.attendated}">
                                                            <c:if test="${sesBG.attendance.present}">
                                                                <img src="https://st.depositphotos.com/3528133/5117/v/600/depositphotos_51179241-stock-illustration-single-flat-check-mark-icon.jpg">
                                                            </c:if>
                                                            <c:if test="${!sesBG.attendance.present}">
                                                                <% x++; %>
                                                                <img src="https://img.freepik.com/free-icon/multiply_318-350486.jpg">
                                                            </c:if>
                                                        </c:if>
                                                    </td>
                                                    <td>${sesBG.attendance.description}</td>                             
                                                </tr>
                                                <% y++; %>
                                            </c:forEach>
                                            <tr style="font-weight: bold">                                
                                                <%
                                                    if (y!=0) {
                                                    k = (x*100)/y;                                   
                                                %>

                                                <% if (k>20) { %>
                                                <td style="color: red" colspan="8">
                                                    Absent: <%=k%> % ~ Present: <%=100-k%> %
                                                    (Ineligible for the exam)
                                                </td>
                                                <% } else { %>
                                                <td style="color: green" colspan="8">
                                                    Absent: <%=k%> % ~ Present: <%=100-k%> %
                                                    (Eligible for the exam)
                                                </td>
                                                <% }} %>                                
                                            </tr>
                                        </table>
                                   
                                          
                                    </div>
                                    </body>
                                    </html>
