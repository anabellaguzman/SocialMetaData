
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>

<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->



<html>
<head>
<title>Crear Cuenta | Social Metadata</title>
<meta name="google-signin-client_id"
	content="413624237768-cvofq4hn3p92et55ehdg9jm7rf4hvjad.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
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

			FB
					.getLoginStatus(function(response) {
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
			FB
					.login(
							function(response) {
								if (response.status === 'connected') {
									document.getElementById('status').innerHTML = 'We are connected.';
									document.getElementById('btnLoginFB').style.visibility = 'hidden';
								} else if (response.status === 'not_authorized') {
									document.getElementById('status').innerHTML = 'We are not logged in.'
								} else {
									document.getElementById('status').innerHTML = 'You are not logged into Facebook.';
								}
							}, {
								scope : 'public_profile, email'
							});
		}

		// getting basic user info
		function getInfoFB() {
			FB.api('/me', 'GET', {
				fields : 'last_name'
			}, function(response) {
				document.getElementById('status').innerHTML = response.name;
			});
		}

		function testAPI() {
			console.log('Welcome!  Fetching your information.... ');
			FB
					.api(
							'/me?fields=id,first_name,last_name, email',
							function(response) {
								console.log('Successful login for: '
										+ response.name);
								document.getElementById('status').innerHTML = 'Thanks for logging in, '
										+ response.first_name
										+ '!'
										+ response.last_name
										+ "id: "
										+ response.id
										+ "email : "
										+ response.email;
							}, {
								scope : 'public_profile, email'
							});
		}

		function onSignIn(googleUser) {
			var profile = googleUser.getBasicProfile();
			console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			console.log('Name: ' + profile.getName());
			console.log('Image URL: ' + profile.getImageUrl());
			console.log('Email: ' + profile.getEmail());

			var id_token = googleUser.getAuthResponse().id_token;
			console.log("ID Token: " + id_token);

		}
	</script>


	<div id="removable">
		<div class="container">
<!-- 			<div class="row"> -->
<h1>Elije como Registrate</h1>
				<div class="col-lg-6">

					<div class="well bs-component">
					
					<legend>Red Social </legend>

						<div align="left">
							<div id="status"></div>
							
<div class="fb-login-button" data-max-rows="1" data-size="xlarge" data-show-faces="false" data-auto-logout-link="true"></div>							
<!-- 							<button id="btnLoginFB" type="button" class="btn btn-default" -->
<!-- 								onclick="loginFB()">Facebook Login</button> -->
							<button type="button" class="btn btn-default" onclick="testAPI()">Get
								Info FB</button>
							<%-- 						<a href="<%=fbURL%>" class="btn btn-info">Iniciar con --%>
							<!-- 							Facebook</a> <br> <br> <a href="#" class="btn btn-danger">Iniciar -->
							<!-- 							con Gmail</a> -->
							<div class="g-signin2" data-onsuccess="onSignIn"></div>
							<button type="button" class="btn btn-default"
								onclick="onSignIn()">Get Info Gmail</button>
						</div>

</div>
</div>

<div class="col-lg-offset-6">
<div class="well bs-component">

						<form class="form-horizontal" method="POST"
							action="registerUser.do">
							<div class="well bs-component">
								<fieldset>
									<legend>SocialMetadata</legend>
									<div class="form-group">
										<label for="nombre" class="col-lg-2 control-label">Nombre</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="nombre"
												name="nombre" placeholder="Nombre">
										</div>
									</div>
									<div class="form-group">
										<label for="inputApellido" class="col-lg-2 control-label">Apellido</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="apellido"
												name="apellido" placeholder="Apellido">
										</div>
									</div>

									<div class="form-group">
										<label for="inputEmail" class="col-lg-2 control-label">E-mail</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="username"
												name="username" placeholder="E-mail">
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="col-lg-2 control-label">Contraseña</label>
										<div class="col-lg-10">
											<input type="password" class="form-control" id="password"
												name="password" placeholder="Contraseña">
										</div>
									</div>
									<div class="form-group">
										<label for="inputPasswordConfirm"
											class="col-lg-2 control-label">Repita Contraseña</label>
										<div class="col-lg-10">
											<input type="password" class="form-control"
												id="passwordConfirm" placeholder="Repita Contraseña">
										</div>
									</div>
									<div class="form-group">
										<div class="col-lg-10 col-lg-offset-2">
											<button type="submit" class="btn btn-primary">Crear</button>
										</div>
									</div>
								</fieldset>
							</div>
						</form>
						
					</div>
					</div>

				</div>
			</div>
		
</body>
</html>