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
<script src="<c:url value="/resources/js/jquery.form.js" />"></script>

<title>Agregar Nuevo Ejemplar</title>
</head>
<style>


  .botonTema {
    box-sizing: border-box;
    color: rgb(255, 255, 255);
    cursor: pointer;
    display: inline-block;
    height: 45px;
    text-align: center;
    text-decoration: none solid rgb(255, 255, 255);
    text-size-adjust: 100%;
    touch-action: manipulation;
    vertical-align: middle;
    white-space: nowrap;
    width: auto;
    column-rule-color: rgb(255, 255, 255);
    perspective-origin: 42.5938px 22.5px;
    transform-origin: 42.5938px 22.5px;
    user-select: none;
    caret-color: rgb(255, 255, 255);
    background: rgb(24, 188, 156) none repeat scroll 0% 0% / auto padding-box border-box;
    border: 2px solid rgb(24, 188, 156);
    border-radius: 4px 4px 4px 4px;
    font: normal normal normal normal 15px / 21.4286px Lato, "Helvetica Neue", Helvetica, Arial, sans-serif;
    outline: rgb(255, 255, 255) none 0px;
    padding: 10px 15px;
}



</style>
<body>
	<div id="removable">
		<div class="container">
			<form class="form-horizontal" method="POST" action="addItem">
				<div class="well bs-component">
					<h1>Nuevo Ejemplar</h1>


					<div class="row">
						<div class="col-lg-6">
							<br>

							<fieldset id="fs_generalAtributes">
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
									<div class="col-lg-9">
										<input id="search" class="form-control"> <input
											type="hidden" class="form-control" id="idAutor"></input>
										<ul class="list-group" id="listAutores">
										</ul>
									</div>
									<a class="btn btn-primary" data-toggle="modal"
										data-target="#modalAddAutor">+</a>
								</div>
								<div class="form-group">
									<label for="inputDefault" class="col-lg-2 control-label">Temas
										Relacionados</label>
									<div class="col-lg-9" id="temasRelacionados">
										<input id="autocompleteTema" class="form-control"> <input
											type="hidden" class="form-control" id="idTema"></input>
										<div class="bs-component" id="contenedorTemas">
											<p>
										</div>
									</div>
									<a class="btn btn-primary" data-toggle="modal"
										data-target="#modalAddTema">+</a>
								</div>
								<div class="form-group">
									<label for="select" class="col-lg-2 control-label">Formato</label>
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
							</fieldset>

						</div>

						<div class="col-lg-6">
							<br>


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
							<p align="center" class="text-danger" id=checkMsg></p>
								<div class="col-lg-10 col-lg-offset-2">
									<button class="btn btn-default">Cancelar</button>
									<button type="button" class="btn btn-primary"
										onclick="checkData()">Agregar</button>
								</div>
							</div>


						</div>

					</div>
				</div>
			</form>
		</div>


		<!-- Modal Add Autor -->
		<div class="modal fade" id="modalAddAutor" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close" id="btnCloseModal">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Nuevo Autor</h4>
					</div>
					<div class="modal-body">
						<form id=formAutor class="form-horizontal" method="POST"
							action="addAutor">
							<fieldset>
								<div class="form-group">
									<label for="inNewAutorNombre" class="col-lg-2 control-label">Nombre</label>
									<div class="col-lg-10">
										<input type="text" class="form-control" id="newAutorNombre"
											name="newAutorNombre" placeholder="Nombre">
									</div>
								</div>
								<div class="form-group">
									<label for="inNewAutorApellido" class="col-lg-2 control-label">Apellido</label>
									<div class="col-lg-10">
										<input type="text" class="form-control" id="newAutorApellido"
											name="newAutorApellido" placeholder="Apellido">
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-2">
										<button id="btnResetAutor" type="reset"
											class="btn btn-default" style="display: none">Limpiar
											campos</button>
										<button type="submit" class="btn btn-primary">Guardar</button>
									</div>
								</div>
								<div id=serverMsg></div>
							</fieldset>
						</form>
					</div>

				</div>
			</div>
		</div>

		<!-- Modal Add Tema -->
		<div class="modal fade" id="modalAddTema" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close" id="btnCloseModal">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Nuevo Tema</h4>
					</div>
					<div class="modal-body">



						<form id=formTema class="form-horizontal" method="POST"
							action="addTema">
							<fieldset>

								<div class="form-group">
									<label for="inNewTema" class="col-lg-2 control-label">Tema</label>
									<div class="col-lg-10">
										<input type="text" class="form-control" id="newTema"
											name="newTema" placeholder="Tema">
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-2">
										<button id="btnResetTema" type="reset" class="btn btn-default"
											style="display: none">Limpiar campos</button>
										<button type="submit" class="btn btn-primary">Guardar</button>
									</div>
								</div>
								<div id=serverMsgT></div>
							</fieldset>
						</form>
					</div>

				</div>
			</div>
		</div>
		
										<!-- Modal Actualizar Portada -->
		<div class="modal fade" id="modalPortada" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close" id="btnCloseModal">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Actualizar Portada</h4>
					</div>
					<div class="modal-body">

					<form id=formFilePortada class="form-horizontal" method="post"
						action="addPortrait" enctype="multipart/form-data">

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
									type="file" multiple id=portrait name="portrait">
							</span>
							</span> <input id="PortraitInput" type="text" class="form-control">
						</div>
						<br>
						<button class="btn btn-default">Cancel</button>
						<!-- 										<button type="Submit" class="btn btn-primary">Subir</button> -->


						<sec:authorize access="isAuthenticated()">
							<button type="Submit" class="btn btn-primary">Subir</button>
							<p>
							<div id=portraitUploadSuccess
								class="alert alert-dismissible alert-success"
								style="display: none">

								<button type="button" class="close" data-dismiss="alert">×</button>
								La portada ha sido actualizada exitosamente.

							</div>

						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<button type="button" class="btn btn-primary" id="msg"
								onclick="showMsg()">Actualizar</button>
							<p>
							<div id="loginMsg" class="alert alert-dismissible alert-danger"
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
	<div id="subViewDiv" class="bs-component"></div>


	<script type="text/javascript">
		function checkData() {
			if ($("#idTituloItem").val() === "") {

				checkMsg = "Debe ingresar el titulo";
				$("#checkMsg").text(checkMsg);
			} else {
				
				
				
				
				var x = document.getElementById("listAutores");
				var y = x.getElementsByTagName("li");
				var cTemas = document.getElementById("contenedorTemas");
				var btnsTemas = cTemas.getElementsByClassName("botonTema");
				if ( y.length < 1 || btnsTemas.length < 1 ){
					
					checkMsg = "Debe completar un autor y relacionar tema";
					$("#checkMsg").text(checkMsg);
					
				}else{
					if($("#textArea").val().length >501){
						checkMsg = "La descripción no debe superar los 500 caracteres";
						$("#checkMsg").text(checkMsg);
						
					}else{
						addNewItem();
// console.log(checkMsg = $("#textArea").val().length);
// 						checkMsg = "todo ok";
// 						$("#checkMsg").text(checkMsg);
					}
 				
				}
					
				}

			}

		
		$(function loadFileUploadView() {

		});

		$('div.myClass')
		
		function addNewItem() {

			var titulo = $("#idTituloItem").val();
			var year = $("#selectYear").val();
			var tipoItem = $("#selectOpt").val();
			var idioma = $("#selectIdioma").val();
			var descripcion = $("#textArea").val();

			var cTemas = document.getElementById("contenedorTemas");
			var btnsTemas = cTemas.getElementsByClassName("botonTema");
			var lbtnsTemas = btnsTemas.length;				
			var idTemas = [];
	

			for (var i = 0; i < lbtnsTemas; ++i) {		
				var idT = btnsTemas[i].id;
				idTemas.push(idT);
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
			var min = 1900, max = new Date().getFullYear(), select = document
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
				'class' : "col-lg-5",
				'id' : "temaDiv" + id,
			}).append($('<div/>', {
				'class' : "bs-component",
			}).append($('<div/>', {
				'class' : "botonTema",
				'id' : id,
			})			.append($('<button/>', {
				'type' : "button",
				'class' : "close",
				'onclick' : "deleteThis(temaDiv" + id + ")",
				html : "x"

			})).append(value)));
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

		// 		Funciones para modals

		$('#formAutor').ajaxForm({
			success : function(data) {
				createAlertSuccess(data, "autorSuccess", "#serverMsg");
				$('#btnResetAutor').trigger('click');
				$("#autorSuccess").fadeOut(4000, function() {
					$(this).remove();
				});
			}

		});

		$('#formTema').ajaxForm({
			success : function(data) {
				console.log(data);
				createAlertSuccess(data, "temaSuccess", "#serverMsgT");
				$('#btnResetTema').trigger('click');
				$("#temaSuccess").fadeOut(4000, function() {
					$(this).remove();
				});
			}

		});

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
	</script>

</body>

</html>