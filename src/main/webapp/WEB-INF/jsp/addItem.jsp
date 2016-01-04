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

	<div id="removable">
		<div class="col-lg-6">
			<br>
			<div class="well bs-component">
				<form class="form-horizontal" method="POST" action="addItem">
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



								<select class="form-control" id="selectYear">

								</select>

							</div>

						</div>





						<div class="form-group">

							<label for="inputDefault" class="col-lg-2 control-label">Autor</label>

							<div class="col-lg-10">

								<input id="search" class="form-control"> <input
									type="hidden" class="form-control" id="idAutor"></input>

								<ul class="list-group" id="listAutores">

								</ul>

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

										<option value="${tipoItem.idTipoItem}">${tipoItem.descripcion}</option>

									</c:forEach>

								</select>

							</div>

						</div>



						<div class="form-group">

							<label for="select" class="col-lg-2 control-label">Idioma</label>

							<div class="col-lg-10">

								<select class="form-control" id="selectIdioma">

									<c:forEach items="${listIdioma}" var="idioma">

										<option value="${idioma.idIdioma}">${idioma.idioma}</option>

									</c:forEach>

								</select>

							</div>

						</div>

						<div class="form-group">

							<label for="textArea" class="col-lg-2 control-label">Descripcion</label>

							<div class="col-lg-10">

								<textarea class="form-control" rows="3" id="textArea"></textarea>

								<span class="help-block">No debe superar los 500

									caracteres</span>

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

								<button type="button" class="btn btn-primary"
									onclick="addNewItem()">Submit</button>



							</div>

						</div>

					</fieldset>



				</form>

			</div>

		</div>
	</div>

	<div id="subViewDiv" class="bs-component"></div>







	<script type="text/javascript">
		$(function loadFileUploadView() {

		});

		function addNewItem() {

			var titulo = $("#idTituloItem").val();
			var year = $("#selectYear").val();
			var tipoItem = $("#selectOpt").val();
			var idioma = $("#selectIdioma").val();
			var descripcion = $("#textArea").val();

			var cTemas = document.getElementById("contenedorTemas");
			var lTemas = cTemas.getElementsByTagName("label");
			var lengthTemas = lTemas.length;
			var idTemas = [];
			for (var i = 0; i < lengthTemas; ++i) {
				var idT = lTemas[i].id;
				idTemas.push(idT);
				console.log(idT);
			}

			var fsIndAtr = document.getElementById("fs_individualAtributes");
			var inputIndAtr = fsIndAtr.getElementsByTagName("input");
			var lIndAtr = inputIndAtr.length;

			console.log("inputInd");
			console.log(inputIndAtr);

			// 			console.log(lIndAtr);
			var idIndAtr = [];
			var valIndAtr = [];
			for (var i = 0; i < lIndAtr; ++i) {

				console.log("console.log(inputIndAtr[i].id);");
				idIndAtr.push(inputIndAtr[i].id);
				console.log(inputIndAtr[i].id);
				console.log("console.log(inputIndAtr[i].value);");
				console.log(inputIndAtr[i].value);
				valIndAtr.push(inputIndAtr[i].value);

				// 				console.log(inIndAtr[i]);
				// 				console.log(inIndAtr[i].val());
				// 				var idA = inIndAtr[i].id;
				// 				idAutores.push(idA);
			}

			var x = document.getElementById("listAutores");
			var y = x.getElementsByTagName("li");
			var length = y.length;
			var idAutores = [];
			for (var i = 0; i < length; ++i) {
				var idA = y[i].id;
				idAutores.push(idA);
			}
			$.ajax({
				url : "addItem",
				type : "POST",
				data : {
					tituloItem : titulo,
					year : year,
					idAutores : idAutores.toString(),
					idTemas : idTemas.toString(),
					idTipoItem : tipoItem,
					idIdioma : idioma,
					descripcion : descripcion,
					idOwnAtr : idIndAtr.toString(),
					valOwnAtr : valIndAtr.toString(),

				},
				success : function(data, textStatus) {

					// data.redirect contains the string URL to redirect to
					// 				            window.location.href = data.redirect;
					console.log("data");
					console.log(data);
					location.href = document.URL.substr(0, document.URL
							.lastIndexOf('/'))
							+ "/item?idItem=" + data;

				}
			});

		}

		$(function year() {
			var min = 1999, max = new Date().getFullYear(), select = document
					.getElementById('selectYear');
			for (var i = min; i <= max; i++) {
				var opt = document.createElement('option');
				opt.value = i;
				opt.innerHTML = i;
				select.appendChild(opt);
			}
			select.value = new Date().getFullYear();
		});

		function jsFunction() {

			vNombreAtributos = new Array();
			var myselect = document.getElementById("selectOpt");
			var fs_iA = document.getElementById("fs_individualAtributes");
			$(fs_iA).empty();

			$
					.getJSON(
							'selectedTipoItem.do',
							"id="
									+ myselect.options[myselect.selectedIndex].value,
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
								$("#fs_individualAtributes").append(items);
							});

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
					// 					$("#search").val(ui.item.label);
					$("#idAutor").val(ui.item.value);
					crearAutor(ui.item.value, ui.item.label);
					clearThis("search");
					return false;
				}
			});
		});

		function crearAutor(id, value) {
			var $newAutor = $('<li/>', {
				'class' : "list-group-item",
				'id' : id,
				html : value
			}).append($('<button/>', {
				'type' : "button",
				'class' : "close",
				'onclick' : "deleteThisLi(" + id + ")",
				html : "x"
			}));
			$newAutor.appendTo("#listAutores");
		}
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
					// 					$("#autocompleteTema").val(ui.item.label);
					crearTemaRel(ui.item.value, ui.item.label);
					clearThis("autocompleteTema");
					return false;
				}
			});
		});
		function crearTemaRel(id, value) {
			var $newTemaRel = $('<div/>', {
				'class' : "col-lg-4",
				'id' : "temaDiv" + id,
			}).append($('<div/>', {
				'class' : "bs-component",
			}).append($('<label/>', {
				'class' : "alert alert-dismissible alert-success",
				'id' : id,
				html : value
			}).append($('<button/>', {
				'type' : "button",
				'class' : "close",
				'onclick' : "deleteThis(temaDiv" + id + ")",
				html : "x"
			}))));
			$newTemaRel.appendTo("#contenedorTemas");
		}
		function deleteThisLi(o) {
			var ul = $("#listAutores");
			console.log(o);
			// 			console.log();
			// 			console.log(ul.children());
			ul.children("[id='" + o + "']").remove();

			// 			ul.children();
			// 			ul.removeChild(ul.childNodes[o]);

		}
		function deleteThis(o) {
			o.remove();
		}
		function clearThis(target) {
			$("#" + target + "").val('');
		};
	</script>







</body>

</html>