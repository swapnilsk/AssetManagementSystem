<!-- Bootstrap Borders -->
<!DOCTYPE html>
<html>
	<head>
          <meta charset="utf-8">
          <title>Create an account</title>
          <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
          <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

        <style>
            /* CSS for Square boxes */
            span {
                display: inline-block;
                width: 1150px;
                height: 550px;
                margin-left: 0px;
                background-color: #DCDCDC;
            }
        </style>
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
                <span class="border border-dark">
                    <h3>Asset Manager Home</h3><br><br>
                    <input class= "button" type="button" value="Add Employee" id="btnAddEmployee"  onclick="location.href='/addemployee'"/><br><br>
                    <input type="button" value="Add Asset" id="btnAddAsset" onclick="location.href='/addasset'"/><br><br>
                    <input type="button" value="View Asset List" id="btnViewAssets" onclick="location.href='/viewassetlist'"/>
                </span>
            </div>
         </div>
    </body>
</html>