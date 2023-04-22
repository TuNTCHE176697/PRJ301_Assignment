<%-- 
    Document   : information
    Created on : Apr 22, 2023, 5:39:33 PM
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
        <p> Hello
            <c:if test ="${account ne null}">
                <b>${sessionScope.account.username}</b>
            </c:if>

        </p>
      
            <form action="information" method="post">
                <table border="1">
                    <tbody>
                        <tr>
                            <td>Lecturer ID: </td>
                            <td>${lecture.id}</td>
                        </tr>
                        <tr>
                            <td>Lecturer Name: </td>
                            <td>${lecture.name}</td>
                        </tr>
                        <tr>
                            <td>Lecturer Email: </td>
                            <td>${lecture.email}</td>
                        </tr>
                        <tr>
                            <td>Lecturer Gender: </td>
                            <td>${lecture.gender? "Male":"Female"}</td>
                        </tr>
                        <tr>
                            <td>Lecturer DOB: </td>
                            <td><input type="date" name="dob" value="${lecture.dob}"/></td>
                        </tr>
                        <tr>
                            <td>Lecturer Phone: </td>
                            <td><input type="text" name="phone" value="${lecture.phone}"/></td>
                        </tr>
                        <tr>
                            <td>Lecturer Address </td>
                            <td><input type="text" name="address" value="${lecture.address}"/></td>
                        </tr>
                    </tbody>
                </table>
                        <p>${noti}</p>
                        <input type="submit" value ="Save"/>
            </form>


    </body>
</html>
