<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="utf-8">
      <title>Log in with your account</title>

      <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
      <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
  </head>

  <body>
      <form method="POST" action="${contextPath}/login" class="form-signin">
      <h2><p class = "text-center"> Asset Manager</h2></p> <br><br>
        <h4 class="form-heading"><p class = "text-left">Login</h4></p>
        <div class="panel panel-default">
        <div class="panel-body">
        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span>${message}</span>
            <h5>Username <span class="label label-default"></span></h5>
            <input name="username" type="text" class="form-control"

            <h5>Password <span class="label label-default"></span></h5>
            <input name="password" type="password" class="form-control"/>

            <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div class="text-center">
            <button class="btn btn-lg btn-primary" type="submit">Sign In</button>
            </div>

            <h4 class="text-center"><a href="${contextPath}/registration">Create an account</a></h4>
            </div>
            </div>
        </div>
      </form>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
  </body>
</html>
