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
			<%-- 	<img src="<c:url value="/resources/images/1.jpg" />" alt="some_text" width="180" height="150"> --%>
			<br>
			<div class="jumbotron">
				<input type="hidden" id="idItem" />

				<div class="row">
					<div class="col-sm-4"></div>

				</div>
			</div>
			<div>
				<ul class="nav nav-tabs">
					<li class="active"><a href="#archivos" data-toggle="tab"
						aria-expanded="true">Descripcion</a></li>
					<li class=""><a href="#comentarios" data-toggle="tab"
						aria-expanded="false">Comentarios</a></li>
					<li class=""><a href="#errores" data-toggle="tab"
						aria-expanded="false">Reporte de Errores</a></li>
					<li class=""><a href="#descripcion" data-toggle="tab"
						aria-expanded="false">Archivos</a></li>

				</ul>

				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade " id="descripcion"></div>
					<div class="tab-pane fade active in" id="archivos">
						<p>archivoooos</p>



						<div class="container" style="margin-top: 20px;">
							<div class="row">

								<div class="col-lg-6 col-sm-6 col-12">
									<div class="jumbotron">
										<h1>Bootstrap File Input Demo</h1>
									</div>
								</div>

								<div class="col-lg-6 col-sm-6 col-12">
									<h4>Subir Nuevo Archivo</h4>
									<form class="form-horizontal" method="post" action="addArchivo"
										enctype="multipart/form-data">

										<div class="form-group">
											<label for="inputDefault" class="col-lg-2 control-label">Titulo</label>
											<div class="col-lg-10">
												<input type="text" class="form-control" id="titulo"
													name="titulo"></input> <input type="hidden" id="idItem"
													name="idItem" value="5">
											</div>
										</div>
										<div class="input-group">
											<span class="input-group-btn"> <span
												class="btn btn-primary btn-file"> Browse&hellip; <input
													type="file" multiple id=fichero name="fichero">
											</span>
											</span> <input type="text" class="form-control" readonly>
										</div>
										<br>
										<button class="btn btn-default">Cancel</button>
										<button type="Submit" class="btn btn-primary">Subir</button>
									</form>
								</div>

							</div>
						</div>
					</div>






				</div>


			</div>
		</div>


	</div>
	<script type="text/javascript">
		$(document).on(
				'change',
				'.btn-file :file',
				function() {
					var input = $(this), numFiles = input.get(0).files ? input
							.get(0).files.length : 1, label = input.val()
							.replace(/\\/g, '/').replace(/.*\//, '');
					input.trigger('fileselect', [ numFiles, label ]);
				});

		$(document)
				.ready(
						function() {
							$('.btn-file :file')
									.on(
											'fileselect',
											function(event, numFiles, label) {

												var input = $(this).parents(
														'.input-group').find(
														':text'), log = numFiles > 1 ? numFiles
														+ ' files selected'
														: label;

												if (input.length) {
													input.val(log);
												} else {
													if (log)
														alert(log);
												}

											});
						});

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

		// 		$(document).on(
		// 				'change',
		// 				'.btn-file :file',
		// 				function() {
		// 					var input = $(this), numFiles = input.get(0).files ? input
		// 							.get(0).files.length : 1, label = input.val()
		// 							.replace(/\\/g, '/').replace(/.*\//, '');
		// 					input.trigger('fileselect', [ numFiles, label ]);
		// 				});

		// 		$(document)
		// 				.ready(
		// 						function() {
		// 							$('.btn-file :file')
		// 									.on(
		// 											'fileselect',
		// 											function(event, numFiles, label) {

		// 												var input = $(this).parents(
		// 														'.input-group').find(
		// 														':text'), log = numFiles > 1 ? numFiles
		// 														+ ' files selected'
		// 														: label;

		// 												if (input.length) {
		// 													input.val(log);
		// 												} else {
		// 													if (log)
		// 														alert(log);
		// 												}

		// 											});
		// 						});
	</script>
</body>



</html>
