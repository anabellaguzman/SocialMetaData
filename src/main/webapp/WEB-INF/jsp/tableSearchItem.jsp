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
				<table class="table table-striped table-hover ">
					<thead>
						<tr>
							<!-- 							<th style="display:none;">id</th> -->
							<th>Titulo</th>
							<th>Formato</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${items}" var="item">
							<tr onclick="doSearchItem('${item.idItem}')">
								<%-- 							<td id="td${item.idItem}" style="display:none;">${item.idItem}</td> --%>
								<td>${item.titulo}</td>
								<td>${item.tipo.descripcion}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<br/>  
<ul class="pagination">
  <li class="disabled"><a href="#">«</a></li>
  <li class="active" onclick="doSearchItemsLike(1)"><a href="#">1</a></li>
  <li><a onclick="doSearchItemsLike(2)">2</a></li>
  <li><a onclick="doSearchItemsLike(3)">3</a></li>
  <li><a onclick="doSearchItemsLike(4)">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#">»</a></li>
</ul>
			</div>
			
			
			
<!-- 			<h1>Employees List</h1>   -->
<!-- <table border="2" width="70%" cellpadding="2">   -->
<!-- <tr><th>Id</th><th>Name</th><th>Salary</th></tr>   -->
<%--    <c:forEach var="emp" items="${list}">    --%>
<!--    <tr>   -->
<%--    <td>${emp.id}</td>   --%>
<%--    <td>${emp.name}</td>   --%>
<%--    <td>${emp.salary}</td>   --%>
<!--    </tr>   -->
<%--    </c:forEach>   --%>
<!--    </table>   -->
<!--    <br/>   -->
<!--    <a href="/SpringMVC/viewemp/1">1</a>    -->
<!--    <a href="/SpringMVC/viewemp/2">2</a>    -->
<!--    <a href="/SpringMVC/viewemp/3">3</a>   -->
			
			
<!-- 			<!-- /example --> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->



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