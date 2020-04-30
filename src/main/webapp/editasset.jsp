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
            <form:form method="POST" action="/editasset" modelAttribute="editAssetsForm" class="form-signin">
                 <h3>Asset Details</h3><br>
                 <spring:bind path="assetId">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="assetId" class="form-control" placeholder="Asset Id"
                                    autofocus="true"></form:input>
                        <form:errors path="assetId"></form:errors>
                    </div>
                </spring:bind>

                <spring:bind path="productName">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="productName" class="form-control" placeholder="Product Name"
                                    autofocus="true"></form:input>
                        <form:errors path="productName"></form:errors>
                    </div>
                </spring:bind>

                <spring:bind path="modelName">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="modelName" class="form-control" placeholder="Model Name"></form:input>
                        <form:errors path="modelName"></form:errors>
                    </div>
                </spring:bind>

                <spring:bind path="productCondition">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="productCondition" class="form-control"
                                    placeholder="Product Condition"></form:input>
                        <form:errors path="productCondition"></form:errors>
                    </div>
                </spring:bind>

                <spring:bind path="productColor">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="productColor" class="form-control"
                                    placeholder="Product Color"></form:input>
                        <form:errors path="productColor"></form:errors>
                    </div>
                </spring:bind>

                <spring:bind path="inUse">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label for="inUse">In Use:</label><br>
                        <select id="inUse" name="inUse" class="form-control col-xs-12" >
                          <option value="yes">Yes</option>
                          <option value="no">No</option>
                        </select>
                        <form:errors path="inUse"></form:errors>
                    </div>
                </spring:bind>

                <spring:bind path="employee">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label for="employee">Employee Id:</label><br>
                        <select class="form-control col-xs-12"  id="employee" name="employee">
                             <option disabled selected>Select</option>
                        <c:forEach items="${empList}" var="item">
                            <option value="${item}">${item}</option><br>
                            </c:forEach>
                        </select>
                        <form:errors path="employee"></form:errors>
                    </div>
                </spring:bind>

                <button class="btn btn-lg btn-primary btn-block" type="submit">Update Asset</button>
            </form:form>
        </div>
    </body>
</html>