<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agregar Nuevo Item</title>


<script src="<c:url value="/resources/js/jquery-1.11.2.js" />"></script>

<script type="text/javascript">
	function jsFunction() {
		var myselect = document.getElementById("selectOpt");
		alert(myselect.options[myselect.selectedIndex].id);

		$.ajax({
			url : 'selectedTipoItem.do',
			type : "GET",
			dataType: "json",
			data : {"id" : myselect.options[myselect.selectedIndex].id} 
		// 			
		// 			success: function (data) {
		// 			    alert(data);
		// 			}
		});

	}
</script>

</head>
<body>


	<form role="form"></form>

	<select class="form-control" onchange="jsFunction()" id="selectOpt">
		<c:forEach items="${listTipoItem}" var="tipoItem">
			<option id="${tipoItem.idTipoItem}">${tipoItem.descripcion}</option>
		</c:forEach>
	</select>

</body>
</html>