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
<!-- <script type="text/javascript" -->
<%-- 	src="<c:url value="/resources/js/jquery-ui.min.js" />"></script> --%>

<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<!-- <script type="text/javascript" -->
<%-- 	src="<c:url value="/resources/flatly/bootswatch.js" />"></script> --%>


<div class="container">
	<div class="well bs-component">
		<div class="jumbotron">

			<div class="row">
				<div>
					<div class="page-header">
						<h1 id="tables">Resultado de la búsqueda</h1>
					</div>

					<div class="bs-component">
						<table class="table table-striped table-hover ">
							<thead>
								<tr>
									<!-- 							<th style="display:none;">id</th> -->
									<th>Titulo</th>
									<th>Tipo Item</th>

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
					</div>
					<!-- /example -->
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	function doSearchItem(id) {

		location.href = document.URL.substr(0, document.URL.lastIndexOf('/'))
				+ "/item?idItem=" + id;
	}
</script>