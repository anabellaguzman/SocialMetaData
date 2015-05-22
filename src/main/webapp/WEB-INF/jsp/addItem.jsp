<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-1.11.2.js" />"></script>
<script src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>

<title>Agregar Nuevo Item</title>


<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-1.11.2.js" />"></script>

<!-- <script type="text/javascript" -->
<!--     src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->

<script type="text/javascript">
	function jsFunction() {
		vNombreAtributos = new Array();

		var myselect = document.getElementById("selectOpt");
		$.getJSON('selectedTipoItem.do', "id="
				+ myselect.options[myselect.selectedIndex].id, function(
				nombreAtributos) {
			var items = [];
			$.each(nombreAtributos, function(key, val) {
// 				items.push("<li id='" + val.idAtributoItem + "'>" + val.nombre + "</li>");
				
//  				items.push("<label class='control-label' for='inputDefault'>"+ val.nombre +"</label>");
				
 				
 				items.push("<div class='form-group'> <label class='control-label' for='inputDefault'>"+ val.nombre +"</label> <div class='col-lg-10'> <input type='text' class='form-control' id="+val.idAtributoItem+"> </div> </div>");
 				
// 				<div class="form-group">
// 				<label for="inputEmail" class="col-lg-2 control-label">Email</label>
// 				<div class="col-lg-10">
// 					<input type="text" class="form-control" id="inputEmail"
// 						placeholder="Email">
// 				</div>
// 			</div>
 				
 				
 				
			});
			$("<ul/>", {
				html : items.join("")
			}).appendTo("Legend");

		});



	}
</script>
</head>




<body>




	<div class="col-lg-6">
		<div class="well bs-component">
			<form class="form-horizontal">
				<fieldset>
					<legend>Legend</legend>
					<div class="form-group">
						<label for="inputEmail" class="col-lg-2 control-label">Email</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="inputEmail"
								placeholder="Email">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-lg-2 control-label">Password</label>
						<div class="col-lg-10">
							<input type="password" class="form-control" id="inputPassword"
								placeholder="Password">
							<div class="checkbox">
								<label> <input type="checkbox"> Checkbox
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="textArea" class="col-lg-2 control-label">Textarea</label>
						<div class="col-lg-10">
							<textarea class="form-control" rows="3" id="textArea"></textarea>
							<span class="help-block">A longer block of help text that
								breaks onto a new line and may extend beyond one line.</span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label">Radios</label>
						<div class="col-lg-10">
							<div class="radio">
								<label> <input type="radio" name="optionsRadios"
									id="optionsRadios1" value="option1" checked=""> Option
									one is this
								</label>
							</div>
							<div class="radio">
								<label> <input type="radio" name="optionsRadios"
									id="optionsRadios2" value="option2"> Option two can be
									something else
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="select" class="col-lg-2 control-label">Tipo Item</label>
						<div class="col-lg-10">
							<select class="form-control" onchange="jsFunction()"
								id="selectOpt">
								<c:forEach items="${listTipoItem}" var="tipoItem">
									<option id="${tipoItem.idTipoItem}">${tipoItem.descripcion}</option>
								</c:forEach>
							</select> <br> <select multiple="" class="form-control">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</div>
					</div>
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




</body>
</html>