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

        <form:form name="viewassetlist" action="viewassetlist" method="POST">
            <h1 class="form-signin-heading" align="center">Search Asset:</h2>     
            
          
                <div class="form-group ${status.error ? 'has-error' : ''}" align="center">
                    <input type="text" name='assetID'  placeholder="Asset ID:" autofocus="true"  class="form-control"></input>
                </div>
           
                <div class="form-group ${status.error ? 'has-error' : ''}" align="center">
                    <input type="text" name='empID'  placeholder="Employee ID:" autofocus="true" class="form-control"></input>
                </div>

            <button type="submit"  class="btn btn-lg btn-primary btn-block" >Search</button>

            <caption><h2>${message}</h2></caption>

           <c:if test="${asset.size() > 0}">
            <div align="center">
					<table border="2" cellpadding="5" >
						<caption><h2>View Asset Details:</h2></caption>
						<tr>
							<th>Asset Id</th>
							<th>Product</th>
							<th>Model</th>
							<th>Color</th>
							<th>Condition</th>
							<th>In Use</th>
						</tr>
						<c:forEach var="asset" items="${asset}">
					    <tr>
                            <td><a href="/editasset/${asset.assetId}"> ${asset.assetId}</a></td>
                            <td><c:out value="${asset.productName}" /></td>
                            <td><c:out value="${asset.modelName}" /></td>
                            <td><c:out value="${asset.productColor}" /></td>
                            <td><c:out value="${asset.productCondition}" /></td>
                            <td><c:out value="${asset.inUse}" /></td>
					    </tr>
						</c:forEach>
					</table>
			</div>
			 </c:if>
        </form:form>

    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
  </body>
</html>
