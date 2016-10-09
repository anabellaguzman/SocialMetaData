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
<script src="<c:url value="/resources/flatly/bootswatch.js" />"></script>
<script src="<c:url value="/resources/js/jquery.form.js" />"></script>
</head>
<style>
.btn-file {
	position: relative;
	overflow: hidden;
}

.btn-file input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}
</style>

<body>

	<div id="removable">

		<div class="container">

			<div class="col-sm-4" id=serverMSG></div>
			<%-- 	<img src="<c:url value="/resources/images/1.jpg" />" alt="some_text" width="180" height="150"> --%>
			<br> <br> <br>
			<div class="jumbotron">

				<input type="hidden" id="idItem" value="${item.idItem}" />
				<h1>${item.titulo}</h1>
				<div class="row">
					<div class="col-sm-4">
						<img class="img-responsive"
							src="<c:url value="/resources/images/${item.imagen}" />"
							alt="some_text" width="256" height="180">
						<p>
					</div>




					<div class="col-sm-8">




						<sec:authorize access="isAuthenticated()">
							<a class="btn btn-warning" onclick="addToFavs(${item.idItem})">Favorito</a>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
						<a class="btn btn-warning" onclick="autenthicationRequired('Necesitas Iniciar Sesion para realizar eso!')">Favorito</a>
