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

                                    <div class="col-xs-12 col-md-5 text-center" ><h3>Add Employee</h3></div>


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

                                <form:form method="POST" modelAttribute="employeeForm" class="form-signin">


                                             <spring:bind path="employeeId">
                                                <div Id="errorMsg" class="form-group ${status.error ? 'has-error' : ''}">
                                                <h5>Employee Id: <span class="label label-default"></span></h5>
                                                    <form:input id="txtEmployeeID" type="text" path="employeeId" class="form-control"></form:input>
                                                    <form:errors path="employeeId"></form:errors>
                                                </div>
                                            </spring:bind>

                                            <spring:bind path="surname">
                                                <div Id="errorMsg" class="form-group ${status.error ? 'has-error' : ''}">
                                                <h5>Employee Surname: <span class="label label-default"></span></h5>
                                                    <form:input type="text" path="surname" class="form-control"></form:input>
                                                    <form:errors path="surname"></form:errors>
                                                </div>
                                            </spring:bind>

                                            <spring:bind path="name">
                                                <div Id="errorMsg" class="form-group ${status.error ? 'has-error' : ''}">
                                                <h5>Employee Name: <span class="label label-default"></span></h5>
                                                    <form:input id="txtName" type="text" path="name" class="form-control"></form:input>
                                                    <form:errors path="name"></form:errors>
                                                </div>
                                            </spring:bind>

                                            <spring:bind path="mobileNumber">
                                                <div Id="errorMsg" class="form-group ${status.error ? 'has-error' : ''}">
                                                <h5>Mobile Number: <span class="label label-default"></span></h5>
                                                    <form:input id="txtMobile" type="text" path="mobileNumber" class="form-control"></form:input>
                                                    <form:errors path="mobileNumber"></form:errors>
                                                </div>
                                            </spring:bind>

                                              <spring:bind path="location">
                                                <div Id="errorMsg" class="form-group ${status.error ? 'has-error' : ''}">
                                                <h5>Location: <span class="label label-default"></span></h5>
                                                    <form:input id="txtLocation" type="text" path="location" class="form-control"></form:input>
                                                    <form:errors path="location"></form:errors>
                                                </div>
                                            </spring:bind>

                                              <spring:bind path="designation">
                                                <div Id="errorMsg" class="form-group ${status.error ? 'has-error' : ''}">
                                                <h5>Designation: <span class="label label-default"></span></h5>
                                                    <form:input id="txtDesignation" type="text" path="designation" class="form-control"></form:input>
                                                    <form:errors path="designation"></form:errors>
                                                </div>
                                            </spring:bind>

                                            <button id="addEmployee" class="btn btn-lg btn-primary" type="submit">Add Employee</button>
                                        </form:form>

                             </div>
                             </div>
                             </div>

</div>

	</body>
</html>
