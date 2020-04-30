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

                <div><h3>Hello ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a> | <input type="button" value="Home" onclick="location.href='/welcome'"/>  </h3></div>
            </c:if>

            <form:form method="POST" modelAttribute="userForm" class="form-signin">
                <h2 class="form-signin-heading">Create your account</h2>
                <spring:bind path="username">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="username" class="form-control" placeholder="Username"
                                    autofocus="true"></form:input>
                        <form:errors path="username"></form:errors>
                    </div>
                </spring:bind>

                <spring:bind path="password">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                        <form:errors path="password"></form:errors>
                    </div>
                </spring:bind>

                <spring:bind path="passwordConfirm">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="password" path="passwordConfirm" class="form-control"
                                    placeholder="Confirm your password"></form:input>
                        <form:errors path="passwordConfirm"></form:errors>
                    </div>
                </spring:bind>
                <div align="center">
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
                </div>
            </form:form>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
    </body>
</html>