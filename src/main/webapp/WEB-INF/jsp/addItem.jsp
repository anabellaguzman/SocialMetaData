<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<title>Agregar Nuevo Item</title>
</head>


<body>
	<div class="col-lg-6">
		<div class="well bs-component">
			<form class="form-horizontal">
				<fieldset id="fs_generalAtributes">
					<legend>Nuevo Item</legend>

					<div class="form-group">
						<label for="inputDefault" class="col-lg-2 control-label">Titulo</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="idTituloItem"></input>
						</div>
					</div>

					<div class="form-group">
						<label for="inputDefault" class="col-lg-2 control-label">Año</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="idAñoItem"></input>
						</div>
					</div>


					<div class="form-group">
						<label for="inputDefault" class="col-lg-2 control-label">Autor</label>
						<div class="col-lg-10">
							<input id="search" class="form-control"> <input
								type="hidden" class="form-control" id="idAutor"></input>

						</div>


					</div>

					<div class="form-group">
						<label for="inputDefault" class="col-lg-2 control-label">Temas
							Relacionados</label>
						<div class="col-lg-10" id="temasRelacionados">
							<input id="autocompleteTema" class="form-control"> <input
								type="hidden" class="form-control" id="idTema"></input>
							<div class="bs-component" id="contenedorTemas"></div>

						</div>


					</div>

					<div class="form-group">
						<label for="select" class="col-lg-2 control-label">Tipo
							Item</label>
						<div class="col-lg-10">
							<select class="form-control" onchange="jsFunction()"
								id="selectOpt">
								<c:forEach items="${listTipoItem}" var="tipoItem">
									<option id="${tipoItem.idTipoItem}">${tipoItem.descripcion}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label for="select" class="col-lg-2 control-label">Idioma</label>
						<div class="col-lg-10">
							<select class="form-control" id="selectIdioma">
								<c:forEach items="${listIdioma}" var="idioma">
									<option id="${idioma.idIdioma}">${idioma.idioma}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="textArea" class="col-lg-2 control-label">Descripcion</label>
						<div class="col-lg-10">
							<textarea class="form-control" rows="3" id="textArea"></textarea>
							<span class="help-block">No debe superar los 500 caracteres</span>
						</div>
					</div>

					<fieldset id="fs_individualAtributes">
						<c:forEach items="${listAtributosFistItem}" var="atributoItem">

							<div class='form-group'>
								<label class='col-lg-2 control-label' for='inputDefault'>${atributoItem.nombre}</label>
								<div class='col-lg-10'>
									<input type='text' class='form-control'
										id="${atributoItem.idAtributoItem}">
								</div>
							</div>
						</c:forEach>
					</fieldset>
					<div class="form-group">
						<div class="col-lg-10 col-lg-offset-2">
							<button class="btn btn-default">Cancel</button>
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</div>
				</fieldset>

			</form>
		</div>
	</div>




	<script type="text/javascript">
		function jsFunction() {
			vNombreAtributos = new Array();
			var myselect = document.getElementById("selectOpt");
			var fs_iA = document.getElementById("fs_individualAtributes");
			$(fs_iA).empty();
			$
					.getJSON(
							'selectedTipoItem.do',
							"id=" + myselect.options[myselect.selectedIndex].id,
							function(nombreAtributos) {
								var items = [];
								$
										.each(
												nombreAtributos,
												function(key, val) {
													items
															.push("<div class='form-group'> <label class='col-lg-2 control-label' for='inputDefault'>"
																	+ val.nombre
																	+ "</label> <div class='col-lg-10'> <input type='text' class='form-control' id="+val.idAtributoItem+"> </input> </div> </div>");
												});
								$("<ul/>", {
									html : items.join("")
								}).appendTo("#fs_individualAtributes");
							});
		}

		function addTemaRelacionadoInput() {

			var nodoPadre = document.getElementById("")

			alert("HOLA");

		}

		$(function() {
			$("#search").autocomplete({
				appentTo : "#search",
				delay : 500,
				source : function(request, response) {
					$.ajax({
						url : "searchAutor.do",
						type : "GET",
						data : {
							term : request.term
						},
						dataType : "json",
						success : function(data) {
							response($.map(data, function(v, i) {
								return {
									value : v.idAutor,
									label : v.nombre + " " + v.apellido,
								};
							}));
						}
					});
				},
				select : function(event, ui) {
					$("#search").val(ui.item.label);
					$("#idAutor").val(ui.item.value);
					return false;
				}
			});
		});

		$(function() {
			$("#autocompleteTema").autocomplete({
				appentTo : "#autocompleteTema",
				delay : 500,
				source : function(request, response) {
					$.ajax({
						url : "searchTema.do",
						type : "GET",
						data : {
							term : request.term
						},
						dataType : "json",
						success : function(data) {
							response($.map(data, function(v, i) {
								return {
									label : v.tema,
									value : v.idTema
								};
							}));
						}
					});
				},
				select : function(event, ui) {
					$("#idTema").val(ui.item.value);
					$("#autocompleteTema").val(ui.item.label);

					crearTemaRel(ui.item.value, ui.item.label);

					return false;
				}
			});
		});

		function crearTemaRel(id, value) {

			var $newTemaRel = $('<div/>', {
				'class' : "col-lg-4",
			}).append($('<div/>', {
				'class' : "bs-component",
			}).append($('<div/>', {
				'class' : "alert alert-dismissible alert-success",
				'id' : id,
				html : value
			}).append($('<button/>', {
				'type' : "button",
				'class' : "close",
				html : "x"
			}))));

			$newTemaRel.appendTo("#contenedorTemas");

			// 			var e = document.createElement('div');
			// 			e.class = 'class';
			// 			e.innerHTML = 'some Text';

			// 			var $e = $(e);

			// 			console.log(id + value);

			// 			var capaDiasSemana = $('<div/>', {
			// 			    'class' : 'diassemana',
			// 			    'id'    : 'id_' + user.id
			// 			});

			// 			$('<li>', {
			// 			    id: '#tab-' + count
			// 			}).append($('<a>', {
			// 			    href: some_variable,
			// 			    text: $(this).text()
			// 			})).appendTo('#uls');

		}
	</script>

	<!-- 								<div class="col-lg-4"> -->
	<!-- 									<div class="bs-component"> -->
	<!-- 										<div class="alert alert-dismissible alert-success"> -->
	<!-- 											<button type="button" class="close">×</button> -->
	<!-- 											Chisme  -->
	<!-- 										</div> -->
	<!-- 									</div> -->
	<!-- 								</div> -->


</body>
</html>