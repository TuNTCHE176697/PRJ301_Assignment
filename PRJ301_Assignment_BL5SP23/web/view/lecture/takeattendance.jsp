<%-- 
    Document   : takeattendance
    Created on : Apr 23, 2023, 2:08:51 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <h3>Take Attendance for ${requestScope.ses.group.name}</h3>
            Date: ${requestScope.ses.date}<br>
            Room: ${requestScope.ses.room.name}<br>
            Status Attendance: 
            <c:if test="${requestScope.ses.attendated}">
                <a style="color:green; font-weight: bold">Attended</a>
            </c:if>
            <c:if test="${!requestScope.ses.attendated}">
                <a style="color:red;font-weight: bold">Not yet</a>
            </c:if><br>

        </div>
        <form method="post" action="takeattend">
            <input type="hidden" name="seid" value="${requestScope.seid}"/>           
                <table>
                    <tr>
                        <td></td>
                        <td>GROUP</td>
                        <td>ROLLNUMBER</td>
                        <td>FULL NAME</td>
                        <td>PRESENT</td>
                        <td>ABSENT</td>
                        <td>COMMENT</td>
                        <td>SHOW IMAGE</td>
                    </tr>
                    <c:forEach items="${requestScope.ses.attendances}" var="a" varStatus="loop">
                        <tr>
                            <td>${loop.index+1}</td>
                            <td>${requestScope.ses.group.name}
                                <input type="hidden" name="stuid" value="${a.student.id}"/>
                            </td>
                            <td>${a.student.id}</td>
                            <td>${a.student.name}</td>
                            <td><input type="radio"
                                       <c:if test="${a.present}">
                                           checked="checked"
                                       </c:if>
                                       name="present${a.student.id}" value="present" /> Present</td>
                            <td><input type="radio"
                                       <c:if test="${!a.present}">
                                           checked="checked"
                                       </c:if>
                                       name="present${a.student.id}" value="absent" /> Absent</td>
                            <td><input type="text" name="description${a.student.id}" value="${a.description}" /></td>
                            <td>
                               
                            </td>
                        </tr>   

                    </c:forEach>                    
                </table>
         
            <div class="add_button">
                <input type="submit" value="Add"/>
            </div>
        </form>
    </body>
</html>
