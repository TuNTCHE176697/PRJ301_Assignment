<%-- 
    Document   : attendancereport
    Created on : Apr 25, 2023, 2:01:14 AM
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
                <c:forEach items="${requestScope.attendances}" var="att">
                    <c:if test="${(att.student.id eq requestScope.student.id) and (att.session.id  eq sesBG.id)}">
                        <td>
                        <c:if test="${!sesBG.attendated}">
                            <a>- not yet -</a>
                        </c:if>
                        <c:if test="${sesBG.attendated}">
                            <c:if test="${att.present}">
                                <img src="assets/img/attend.png">
                            </c:if>
                            <c:if test="${!att.present}">
                                <% x++; %>
                                <img src="assets/img/absent.png">
                            </c:if>
                        </c:if>
                        </td>
                        <td>${att.description}</td>
                    </c:if>
                </c:forEach>                                   
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
