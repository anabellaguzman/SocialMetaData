<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>
<script src="<c:url value="/resources/flatly/bootstrap.min.js" />"></script>
<script src="../resources/flatly/bootswatch.js"></script>
<script src="<c:url value="/resources/flatly/bootswatch.js" />"></script>
</head>


<body>

	<div id="removable">
		<div class="container">
			<%-- 	<img src="<c:url value="/resources/images/1.jpg" />" alt="some_text" width="180" height="150"> --%>
			<br>
			<div class="jumbotron">
				<input type="hidden" id="idItem" value="${item.idItem}" />
				<h1>${item.titulo}</h1>
				<div class="row">
					<div class="col-sm-4">
						<img class="img-responsive"
							src="<c:url value="/resources/images/${item.imagen}" />"
							alt="some_text" width="460" height="345">
					</div>
					<div class="col-sm-8">
						<ul class="list-group">
							<li class="list-group-item">Formato:
								${item.tipo.descripcion}</li>
							<li class="list-group-item">Autores : <c:forEach
									items="${item.autores}" var="valAutor">
					
					${valAutor.apellido}, ${valAutor.nombre}.  

				</c:forEach>

							</li>
							<li class="list-group-item">Año: ${item.year}</li>
							<li class="list-group-item">Cantidad votos :
								${item.cantidadVotos}</li>
							<li class="list-group-item">Idioma : ${item.idioma.idioma}</li>
							<c:forEach items="${item.valorAtributoPropio}"
								var="valorAtributo">

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
					<div class="tab-pane fade" id="archivos">
						<p>archivoooos</p>
						<c:out value="${message}" />
						<form method="post" action="addArchivo"
							enctype="multipart/form-data">
							<table>
								<tr>
									<td>Seleccionar archivo:</td>
									<td><input type="file" id=fichero name="fichero"></td>
									<td><input type="text" id=titulo name="titulo">titulo archivo</td>
									<td><input type="hidden" id="idItem" name="idItem" value="${item.idItem}"></td>
								</tr>
								<tr>

								</tr>
								<tr>
									<td colspan="2" align="center"><input type="submit"
										value="Subir fichero"> <!--     	<button type="button" class="btn btn-primary" -->
										<!-- 								onclick="uploadFile()">Submit</button></td> -->
								</tr>
							</table>
						</form>
					</div>
					<div class="tab-pane fade" id="comentarios">
						<ul class="list-unstyled">
							<li><c:forEach items="${item.comentarios}" var="comentarios">
									<div class="panel panel-default">
										<div class="panel-heading">${comentarios.titulo}</div>
										<div class="panel-body">${comentarios.comentario}</div>
										<div class="panel-body">
											<p class="text-muted">
												<small>Por: ${comentarios.usuario.nombre} - Fecha:
													${comentarios.fecha}</small>
											</p>
										</div>
									</div>
								</c:forEach></li>



						</ul>
						<div class="bs-component">
							<div class="modal">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" contenteditable="true" id="tituloC">Titulo
												de tu comentario ...</h4>
										</div>
										<div class="modal-body">
											<p contenteditable="true" id="comentarioC">Escribe tu
												comentario...</p>
										</div>
										<div class="modal-footer">
											<sec:authorize access="isAuthenticated()">
												<button type="button" class="btn btn-primary"
													onclick="addComment()">Enviar</button>
											</sec:authorize>
											<sec:authorize access="isAnonymous()">
												<button type="button" class="btn btn-primary disabled">Enviar</button>
											</sec:authorize>

										</div>
									</div>
								</div>
							</div>
							<div id="source-button" class="btn btn-primary btn-xs"
								style="display: none;">&lt; &gt;</div>
						</div>

					</div>

					<div class="tab-pane fade" id="errores">
						<ul class="list-unstyled">
							<li><c:forEach items="${item.errores}" var="errores">
									<div class="panel panel-default">
										<div class="panel-heading">${errores.titulo}</div>
										<div class="panel-body">${errores.comentario}</div>
									</div>
								</c:forEach></li>

						</ul>
						<div class="bs-component">
							<div class="modal">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" contenteditable="true" id="tituloE">Titulo
												del Error</h4>
										</div>
										<div class="modal-body">
											<p contenteditable="true" id="comentarioE">Reporte del
												error ...</p>
										</div>
										<div class="modal-footer">
											<sec:authorize access="isAuthenticated()">
												<button type="button" class="btn btn-primary"
													onclick="addError()">Reportar</button>
											</sec:authorize>
											<sec:authorize access="isAnonymous()">
												<button type="button" class="btn btn-primary disabled">Reportar</button>
											</sec:authorize>

										</div>
									</div>
								</div>
							</div>
							<div id="source-button" class="btn btn-primary btn-xs"
								style="display: none;">&lt; &gt;</div>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>

	<div id="subViewDiv" class="bs-component"></div>
	<script type="text/javascript">
// 		function addArchivo() {
// 			console.log($("#idItem").val());
// 			$.ajax({
// 				url : 'addArchivo',
// 				//				contentType : false,
// 				type : 'POST',
// 				data : {
// 					idItem : 5,
// 				//					fileFormBean : $('#fichero'),

// 				},
// 				//				cache : false,
// 				//				processData : false,
// 				success : function(data) {
// 					alert(':)');
// 				}
// 			});
// 		}
		function addComment() {
			$.ajax({
				url : "addComment",
				type : "POST",
				data : {
					tituloC : $("#tituloC").text(),
					comentarioC : $("#comentarioC").text(),
					idItem : $("#idItem").val()
				}

			});
		}

		function addError() {
			$.ajax({
				url : "addError",
				type : "POST",
				data : {
					tituloE : $("#tituloE").text(),
					comentarioE : $("#comentarioE").text(),
					idItem : $("#idItem").val()
				}

			});
		}
	</script>


</body>



</html>
