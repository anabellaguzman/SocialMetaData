<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="<c:url value="/resources/flatly/bootstrap.css" />" media="screen">
<link rel="stylesheet"
	href="<c:url value="/resources/flatly/bootswatch.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/jquery-ui.min.css" />">
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>

</head>


<body>

	<div class="container">

		<div class="jumbotron">
			<h1>${item.titulo}</h1>


			<ul class="list-group">
				<li class="list-group-item">Formato: ${item.tipo.descripcion} </li>
				<li class="list-group-item">Autores : 
				<c:forEach items="${item.autores}" var="valAutor">
					
					${valAutor.apellido}, ${valAutor.nombre}.  

				</c:forEach>
				
				</li>
				<li class="list-group-item">Año: ${item.año} </li>
				<li class="list-group-item">Cantidad votos : ${item.cantidadVotos} </li>
				<li class="list-group-item">Idioma : ${item.idioma.idioma} </li>
				<c:forEach items="${item.valorAtributoPropio}" var="valorAtributo">
					
					<li class="list-group-item">${valorAtributo.pk.atributo.nombre} : ${valorAtributo.valor} </li>

				</c:forEach>
				<li class="list-group-item">Descripcion: ${item.descripcion} </li>

			</ul>
		</div>




	</div>

</body>


</html>
