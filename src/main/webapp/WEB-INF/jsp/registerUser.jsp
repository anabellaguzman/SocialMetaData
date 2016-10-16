
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
	
	
	// Load the SDK asynchronously
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

	
	  // This is called with the results from from FB.getLoginStatus().
	  function statusChangeCallback(response) {
	    console.log('statusChangeCallback');
	    console.log(response);
	    // The response object is returned with a status field that lets the
	    // app know the current login status of the person.
	    // Full docs on the response object can be found in the documentation
	    // for FB.getLoginStatus().
	    if (response.status === 'connected') {
	      // Logged into your app and Facebook.
	      testAPI();
	    } else if (response.status === 'not_authorized') {
	      // The person is logged into Facebook, but not your app.
	      document.getElementById('status').innerHTML = 'Please log ' +
	        'into this app.';
	    } else {
	      // The person is not logged into Facebook, so we're not sure if
	      // they are logged into this app or not.
	      document.getElementById('status').innerHTML = 'Please log ' +
	        'into Facebook.';
	    }
	  }
	  
	  // This function is called when someone finishes with the Login
	  // Button.  See the onlogin handler attached to it in the sample
	  // code below.
	  function checkLoginState() {
	    FB.getLoginStatus(function(response) {
	      statusChangeCallback(response);
	    });
	  }
	
	
	
		window.fbAsyncInit = function() {
			FB.init({
				appId : '1177390648949659',
				xfbml : true,
				version : 'v2.7'
			});

		};
		
		
		// Now that we've initialized the JavaScript SDK, we call 
		  // FB.getLoginStatus().  This function gets the state of the
		  // person visiting this page and can return one of three states to
		  // the callback you provide.  They can be:
		  //
		  // 1. Logged into your app ('connected')
		  // 2. Logged into Facebook, but not your app ('not_authorized')
		  // 3. Not logged into Facebook and can't tell if they are logged into
		  //    your app or not.
		  //
		  // These three cases are handled in the callback function.

		  FB.getLoginStatus(function(response) {
		    statusChangeCallback(response);
		  });

		
		// Here we run a very simple test of the Graph API after login is
		  // successful.  See statusChangeCallback() for when this call is made.

		
	 		function testAPI() {
			console.log('test API Welcome!  Fetching your information.... ');
			FB
					.api(
							'/me?fields=id,first_name,last_name, email',
							function(response) {
// 								console.log('Successful login for: '
// 										+ response.name);
								document.getElementById('status').innerHTML = 'Thanks for logging in, '
										+ response.first_name
										+ '!'
										+ response.last_name
										+ "id: "
										+ response.id
										+ "email : "
										+ response.email;
								
								createUser(response.first_name,response.last_name, response.id, response.email );
							}, {
								scope : 'public_profile, email'
							});
			
			
// 			console.log("TEST API" +response.first_name);
// 			createUser();
			
	 		}		

			function loginFB() {
				FB.login(
								function(response) {
									// Logged into your app and Facebook.
									if (response.status === 'connected') {
										document.getElementById('status').innerHTML = 'We are connected';
										testAPI();
//	 									document.getElementById('btnLoginFB').style.visibility = 'hidden';
									} 
									// The person is logged into Facebook, but not your app.
									else if (response.status === 'not_authorized') {
										document.getElementById('status').innerHTML = 'We are not logged in.';
										testAPI();
									} else {
										// The person is not logged into Facebook, so we're not sure if
									    // they are logged into this app or not.
										document.getElementById('status').innerHTML = 'You are not logged into Facebook.';
									}
								}, {
									scope : 'public_profile, email'
								});
				
// 				createUser();
				
			}
		
		function createFBUser(firstName, lastName, id, email){
			console.log("createFBUser"+email);
	

			

				$.ajax({
					url : "registerFBUser",
					type : "POST",
					async: false,
					data : {
						nombre : firstName,
						apellido : lastName,
						username : email,
						password : id,

					},
					
					success: function (){
						
						console.log("ajax registerFBUser sucess");
						
					}
						
								
						
				});
				
			
				login(username, password);
			
			
		}

		// getting basic user info
		function getInfoFB() {
			FB.api('/me', 'GET', {
				fields : 'first_name, last_name, last_name, email'
			}, function(response) {
				document.getElementById('status').innerHTML = response.name;
				console.log("getInfoFB()" +response.email);
			});
		}


// 		}

// 		function onSignIn(googleUser) {
// 			var profile = googleUser.getBasicProfile();
// 			console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
// 			console.log('Name: ' + profile.getName());
// 			console.log('Image URL: ' + profile.getImageUrl());
// 			console.log('Email: ' + profile.getEmail());

// 			var id_token = googleUser.getAuthResponse().id_token;
// 			console.log("ID Token: " + id_token);

// 		}
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
						
<!-- 						<fb:login-button scope="public_profile,email" onlogin="checkLoginState();"> -->
<!-- </fb:login-button> -->



<!-- 						<div class="fb-login-button" data-max-rows="1" data-size="xlarge" -->
<!-- 							data-show-faces="false" data-auto-logout-link="true"></div> -->
							<a class="btn btn-info" onclick="loginFB()">Login Facebook</a>
						<!-- 							<button id="btnLoginFB" type="button" class="btn btn-default" -->
						<!-- 								onclick="loginFB()">Facebook Login</button> -->
<!-- 						<button type="button" class="btn btn-default" onclick="testAPI()">Get -->
<!-- 							Info FB</button> -->
						<%-- 						<a href="<%=fbURL%>" class="btn btn-info">Iniciar con --%>
						<!-- 							Facebook</a> <br> <br> <a href="#" class="btn btn-danger">Iniciar -->
						<!-- 							con Gmail</a> -->
						<div class="g-signin2" data-onsuccess="onSignIn"></div>
						<button type="button" class="btn btn-default" onclick="onSignIn()">Get
							Info Gmail</button>
					</div>

				</div>
			</div>

			<div class="col-lg-offset-6">
				<div class="well bs-component">

					<form class="form-horizontal" method="POST">
						<!-- 							action="registerUser.do"> -->
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
											<button type="button" class="btn btn-primary"
 									onclick="registerUser()">Crear</button>
										</div>
									</div>
							</fieldset>
						</div>
					</form>

				</div>
			</div>

		</div>
	</div>

	<script type="text/javascript">
		function registerUser() {

			console.log("ENTRO");

			var nombre = $("#nombre").val();
			var apellido = $("#apellido").val();
			var username = $("#username").val();
			var password = $("#password").val();

		

			$.ajax({
				url : "registerUser.do",
				type : "POST",
				async: false,
				data : {
					nombre : nombre,
					apellido : apellido,
					username : username,
					password : password,

				},
				
				success: function (){
					
					console.log("ajax registerUser sucess");
					
				}
					
							
					
			});
			
		
			login(username, password);
		}
		
		function login(username, password){
			
			console.log("login()"+username+password);
			
			$.ajax({
				url : "http://localhost:8080/SocialMetadata/j_spring_security_check?",
				type : "POST",
				data : {

					username : username,
					password : password,

				},
					
					success : function(data, textStatus) {

						
						console.log("user is logged in");
	
						location.href = document.URL.substr(0, document.URL
								.lastIndexOf('/'))
								+ "/home";

					}
			});
			
		}
		
		
	</script>


</body>
</html>