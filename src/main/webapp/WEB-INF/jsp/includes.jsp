<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>




<div class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand">SocialMetadata</a>

		</div>
		<div class="navbar-collapse collapse" id="navbar-main">
			<ul class="nav navbar-nav">
				<li><a href="../GI/">Grupo de Investigacion</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<sec:authorize access="isAuthenticated()">
					<li><a href="#" class="btn btn-default">Mi Cuenta</a></li>

					<li><a
						href="<c:url var="logoutUrl" value="j_spring_security_logout" />">

							<form action="${logoutUrl}" method="post">
								<button type="submit" class="btn btn-default">Logout</button>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form>
					</a></li>
				</sec:authorize>

				<sec:authorize access="isAnonymous()">
					<li><a href="./login" class="btn btn-default" target="_blank">Login</a></li>
				</sec:authorize>


				<%-- 				<sec:authorize access="isAuthenticated()"> --%>
				<!-- 					<li><a href="#" class="btn btn-default">Mi Cuenta</a> -->
				<%-- 					<li><c:url var="logoutUrl" value="j_spring_security_logout" /> --%>
				<%-- 						<form action="${logoutUrl}" method="post"> --%>
				<!-- 							<button type="submit" class="btn btn-default">Logout</button> -->
				<%-- 							<input type="hidden" name="${_csrf.parameterName}" --%>
				<%-- 								value="${_csrf.token}" /> --%>
				<%-- 						</form></li> --%>
				<%-- 				</sec:authorize> --%>




			</ul>

		</div>
	</div>
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


<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> -->


<!-- This contains the most used tag libraries, -->