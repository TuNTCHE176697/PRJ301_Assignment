<%-- 
    Document   : timetable
    Created on : Apr 24, 2023, 7:37:23 PM
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
                                        ${ses.room.name} <br><a>[ ${ses.lecture.name} ]</a><br>
                                        <a href="#">${ses.group.name}-${ses.group.subject.name}</a>
                                        <br/>
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
    </body>
</html>
