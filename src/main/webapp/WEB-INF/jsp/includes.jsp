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
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
		
				<ul class="nav navbar-nav navbar-right">
			<li class="navbar-form navbar-left">
<%-- 							<form class="navbar-form navbar-left"> --%>

					<button type="submit" class="btn btn-default">Mi Cuenta</button>
<%-- 				</form> --%>
				
				</li>
			
	
<%-- 					<sec:authorize access="isAuthenticated()"> --%>
<!-- 						<li><button type="submit" class="btn btn-default">Mi Cuenta</button></li> -->
<!-- 						<li><a -->
<%-- 							href="<c:url var="logoutUrl" value="j_spring_security_logout" />"></a> --%>
<%-- 								<form action="${logoutUrl}" method="post"> --%>
<!-- 									<button type="submit" class="btn btn-default">Logout</button> -->
<%-- 									<input type="hidden" name="${_csrf.parameterName}" --%>
<%-- 										value="${_csrf.token}" /> --%>
<%-- 								</form> --%>
<!-- 						</li> -->
<%-- 					</sec:authorize> --%>
<%-- 					<sec:authorize access="isAnonymous()"> --%>
<%-- 						<li><a href="<c:url var="loginUrl" value="./login" />"></a> --%>
<%-- 								<form action="${loginUrl}" method="get"> --%>
<!-- 									<button type="submit" class="btn btn-default">Login</button> -->
<%-- 								</form> --%>
<!-- 						</li> -->

<%-- 					</sec:authorize> --%>
				</ul>
			</div>
		
	</nav>
</div>





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
<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap.min.js" />"></script>


<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> -->


<!-- This contains the most used tag libraries, -->