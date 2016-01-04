

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>



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
				<a class="navbar-brand" href="#">Social Metadata</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<div class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input id="searchItem" type="text" class="form-control"
							placeholder="Buscar Item">
					</div>
					<button type="button" class="btn btn-default"
						onclick="doSearchItemsLike()">Buscar</button>
				</div>

				<ul class="nav navbar-nav navbar-right">
					<sec:authorize access="isAuthenticated()">
						<li><a href="./micuenta">Mi Cuenta</a></li>

						<li><form action="j_spring_security_logout" method="post">
								<a
									href="<c:url var="logoutUrl" value="j_spring_security_logout" />">

									<button type="submit" class="btn btn-default">Logout</button> <input
									type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								</a>
							</form></li>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<li><a href="./login">Login</a></li>
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
<!-- <script type="text/javascript" -->
<%-- 	src="<c:url value="/resources/js/jquery-ui.min.js" />"></script> --%>


<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<!-- <script type="text/javascript" -->
<%-- 	src="<c:url value="/resources/flatly/bootswatch.js" />"></script> --%>


<script type="text/javascript">
	function doSearchItemsLike() {

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
			},
			success : function(response) {
				$("#subViewDiv").html(response);
			},
			error : function(xhr, textStatus, errorThrown) {

				alert("Error: " + xhr.status + " " + xhr.statusText);
			}

		});
	}
	
	$("#searchItem").keypress(function (e) {

				    if (e.which == 13) {
				    	e.preventDefault();
				    	doSearchItemsLike();
		// 		    	e.stopPropagation();
		// 		    	$("#searchItem").unbind('keypress');

				    }

				 });

</script>



