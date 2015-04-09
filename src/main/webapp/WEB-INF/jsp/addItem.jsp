<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agregar Nuevo Item</title>
</head>
<body>


	<form role="form" >


	</form>


<form:form action="selectedTipoItem.do" method="POST" commandName="tipoItem">
		<select class="form-control" onchange="">
			<c:forEach items="${listTipoItem}" var="tipoItem">
				<option id="${tipoItem.idTipoItem}">${tipoItem.descripcion}</option>
			</c:forEach>
		</select>
		<input type="submit" name="action" value="Aceptar" />
		
</form:form>



</body>
</html>