<!-- 							<p class="text-muted"> -->
<!-- 								<small>Necesitas<a href="./login"> Iniciar Sesion </a>para -->
<!-- 									poder comentar -->
<!-- 								</small> -->
<!-- 							</p> -->

						</sec:authorize>
						<a href="https://www.google.com/search?q=${item.titulo}"
							class="btn btn-danger" target="_blank">Google</a>
						<!-- 					<span style="white-space:nowrap;"> -->
						<%-- 					<a href="./addtofavs?idItem=${item.idItem}" > --%>
						<!-- 					<img class="img-responsive" -->
						<%-- 											src="<c:url value="/resources/icons/h2.png" />" --%>
						<!-- 											alt="delete" width="64" height="64"> -->
						<!-- 						</a>			 -->


						<!-- 					</span> -->

						<!-- 					<span style="white-space:nowrap;"> -->
						<%-- 					<a href="./addtofavs?idItem=${item.idItem}" > --%>
						<!-- 					<img class="img-responsive" -->
						<%-- 											src="<c:url value="/resources/icons/h2.png" />" --%>
						<!-- 											alt="delete" width="64" height="64"> -->
						<!-- 						</a>			 -->


						<!-- 					</span> -->




						<%-- 					<a style="display:inline" href="https://www.google.com/search?q=${item.titulo}"  target="_blank"><img style="display:inline" class="img-responsive" --%>
						<%-- 											src="<c:url value="/resources/icons/g2.png" />" --%>
						<!-- 											alt="delete" width="64" height="64"></a> -->
						<%-- 					<a href="https://www.google.com/search?q=${item.titulo}"  target="_blank"><img class="img-responsive" --%>
						<%-- 											src="<c:url value="/resources/icons/f1.png" />" --%>
						<!-- 											alt="delete" width="64" height="64"></a> -->

						<a href="#" class="btn btn-info">Compartir en Facebook</a>
						<p>
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
			<div class="bs-component">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#descripcion" data-toggle="tab">Descripcion</a></li>
					<li><a href="#comentarios" data-toggle="tab">Comentarios</a></li>
					<li><a href="#errores" data-toggle="tab">Reporte de
							Errores</a></li>
					<li><a href="#archivos" data-toggle="tab">Archivos</a></li>
				</ul>

				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade active in" id="descripcion">
						<p>${item.descripcion}</p>
					</div>
					<div class="tab-pane fade" id="archivos">
						<c:out value="${message}" />
						<div class="container" style="margin-top: 20px;">
							<div class="row">

								<div class="col-lg-6 col-sm-6 col-12">
									<div class="jumbotron">
										<h4>Lista de Archivos</h4>
										<ul id=listArchivos class="list-unstyled">
											<c:forEach items="${item.archivos}" var="archivos">
												<li>
													<div>
														<a
															href=<c:url value="/resources/archivos/${archivos.idPosteo}${archivos.comentario}"/>
															download="${archivos.titulo}">${archivos.titulo} </a>
													</div>
												</li>
											</c:forEach>
										</ul>


									</div>
								</div>
								<div class="col-lg-6 col-sm-6 col-12">
									<div class="jumbotron">
										<h4>Subir Nuevo Archivo</h4>
										<form id=formFile class="form-horizontal" method="post"
											action="addArchivo" enctype="multipart/form-data">

											<div class="form-group">
												<div class="col-lg-10">
													<!-- 												<input type="text" class="form-control" id="titulo" -->
													<!-- 													name="titulo"></input> -->
													<input type="hidden" id="idItem" name="idItem"
														value="${item.idItem}">
												</div>
											</div>
											<div class="input-group">
												<span class="input-group-btn"> <span
													class="btn btn-primary btn-file"> Browse&hellip; <input
														type="file" multiple id=fichero name="fichero">
												</span>
												</span> <input id="nombreArchivoInput" type="text"
													class="form-control">
											</div>
											<br>
											<button class="btn btn-default">Cancel</button>
											<!-- 										<button type="Submit" class="btn btn-primary">Subir</button> -->


											<sec:authorize access="isAuthenticated()">
												<button type="Submit" class="btn btn-primary">Subir</button>
												<p>
												<div id=fileUploadSuccess
													class="alert alert-dismissible alert-success"
													style="display: none">

													<button type="button" class="close" data-dismiss="alert">×</button>
													Tu archivo ha sido subido exitosamente.

												</div>

											</sec:authorize>
											<sec:authorize access="isAnonymous()">
												<button type="button" class="btn btn-primary" id="msg"
													onclick="showMsg()">Subir</button>
												<p>
												<div id="loginMsg"
													class="alert alert-dismissible alert-danger"
													style="display: none">
													<div class="bs-component">
														<button type="button" class="close" data-dismiss="alert">×</button>
														<strong>Oh! Necesitas</strong> <a href="./login"
															class="alert-link">Iniciar Sesion</a> para hacer eso.
													</div>
												</div>
											</sec:authorize>
										</form>
									</div>
								</div>

							</div>
						</div>
					</div>

					<div class="tab-pane fade" id="comentarios">
						<ul class="list-unstyled">
							<li id=listComentarios><c:forEach
									items="${item.comentarios}" var="comentarios">
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


						<!-- 						<div class="form-group"> -->
						<!--   <label class="control-label" for="disabledInput">Disabled input</label> -->
						<!--   <input class="form-control" id="disabledInput" type="text" placeholder="Disabled input here..." disabled=""> -->
						<!-- </div> -->
						<div class="bs-component">
							<div class="modal">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" contenteditable="true" id="tituloC"
												onFocus=clearField(tituloC)>Titulo de tu comentario ...</h4>
										</div>
										<div class="modal-body">
											<p contenteditable="true" id="comentarioC"
												onFocus=clearField(comentarioC)>Escribe tu comentario...</p>
										</div>
										<div class="modal-footer">
											<sec:authorize access="isAuthenticated()">
												<button type="button" class="btn btn-primary"
													onclick="addComment()">Comentar</button>
											</sec:authorize>
											<sec:authorize access="isAnonymous()">
												<button type="button" class="btn btn-primary disabled">Comentar</button>
												<p class="text-muted">
													<small>Necesitas<a href="./login"> Iniciar
															Sesion </a>para poder comentar
													</small>
												</p>

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
							<li id=listErrores><c:forEach items="${item.errores}"
									var="errores">
									<div class="panel panel-default">
										<div class="panel-heading">${errores.titulo}</div>
										<div class="panel-body">${errores.comentario}</div>
										<div class="panel-body">
											<p class="text-muted">
												<small>Por: ${errores.usuario.nombre} - Fecha:
													${errores.fecha}</small>
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
											<h4 class="modal-title" contenteditable="true" id="tituloE"
												onFocus=clearField(tituloE)>Titulo del Error</h4>
										</div>
										<div class="modal-body">
											<p contenteditable="true" id="comentarioE"
												onFocus=clearField(comentarioE)>Reporte del error ...</p>
										</div>
										<div class="modal-footer">
											<sec:authorize access="isAuthenticated()">
												<button type="button" class="btn btn-primary"
													onclick="addError()">Reportar</button>
											</sec:authorize>
											<sec:authorize access="isAnonymous()">
												<button type="button" class="btn btn-primary disabled">Reportar</button>
												<p class="text-muted">
													<small>Necesitas<a href="./login"> Iniciar
															Sesion </a>para poder reportar
													</small>
												</p>
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
	
		function clearField(field){
			$(field).empty();
		}
		
		function addToFavs(idItem){					
		
			$.ajax({
				url : "addtofavs",
				type : "GET",
				data : {
					idItem : idItem
				},
				dataType : "html",
				
				
				success : function(data) {
					createAlertSuccess(data, "addToFavsSuccess", "#serverMSG");
					$("#addToFavsSuccess").fadeOut(4000, function() {
						$(this).remove();
					});
				}
				
	

			});
		
		}
		
		function autenthicationRequired(message){
			createAlertSuccess(message, "authReq", "#serverMSG");
			$("#authReq").fadeOut(4000, function() {
				$(this).remove();
			});
			
		}
		
		function createAlertSuccess(data, id, elToAppend) {
			var $newAlert = $('<div/>', {
				'class' : "alert alert-dismiss alert-success",
				'id' : id,
				html : data
			}).append($('<button/>', {
				'type' : "button",
				'class' : "close",
				'data-dismiss' : "alert",
				html : "x"
			}));
			$newAlert.appendTo(elToAppend);
			return;
		}
		
		
