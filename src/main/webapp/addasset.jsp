<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
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

        <form:form method="POST" modelAttribute="assetForm" class="form-signin">
        <div class="text-center">
            <h2 class="form-signin-heading">Asset Details</h2>
            </div>

            <div class="panel panel-default">
            <div class="panel-body">
             <spring:bind path="assetId">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                <h5>Asset Id: <span class="label label-default"></span></h5>
                    <form:input type="text" path="assetId" class="form-control"></form:input>
                    <form:errors path="assetId"></form:errors>
                </div>
            </spring:bind>
            
            <spring:bind path="productName">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                <h5>Product Name: <span class="label label-default"></span></h5>
                    <form:input type="text" path="productName" class="form-control"></form:input>
                    <form:errors path="productName"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="modelName">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                <h5>Model Name: <span class="label label-default"></span></h5>
                    <form:input type="text" path="modelName" class="form-control"></form:input>
                    <form:errors path="modelName"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="productCondition">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                <h5>Product Condition: <span class="label label-default"></span></h5>
                    <form:input type="text" path="productCondition" class="form-control"></form:input>
                    <form:errors path="productCondition"></form:errors>
                </div>
            </spring:bind>
            
              <spring:bind path="productColor">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                <h5>Product Color: <span class="label label-default"></span></h5>
                    <form:input type="text" path="productColor" class="form-control"></form:input>
                    <form:errors path="productColor"></form:errors>
                </div>
            </spring:bind>
            
              <spring:bind path="inUse">
                <div class="form-group ${status.error ? 'has-error' : ''}">

                                <label for="inUse">In Use:</label><br>
								<select id="inUse" name="inUse">
								  <option value="yes">Yes</option>
								  <option selected value="no">No</option>
								</select>
                                
                    <form:errors path="inUse"></form:errors>
                </div>
            </spring:bind>
            
            
              <spring:bind path="employee">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                                 
                                <label for="employee">Employee Id:</label><br>
                                
								<select id="employee" name="employee">
								    <option disabled selected> Select </option>
								<c:forEach items="${empList}" var="item">
    								<option value="${item}">${item}</option><br>   
    							</c:forEach>
								</select>
                                
                    <form:errors path="employee"></form:errors>
                </div>
            </spring:bind>
            <div class="text-center">
            <button class="btn btn-lg btn-primary" type="submit">Add Asset</button>
            </div>
            </div>
            </div>
        </form:form>

    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
  </body>
</html>
