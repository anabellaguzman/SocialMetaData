<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Idioma Management</title>
</head>
<body>
<h1>Idiomas Data</h1>
<form:form action="idioma.do" method="POST" commandName="idioma">
	<table>
		<tr>
			<td>Idioma ID</td>
			<td><form:input path="idIdioma" /></td>
		</tr>
		<tr>
			<td>Idioma</td>
			<td><form:input path="idioma" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" name="action" value="Add" />
				<input type="submit" name="action" value="Edit" />
				<input type="submit" name="action" value="Delete" />
				<input type="submit" name="action" value="Search" />
			</td>
		</tr>
	</table>
</form:form>
<br>
<table border="1">
	<th>ID</th>
	<th>Idioma</th>

	<c:forEach items="${idiomaList}" var="idioma">
		<tr>
			<td>${idioma.idIdioma}</td>
			<td>${idioma.idioma}</td>

		</tr>
	</c:forEach>
</table>

</body>
</html>