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
				<li class="list-group-item">Formato : ${item.tipo.descripcion} </li>
				<c:forEach items="${item.valorAtributoPropio}" var="valorAtributo">
					
					<li class="list-group-item">${valorAtributo.pk.atributo.nombre} : ${valorAtributo.valor} </li>

				</c:forEach>

			</ul>
		</div>




	</div>

</body>

<!-- <script type="text/javascript"> 
	var l = document.getElementById("listAtributes");
	var a = "${item.descripcion}";

	var valorAtributo = "${item.valorAtributoPropio}";

	console.log("DESCRIPCION");
	console.log(a);

	var texto = document.createTextNode(a);

	var newLi = document.createElement("li");

	newLi.appendChild(texto);
	l.appendChild(newLi);

	console.log(a);
	console.log(valorAtributo);
 </script> -->

</html>
