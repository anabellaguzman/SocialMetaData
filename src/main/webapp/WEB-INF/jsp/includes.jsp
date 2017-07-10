<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>


<div class="navbar navbar-default navbar-fixed-top">
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="./">Social Metadata</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<div class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input id="searchItem" type="text" class="form-control"
							placeholder="Introduzca un Titulo">
					</div>
					<button type="button" class="btn btn-default"
						onclick="doSearchItemsLike(1)">Buscar</button>
				</div>

				<ul class="nav navbar-nav navbar-right">
					<sec:authorize access="isAuthenticated()">
						<li>
							<%-- 						<sec:authentication property="principal.username --%>
							<%-- 						"/> --%>

					
								<button class="btn btn-link" onclick="goMiCuenta()">Mi Cuenta</button>
						</li>

						<li>
<!-- 						<p > -->

						
							<form action="j_spring_security_logout" method="post">
			
								<button type="submit" class="btn btn-link">Cerrar
									Sesion</button>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form>
						</li>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<li><a href="./login">Iniciar Sesion</a></li>
					</sec:authorize>

				</ul>
			</div>
		</div>
	</nav>
</div>

<br>
<br>
<div id="subViewDiv" class="bs-component"></div>


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


<script type="text/javascript">
	function doSearchItemsLike(paige) {
		
		var from =(paige-1)*20;
		var to = from+19;
		
		
		if(paige==1){
			var term = $('#searchItem').val();
		}

		
		
		console.log("from" + from);
		console.log("to: "+to);
		console.log("term: "+term);

		console.log("searchItem val: " + $('#searchItem').val());
		if ($("#removable").length) {
			var element = document.getElementById("removable");
			element.parentNode.removeChild(element);
		}

		$.ajax({
			url : "searchItem.do",
			type : "GET",
			data : {
				term : $('#searchItem').val(),
				from: from,
				to: to,
			},
			success : function(response) {
				$("#subViewDiv").html(response);
// 				from = to+1;
// 				to = to+20;
				
			
			},
			error : function(xhr, textStatus, errorThrown) {

				alert("Error: " + xhr.status + " " + xhr.statusText);
			}

		});
	}

	$("#searchItem").keypress(function(e) {

		if (e.which == 13) {
			e.preventDefault();
			doSearchItemsLike(1);
			// 		    	e.stopPropagation();
			// 		    	$("#searchItem").unbind('keypress');

		}

	});
	
	function goMiCuenta(){
		
		location.href = document.URL.substr(0, document.URL.lastIndexOf('/'))
		+ "/micuenta";
		
	}
</script>



