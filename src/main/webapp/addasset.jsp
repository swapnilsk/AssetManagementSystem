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
<div class="row row-no-gutters"  id="bottom-footer" >

                                    <div class="col-xs-12 col-md-5 text-center" ><h3>Asset Details</h3></div>
                                     <div class="col-xs-12 col-md-2 text-center" ></div>
                               <div class="col-xs-12 col-md-5 text-center" >
                               <ul>
                                  <div><h3>Hello ${pageContext.request.userPrincipal.name} |
                                   <a onclick="document.forms['logoutForm'].submit()">Logout</a> |
                                    <input type="button" value="Home" onclick="location.href='/home'"/> </h3>
                                  </div>
                                </ul>
                               </div>


</div>
<div class="panel panel-default">
            <div class="panel-body">

                            <div align="center">

                                <form:form method="POST" modelAttribute="assetForm" class="form-signin">


                                             <spring:bind path="assetId">
                                                <div id="errorMsg" class="form-group ${status.error ? 'has-error' : ''}">
                                                <h5>Asset Id: <span class="label label-default"></span></h5>
                                                    <form:input type="text" id="txtAssetID" path="assetId" class="form-control"></form:input>
                                                    <form:errors path="assetId"></form:errors>
                                                </div>
                                            </spring:bind>

                                            <spring:bind path="productName">
                                                <div id="errorMsg" class="form-group ${status.error ? 'has-error' : ''}">
                                                <h5>Product Name: <span class="label label-default"></span></h5>
                                                    <form:input type="text" id="txtProduct" path="productName" class="form-control"></form:input>
                                                    <form:errors path="productName"></form:errors>
                                                </div>
                                            </spring:bind>

                                            <spring:bind path="modelName">
                                                <div id="errorMsg"class="form-group ${status.error ? 'has-error' : ''}">
                                                <h5>Model Name: <span class="label label-default"></span></h5>
                                                    <form:input type="text" id="txtModel" path="modelName" class="form-control"></form:input>
                                                    <form:errors path="modelName"></form:errors>
                                                </div>
                                            </spring:bind>

                                            <spring:bind path="productCondition">
                                                <div id="errorMsg" class="form-group ${status.error ? 'has-error' : ''}">
                                                <h5>Product Condition: <span class="label label-default"></span></h5>
                                                    <form:input type="text" id="txtCondition" path="productCondition" class="form-control"></form:input>
                                                    <form:errors path="productCondition"></form:errors>
                                                </div>
                                            </spring:bind>

                                              <spring:bind path="productColor">
                                                <div id="errorMsg" class="form-group ${status.error ? 'has-error' : ''}">
                                                <h5>Product Color: <span class="label label-default"></span></h5>
                                                    <form:input type="text" id="txtColor" path="productColor" class="form-control"></form:input>
                                                    <form:errors path="productColor"></form:errors>
                                                </div>
                                            </spring:bind>

                                              <spring:bind path="inUse">
                                                <div id="errorMsg" class="form-group ${status.error ? 'has-error' : ''}">

                                                                <label for="inUse">In Use:</label><br>
                                								<select id="drpInUse" name="inUse" class="form-control col-xs-12" >
                                								  <option value="yes">Yes</option>
                                								  <option selected value="no">No</option>
                                								</select>

                                                    <form:errors path="inUse"></form:errors>
                                                </div>
                                            </spring:bind>


                                              <spring:bind path="employee">
                                                <div id="errorMsg" class="form-group ${status.error ? 'has-error' : ''}">

                                                                <label for="employee">Employee Id:</label><br>

                                								<select class="form-control col-xs-12"  id="drpEmployeeID" name="employee">
                                								    <option disabled selected> Select </option>
                                								<c:forEach items="${empList}" var="item">
                                    								<option value="${item}">${item}</option><br>
                                    							</c:forEach>
                                								</select>

                                                    <form:errors path="employee"></form:errors>
                                                </div>
                                                <br>  <br>  <br>
                                            </spring:bind>

                                            <button class="btn btn-lg btn-primary" type="submit">Add Asset</button>
                                        </form:form>

                             </div>
                             </div>
                             </div>

</div>

	</body>
</html>
