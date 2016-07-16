<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>

<%-- <%@page import="java.net.URLEncoder"%> --%>
<%-- <% --%
// 	String fbURL = "http://www.facebook.com/dialog/oauth?client_id=1052217758124008&redirect_uri="
// 			+ URLEncoder
// 					.encode("http://localhost:8080/SocialMetadata/loginFacebook.do")
// 			+ "&scope=email";
<%-- %> --%>




<html>
<head>
<title>Iniciar Sesion | Social Metadata</title>
</head>
<style>
.divider {
	color: black;
}
</style>
<body>
	<script>
		window.fbAsyncInit = function() {
			FB.init({
				appId : '1177390648949659',
				xfbml : true,
				version : 'v2.7'
			});
			
			FB.getLoginStatus(function(response) {
		    	if (response.status === 'connected') {
		    		document.getElementById('status').innerHTML = 'We are connected.';
		    		document.getElementById('btnLoginFB').style.visibility = 'hidden';
		    	} else if (response.status === 'not_authorized') {
		    		document.getElementById('status').innerHTML = 'We are not logged in.'
		    	} else {
		    		document.getElementById('status').innerHTML = 'You are not logged into Facebook.';
		    	}
		    });
			
			
			
		};
		

	

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		
		function loginFB() {
			FB.login(function(response) {
				if (response.status === 'connected') {
		    		document.getElementById('status').innerHTML = 'We are connected.';
		    		document.getElementById('btnLoginFB').style.visibility = 'hidden';
		    	} else if (response.status === 'not_authorized') {
		    		document.getElementById('status').innerHTML = 'We are not logged in.'
		    	} else {
		    		document.getElementById('status').innerHTML = 'You are not logged into Facebook.';
		    	}
			}, {scope: 'email'});
		}
		
		// getting basic user info
		function getInfoFB() {
			FB.api('/me', 'GET', {fields: 'last_name'}, function(response) {
				document.getElementById('status').innerHTML = response.id;
			});
		}
		
		
		
		
	</script>
	<br />
	<br />
	<br />

	<div align="center" class="container">
		<div class="row">

			<div class="col-lg-6" align="center">


				<h1>Iniciar Sesion</h1>
				<div class="progress">
					<div class="progress-bar" style="width: 100%;"></div>
				</div>

				<div class="well bs-component">

					<div align="center">
					<div id="status"></div>
					<button id="btnLoginFB" type="button" class="btn btn-default" onclick="loginFB()">Facebook Login</button>
					<button onclick="getInfoFB()">Get Info</button>
<%-- 						<a href="<%=fbURL%>" class="btn btn-info">Iniciar con --%>
<!-- 							Facebook</a> <br> <br> <a href="#" class="btn btn-danger">Iniciar -->
<!-- 							con Gmail</a> -->
					</div>

				</div>

				<div class="progress">
					<div class="progress-bar" style="width: 100%;"></div>
				</div>

				<div class="divider"></div>

				<div class="well bs-component">
					<form:form class="form-horizontal" method="post"
						action="j_spring_security_check" modelAttribute="usuario">
						<fieldset>

							<legend>Iniciar con SocialMetada</legend>

							<div class="form-group">
								<label for="inputEmail" class="col-lg-2 control-label">Usuario
									o e-mail </label>
								<div class="col-lg-10">
									<form:input path="username" type="text" class="form-control"
										id="inputEmail" placeholder="Usuario o e-mail" />
								</div>
							</div>


							<div class="form-group">
								<label for="inputPassword" class="col-lg-2 control-label">Password</label>

								<div class="col-lg-10">
									<form:input path="password" type="password"
										class="form-control" id="inputPassword" placeholder="Password" />

								</div>




							</div>


							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2" align="right">
									<button type="submit" class="btn btn-primary">Iniciar
										Sesion</button>
								</div>
							</div>
						</fieldset>
					</form:form>
					<div align="center">
						<a href="#">Olvidaste tu usuario o contraseña?</a> <br> <a
							href="./registerUser">No tienes una cuenta? Registrate</a>
					</div>


				</div>
			</div>
		</div>
	</div>
</body>
</html>