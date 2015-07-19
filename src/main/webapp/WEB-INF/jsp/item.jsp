<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<script src="<c:url value="/resources/flatly/bootstrap.min.js" />"></script>
<!--     <script src="../resources/flatly/bootswatch.js"></script> -->
<script src="<c:url value="/resources/flatly/bootswatch.js" />"></script>


</head>


<body>
	<div class="container">
		<br>
		<div class="jumbotron">
			<h1>${item.titulo}</h1>

			<ul class="list-group">
				<li class="list-group-item">Formato: ${item.tipo.descripcion}</li>
				<li class="list-group-item">Autores : <c:forEach
						items="${item.autores}" var="valAutor">
					
					${valAutor.apellido}, ${valAutor.nombre}.  

				</c:forEach>

				</li>
				<li class="list-group-item">Año: ${item.año}</li>
				<li class="list-group-item">Cantidad votos :
					${item.cantidadVotos}</li>
				<li class="list-group-item">Idioma : ${item.idioma.idioma}</li>
				<c:forEach items="${item.valorAtributoPropio}" var="valorAtributo">

					<li class="list-group-item">${valorAtributo.pk.atributo.nombre}
						: ${valorAtributo.valor}</li>
				</c:forEach>
			</ul>
		</div>
		<div>
			<ul class="nav nav-tabs">
				<li class="active"><a href="#descripcion" data-toggle="tab"
					aria-expanded="true">Descripcion</a></li>
				<li class=""><a href="#comentarios" data-toggle="tab"
					aria-expanded="false">Comentarios</a></li>
				<li class=""><a href="#errores" data-toggle="tab"
					aria-expanded="false">Reporte de Errores</a></li>
				<li class=""><a href="#archivos" data-toggle="tab"
					aria-expanded="false">Archivos</a></li>

			</ul>

			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade active in" id="descripcion">
					<p>${item.descripcion}</p>
				</div>
				<div class="tab-pane fade" id="comentarios">
					<p>Comentario 1 2 3</p>
				</div>
			</div>

		</div>
	</div>



</body>


</html>
