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

<title>Búsqueda Avanzada</title>

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

.list-group-item{

 	background: rgb(24,188,156);
 	color: rgb(255, 255, 255);
 	text-decoration: none solid rgb(255, 255, 255);
}


</style>


<body>

	<div id="removable">
		<div class="col-lg-6">
			<br>
			<div class="well bs-component">
				<form class="form-horizontal" method="POST" action="addItem">
					<fieldset id="fs_generalAtributes">
						<legend>Búsqueda Avanzada</legend>
						<div class="form-group">
							<label for="inputDefault" class="col-lg-2 control-label">Titulo</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="idTituloItem"></input>
							</div>
						</div>
						<div class="form-group">
							<label for="inputDefault" class="col-lg-2 control-label">Año</label>
							<div class="col-lg-10">
								<select onclick= "populateYear()" class="form-control" id="selectYear">
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
									onclick="advancedSearchItem()">Buscar</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<div id="subViewDiv" class="bs-component"></div>







	<script type="text/javascript">


		function advancedSearchItem() {
			
			
			

			var titulo = $("#idTituloItem").val();
			var year = $("#selectYear").val();
			console.log("VALUE OF YEAR "+$("#selectYear").val());
			var tipoItem = $("#selectOpt").val();
			//select opt es el tipo
			var idioma = $("#selectIdioma").val();
			
			console.log($("#selectOpt").val());

			
			var cTemas = document.getElementById("contenedorTemas");
			var btnsTemas = cTemas.getElementsByClassName("botonTema");
			var lbtnsTemas = btnsTemas.length;				
			var idTemas = [];
	

			for (var i = 0; i < lbtnsTemas; ++i) {		
				var idT = btnsTemas[i].id;
				idTemas.push(idT);
			}

			var cTemas = document.getElementById("contenedorTemas");
			var btnsTemas = cTemas.getElementsByClassName("botonTema");
			var lbtnsTemas = btnsTemas.length;				
			var idTemas = [];
			for (var i = 0; i < lbtnsTemas; ++i) {		
				var idT = btnsTemas[i].id;
				idTemas.push(idT);
			}
			var x = document.getElementById("listAutores");
			var y = x.getElementsByTagName("li");
			var length = y.length;
			var idAutores = [];
			for (var i = 0; i < length; ++i) {
				var idA = y[i].id;
				idAutores.push(idA);
			}
			
			
// 			var fsIndAtr = document.getElementById("fs_individualAtributes");
// 			var inputIndAtr = fsIndAtr.getElementsByTagName("input");
// 			var lIndAtr = inputIndAtr.length;

// 			console.log("inputInd");
// 			console.log(inputIndAtr);

// 			// 			console.log(lIndAtr);
// 			var idIndAtr = [];
// 			var valIndAtr = [];
// 			for (var i = 0; i < lIndAtr; ++i) {

// 				console.log("console.log(inputIndAtr[i].id);");
// 				idIndAtr.push(inputIndAtr[i].id);
// 				console.log(inputIndAtr[i].id);
// 				console.log("console.log(inputIndAtr[i].value);");
// 				console.log(inputIndAtr[i].value);
// 				valIndAtr.push(inputIndAtr[i].value);

// 				// 				console.log(inIndAtr[i]);
// 				// 				console.log(inIndAtr[i].val());
// 				// 				var idA = inIndAtr[i].id;
// 				// 				idAutores.push(idA);
// 			}
			
			
			
			$.ajax({
				url : "advancedSearch.do",
				type : "POST",
				data : {
					tituloItem : titulo,
					year : year,
					idAutores : idAutores.toString(),
					idTemas : idTemas.toString(),
					idTipoItem : tipoItem,
					idIdioma : idioma,
// 					descripcion : descripcion,
// 					idOwnAtr : idIndAtr.toString(),
// 					valOwnAtr : valIndAtr.toString(),

				},
				
				
				
				
				
				success : function(response) {
					$("#subViewDiv").html(response);

						var element = document.getElementById("removable");
						element.parentNode.removeChild(element);

				},
// 			,
// 				success : function(data, textStatus) {

// 					// data.redirect contains the string URL to redirect to
// 					// 				            window.location.href = data.redirect;
// 					console.log("data");
// 					console.log(data);
// 					location.href = document.URL.substr(0, document.URL
// 							.lastIndexOf('/'))
// 							+ "/item?idItem=" + data;

// 				}
			});

		}
		
		var alreadyClickedYear = false;

		
		function populateYear(){
			if (!alreadyClickedYear){
				alreadyClickedYear = true;
				year();
			}
			
		}

		function year() {
			var min = 1900, max = new Date().getFullYear(), select = document
					.getElementById('selectYear');
			for (var i = min; i <= max; i++) {
				var opt = document.createElement('option');
				opt.value = i;
				opt.innerHTML = i;
				select.appendChild(opt);
			}
			
			var optE = document.createElement('option');
			optE.value = 0;
			optE.innetHTML = " ";
			select.appendChild(optE);
// 			select.value = new Date().getFullYear();
		}

// 		function jsFunction() {

// 			vNombreAtributos = new Array();
// 			var myselect = document.getElementById("selectOpt");
// 			var fs_iA = document.getElementById("fs_individualAtributes");
// 			$(fs_iA).empty();

// 			$
// 					.getJSON(
// 							'selectedTipoItem.do',
// 							"id="
// 									+ myselect.options[myselect.selectedIndex].value,
// 							function(nombreAtributos) {
// 								var items = [];
// 								$
// 										.each(
// 												nombreAtributos,
// 												function(key, val) {
// 													items
// 															.push("<div class='form-group'> <label class='col-lg-2 control-label' for='inputDefault'>"
// 																	+ val.nombre
// 																	+ "</label> <div class='col-lg-10'> <input type='text' class='form-control' id="+val.idAtributoItem+"> </input> </div> </div>");
// 												});
// 								$("#fs_individualAtributes").append(items);
// 							});

// 		}

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
				'class' : "botonTema",
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