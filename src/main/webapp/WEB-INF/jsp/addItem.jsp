<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/jquery-ui.min.css" />"
	rel="stylesheet">
<%-- <link href="<c:url value="/resources/css/autocomplete.css" />" --%>
<!-- 	rel="stylesheet"> -->
<script type="text/javascript" src="<c:url value="/resources/js/jquery.js" />"></script>
<script  type= "text/javascript" src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>
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
							<input type="text" class="form-control"  id="idTituloItem"></input>
						</div>
				</div>
					
					<div class="form-group">
						<label for="inputDefault" class="col-lg-2 control-label">Año</label>
						<div class="col-lg-10">
							<input type="text" class="form-control"  id="idAñoItem"></input>
						</div>
					</div>
					
					
					<div class="form-group">
						<label for="inputDefault" class="col-lg-2 control-label">Autor</label>
						<div class="col-lg-10">
							<input id="search" class="form-control">
							
						</div>

						
					</div>
					
					<div class="form-group">
						<label for="inputDefault" class="col-lg-2 control-label">Temas Relacionados</label>
						<div class="col-lg-10">
							<input id="autocompleteTema" class="form-control">
							
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
							</select> 
						</div>
					</div>
					
					<div class="form-group">
						<label for="select" class="col-lg-2 control-label">Idioma</label>
						<div class="col-lg-10">
							<select class="form-control" 
								id="selectIdioma">
								<c:forEach items="${listIdioma}" var="idioma">
									<option id="${idioma.idIdioma}">${idioma.idioma}</option>
								</c:forEach>
							</select> 
						</div>
					</div>
					<fieldset id="fs_individualAtributes">
				
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
		$.getJSON('selectedTipoItem.do', "id="
				+ myselect.options[myselect.selectedIndex].id, function(
				nombreAtributos) {
			var items = [];			
			$.each(nombreAtributos, function(key, val) {		
 				items.push("<div class='form-group'> <label class='col-lg-2 control-label' for='inputDefault'>"+ val.nombre +"</label> <div class='col-lg-10'> <input type='text' class='form-control' id="+val.idAtributoItem+"> </input> </div> </div>");			
			});
			$("<ul/>", {
				html : items.join("")
			}).appendTo("#fs_individualAtributes");
		});
	}
	
	
	
	
	
        $(function() {
                $("#search").autocomplete({   
                appentTo:"#search", 
                delay: 500,
                source : function(request, response) {
                $.ajax({
                        url : "searchAutor.do",
                        type : "GET",
                        data : {
                                term : request.term
                        },
                        dataType : "json",
                        success : function(data) {
                        	response($.map(data, function(v,i){
                        		
                                return {	
                                            label: v.nombre + " " + v.apellido,                                 
                                            value: v.nombre + " " + v.apellido
                                           };
                            }));
                 		}

                });
                
                
                }
                });
                });
        
        $(function() {
            $("#autocompleteTema").autocomplete({   
            appentTo:"#autocompleteTema", 
            delay: 500,
            source : function(request, response) {
            $.ajax({
                    url : "searchTema.do",
                    type : "GET",
                    data : {
                            term : request.term
                    },
                    dataType : "json",
                    success : function(data) {
                    	response($.map(data, function(v,i){
                    		
                            return {	
                                        label: v.tema,                                 
                                        value: v.tema
                                       };
                        }));
             		}

            });
            
            
            }
            });
            });

	
</script>



</body>
</html>