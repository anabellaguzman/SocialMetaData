<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Acceso Denegado | Social Metadata</title>
</head>
<body>

		<br /> <br /> <br />
		<h1>
			Access Denied for User : <span style="color: red;">${username}</span>
		</h1>
		<c:url var="logoutUrl" value="j_spring_security_logout" />
		<form action="${logoutUrl}" method="post">
			<input type="submit" value="Log out" /> <input type="hidden"
				name="${_csrf.parameterName}" value="${_csrf.token}" />
				
		</form>

	

</body>
</html>