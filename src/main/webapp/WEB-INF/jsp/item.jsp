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
		<%-- 	<img src="<c:url value="/resources/images/1.jpg" />" alt="some_text" width="180" height="150"> --%>
		<br>
		<div class="jumbotron">
			<h1>${item.titulo}</h1>
			<div class="row">
				<div class="col-lg-4 col-md-5 col-sm-6">
					<img src="<c:url value="/resources/images/${item.imagen}" />"
						alt="some_text" width="180" height="150">
				</div>
				<div class="col-lg-4 col-md-5 col-sm-6">
					<ul class="list-group">
						<li class="list-group-item">Formato: ${item.tipo.descripcion}</li>
						<li class="list-group-item">Autores : <c:forEach
								items="${item.autores}" var="valAutor">
					
					${valAutor.apellido}, ${valAutor.nombre}.  

				</c:forEach>

						</li>
						<li class="list-group-item">Año: ${item.year}</li>
						<li class="list-group-item">Cantidad votos :
							${item.cantidadVotos}</li>
						<li class="list-group-item">Idioma : ${item.idioma.idioma}</li>
						<c:forEach items="${item.valorAtributoPropio}" var="valorAtributo">

							<li class="list-group-item">${valorAtributo.pk.atributo.nombre}
								: ${valorAtributo.valor}</li>
						</c:forEach>
					</ul>
				</div>
			</div>
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
					<ul>
						<li>
						<c:forEach items="${item.comentarios}" var="comentarios">
							<div class="panel panel-default">
								<div class="panel-heading">${comentarios.titulo}</div>
								<div class="panel-body">${comentarios.comentario}</div>
							</div>
						</c:forEach>
						</li>
						
						<li>
							<div class="bs-component">
								<div class="modal">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">×</button>
												<h4 class="modal-title">Modal title</h4>
											</div>
											<div class="modal-body">
												<p>One fine body…</p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
												<button type="button" class="btn btn-primary">Save
													changes</button>
											</div>
										</div>
									</div>
								</div>
								<div id="source-button" class="btn btn-primary btn-xs"
									style="display: none;">&lt; &gt;</div>
							</div>


						</li>

					</ul>


				</div>
			</div>

		</div>
	</div>


</body>


</html>
