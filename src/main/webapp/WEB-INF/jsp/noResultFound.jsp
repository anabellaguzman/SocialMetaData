<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="<c:url value="/resources/flatly/bootstrap.css" />" media="screen">
<link rel="stylesheet"
	href="<c:url value="/resources/flatly/bootswatch.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/jquery-ui.min.css" />">
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-1.11.3.js" />"></script>

<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

<div class="container">
	<div class="well bs-component">
		<div class="jumbotron">

			<div class="page-header">
				<h1 id="tables">Resultado de la búsqueda</h1>
			</div>
			<div class="row">
				<div class="col-lg-4">
					<a href="./advancedSearch" class="btn btn-primary">Busqueda
						Avanzada</a>
					<sec:authorize access="isAuthenticated()">
						<a href="./addItem" class="btn btn-success">Agregar</a>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<button type="button" id="msg" onclick="showMsg()"
							class="btn btn-success">Agregar</button>
						<div id="loginMsg" class="alert alert-dismissible alert-danger"
							style="display:none">							
								<div class="bs-component">
									<strong>Oh! Necesitas</strong> <a href="./login"
										class="alert-link">Iniciar Sesion</a> para hacer eso.
								</div>
						</div>
					</sec:authorize>
				</div>
			</div>
			<div class="bs-component">
			</br>
			<p class="lead">No se ha encontrado ningún ejemplar que se corresponda con la búsqueda</p>

			</div>
			<!-- /example -->
		</div>
	</div>
</div>



<script type="text/javascript">
	function doSearchItem(id) {

		location.href = document.URL.substr(0, document.URL.lastIndexOf('/'))
				+ "/item?idItem=" + id;
	}

	function showMsg() {

		$("#loginMsg").show();

	}
	
	function hideLoginMsh(){
		$("#loginMsg").hide();
	}
	
// 	$('#loginMsg').on('closed.bs.alert', function () {
// 		$('#loginMsg').hide();
// 	      return false;
// 		});
	

</script>