// 		Funciones para modals

		$('#serverMSG').ajaxForm({
			success : function(data) {
				createAlertSuccess(data, "autorSuccess", "#serverMsg");
				$("#autorSuccess").fadeOut(4000, function() {
					$(this).remove();
				});
			}

		});
		
		
		function addComment() {
			$.ajax({
				url : "addComment",
				type : "POST",
				data : {
					tituloC : $("#tituloC").text(),
					comentarioC : $("#comentarioC").text(),
					idItem : $("#idItem").val()
				},
				dataType : "html",
				success : function(data) {
					$("#listComentarios").append(data);
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
				},
				dataType : "html",
				success : function(data) {
					$("#listErrores").append(data);
				}

			});
		}

		$(document).on(
				'change',
				'.btn-file :file',
				function() {
					var input = $(this), numFiles = input.get(0).files ? input
							.get(0).files.length : 1, label = input.val()
							.replace(/\\/g, '/').replace(/.*\//, '');
					input.trigger('fileselect', [ numFiles, label ]);
				});

		$(document).ready(function() {
			$('.btn-file :file').on('fileselect',function(event, numFiles, label) {
				var input = $(this).parents('.input-group').find(':text'), 
				log = numFiles > 1 ? numFiles + ' files selected': label;
				if (input.length) {
					input.val(log);
				} else {if (log)
						alert(log);
						}

				});
		});

		function showMsg() {
			$("#loginMsg").show();
		}

		$(document).ready(function() {
			// bind 'myForm' and provide a simple callback function 
			$('#formFile').ajaxForm({
				dataType : "html",
				success : function(data) {
					$("#listArchivos").append(data);
					$("#fileUploadSuccess").show();
					
					

				}

			});
		});
</script>


</body>



</html>
