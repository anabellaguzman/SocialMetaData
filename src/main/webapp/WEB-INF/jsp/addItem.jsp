<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agregar Nuevo Item</title>


<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.11.2.js" />"></script>

<!-- <script type="text/javascript" -->
<!--     src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->

<script type="text/javascript">

function jsFunction() {	
	var myselect = document.getElementById("selectOpt");
	console.log("CONSOLEEEEEEEEEEEE");
	$.ajax({
		url : 'selectedTipoItem.do',
		type : "GET",
		data : {"id" : myselect.options[myselect.selectedIndex].id},
		success: function (tipoItem) {
			console.log("SUCCESS");
			$('#result').text(tipoItem.descripcion + ', id ' + tipoItem.idTipoItem);

		}
	});
}

	

// <h2>Random Person Generator</h2>

//     <input type="submit" id="randomPerson" value="Get Random Person" /><br/><br/>

//     <div id="personResponse"> </div>



// $('#randomPerson').click(function() {

//   $.getJSON('${pageContext.request.contextPath}/api/person/random', function(person) {

//     $('#personResponse').text(person.name + ', age ' + person.age);

//   });

// });
 

	
	
	

</script>
</head>
<body>

	<form role="form"></form>

	<select class="form-control" onchange="jsFunction()" id="selectOpt">
		<c:forEach items="${listTipoItem}" var="tipoItem">
			<option id="${tipoItem.idTipoItem}">${tipoItem.descripcion}</option>
		</c:forEach>
	</select>
	
	<select class="form-control" id="selectOpt1">
		<c:forEach items="${tipoItemAtributosLoaded.getAtributoItem()}" var="tipoItem1">
			<option id="${atributoItem.getIdAtributoItem()}">${atributoItem.getNombre()}</option>
		</c:forEach>
	</select>
	
	<div id="result"></div>

</body>
</html>