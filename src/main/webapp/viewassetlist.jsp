<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!-- Bootstrap Borders -->
<!DOCTYPE html>
<html>
	<head>
      <meta charset="utf-8">
      <title>Create an account</title>
      <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
      <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    </head>
	<body>
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <form id="logoutForm" method="POST" action="${contextPath}/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </c:if>

        <div class="container">
            <div class="row row-no-gutters" id="bottom-footer">
                <div align="left" class=" col-md-3">
                    <input align="left" type="button" value="Home" onclick="location.href='/home'"/>
                </div>
                <div align="right" class="col-md-9">
                    <h3>Hello ${pageContext.request.userPrincipal.name} |
                        <a onclick="document.forms['logoutForm'].submit()"> Logout
                        </a>
                    </h3>
                </div>
            </div>

            <div align="center">
                <form:form name="viewassetlist" action="viewassetlist" class="form-signin" method="POST">
                    <h3>View Asset List</h3><br>
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                         <h5>Asset Id:<span class="label label-default"></span></h5>
                         <input type="text" id="txtSearchAssetId" name='assetID' class="form-control"></input>
                    </div>

                    <div class="form-group ${status.error ? 'has-error' : ''}" align="center">
                        <h5>Employee Id:<span class="label label-default"></span></h5>
                        <input type="text" id="txtSearchEmployeeId" name='empID' class="form-control"></input>
                    </div>

                    <button type="submit" id="btnSearch" class="btn btn-lg btn-primary" >Search</button>
                    <div id = "errorMsg"><caption><h2>${message}</h2></caption></div>

                   <c:if test="${asset.size() > 0}">
                        <div align="center">
                            <table class="table" border="2" cellpadding="5" >
                                <caption>
                                    <h2>View Asset Details:</h2>
                                </caption>
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
        </div>
	</body>
</html>
