<%-- 
    Document   : timetable
    Created on : Apr 23, 2023, 2:51:52 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="DateTimeHelper" class="util.DateTimeHelper"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="timetable">
            <h1>
                <a href="timetable" ><i class="fas fa-table"></i> Timetable</a>
            </h1>
            <form action="timetable">
                <input type="hidden" name="leid" value="${requestScope.leid}"/> 
                <input type="hidden" name="email" value="${sessionScope.account.email}"/>
                From: <input type="date" name="from" value="${requestScope.from}"/>
                <input type="submit" value="View"/> 
                <b> ( View by 1 week after from ) </b>
            </form>
            <table border="1px">
                <tr>
                    <td></td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>${DateTimeHelper.getDayNameofWeek(d)}<br>${d}</td>
                        </c:forEach>
                </tr>
                <c:forEach items="${requestScope.slots}" var="slot">
                    <tr>
                        <td><a>${slot.name}</a><a>${slot.description}</a></td>
                        <c:forEach items="${requestScope.dates}" var="d">
                            <td>
                                <c:forEach items="${requestScope.sessions}" var="ses">
                                    <c:if test="${DateTimeHelper.compare(ses.date,d) eq 0 and (ses.timeslot.id eq slot.id)}">
                                        <a href="takeattend?seid=${ses.id}">${ses.group.name}-${ses.group.subject.name}</a>
                                        <br/>
                                        at ${ses.room.name}<br>
                                        <c:if test="${ses.attendated}">
                                            <a>(Status: Attend)</a>
                                        </c:if>
                                        <c:if test="${!ses.attendated}">
                                            <a>(Status: Not Yet)</a>
                                        </c:if>
                                    </c:if>

                                </c:forEach>
                            </td>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </table>

    </body>
</html>
