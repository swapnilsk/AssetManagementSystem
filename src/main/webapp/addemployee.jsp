<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="utf-8">
      <title>Create an account</title>

      <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
      <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
  </head>

  <body>

    <div class="container">
    
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <div><h3>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a> | <input type="button" value="Home" onclick="location.href='/welcome'"/>  </h3></div>
        
    </c:if>

        <form:form method="POST" modelAttribute="employeeForm" class="form-signin">
        <div class="text-center">
            <h2 class="form-signin-heading">Add Employee</h2>
            </div>
            <div class="panel panel-default">
            <div class="panel-body">

             <spring:bind path="employeeId">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                <h5>Employee Id: <span class="label label-default"></span></h5>
                    <form:input type="text" path="employeeId" class="form-control"></form:input>
                    <form:errors path="employeeId"></form:errors>
                </div>
            </spring:bind>
            
            <spring:bind path="surname">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                <h5>Employee Surname: <span class="label label-default"></span></h5>
                    <form:input type="text" path="surname" class="form-control"></form:input>
                    <form:errors path="surname"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="name">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                <h5>Employee Name: <span class="label label-default"></span></h5>
                    <form:input type="text" path="name" class="form-control"></form:input>
                    <form:errors path="name"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="mobileNumber">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                <h5>Mobile Number: <span class="label label-default"></span></h5>
                    <form:input type="text" path="mobileNumber" class="form-control"></form:input>
                    <form:errors path="mobileNumber"></form:errors>
                </div>
            </spring:bind>
            
              <spring:bind path="location">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                <h5>Location: <span class="label label-default"></span></h5>
                    <form:input type="text" path="location" class="form-control"></form:input>
                    <form:errors path="location"></form:errors>
                </div>
            </spring:bind>
            
              <spring:bind path="designation">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                <h5>Designation: <span class="label label-default"></span></h5>
                    <form:input type="text" path="designation" class="form-control"></form:input>
                    <form:errors path="designation"></form:errors>
                </div>
            </spring:bind>
            <div class="text-center">
            <button class="btn btn-lg btn-primary" type="submit">Add Employee</button>
            </div>
            </div
            </div>
        </form:form>

    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
  </body>
</html>
