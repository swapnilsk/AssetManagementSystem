<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Create an account</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    
   <style>
h2 {text-align: center;}
</style>
    
    
</head>
<body>
  <div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <nav class="navbar navbar-default">
          <div class="container-fluid">
            <ul class="nav navbar-nav">
              <li class="active"><a href="#"><input type="button" value="Home" onclick="location.href='/welcome'"/></a></li>
              </ul>
              <ul class="nav navbar-nav navbar-right">
              <li><a href="#">Hello ${pageContext.request.userPrincipal.name}</a></li>
              <li><a href="#"><a onclick="document.forms['logoutForm'].submit()">Logout</a></li>
            </ul>
          </div>
        </nav>
</c:if>
    
    <h2>Asset Manager Home</h2>  <br>
    
    <div style="text-align:center">  
    <input type="button" value="Add Employee" id="btnAddEmployee"  onclick="location.href='/addemployee'"/>  
    </div>    <br>
    
    <div style="text-align:center">  
    <input type="button" value="View Asset List" id="btnViewAssets" onclick="location.href='/viewassetlist'"/>  
    </div>  <br>
    
    <div style="text-align:center">  
    <input type="button" value="Add Asset" id="btnAddAsset" onclick="location.href='/addasset'"/>  
    </div>  <br>
    
  </div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
