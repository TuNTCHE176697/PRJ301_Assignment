<%-- 
    Document   : information
    Created on : Apr 24, 2023, 6:20:10 PM
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
                        <td>Student ID: </td>
                        <td>${student.id}</td>
                    </tr>
                    <tr>
                        <td>Student Name: </td>
                        <td>${student.name}</td>
                    </tr>
                    <tr>
                        <td>Student Email: </td>
                        <td>${student.email}</td>
                    </tr>
                    <tr>
                        <td>Student Gender: </td>
                        <td>${student.gender? "Male":"Female"}</td>
                    </tr>
                    <tr>
                        <td>Student DOB: </td>
                        <td><input type="date" name="dob" value="${student.dob}"/></td>
                    </tr>
                    <tr>
                        <td>Student Phone: </td>
                        <td><input type="text" name="phone" value="${student.phone}"/></td>
                    </tr>
                    <tr>
                        <td>Student Address </td>
                        <td><input type="text" name="address" value="${student.address}"/></td>
                    </tr>
                    <tr>
                        <td>Major:</td>
                        <td>${student.mid.name}</td>
                    </tr>
                </tbody>
            </table>
            <p>${noti}</p>
            <input type="submit" value ="Save"/>
        </form>

    </body>
</html>
