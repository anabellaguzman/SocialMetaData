<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>

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
		
	 		function loginFBUserAPI() {
			console.log('loginFBUserAPI() Welcome!  Fetching your information.... ');
			FB
					.api(
							'/me?fields=id,first_name,last_name, email',
							function(response) {
								document.getElementById('status').innerHTML = 'Thanks for logging in, '
										+ response.first_name
										+ '!'
										+ response.last_name
										+ "id: "
										+ response.id
										+ "email : "
										+ response.email;
								
								loginFBUserinApp(response.first_name,response.last_name, response.id, response.email );
							}, {
								scope : 'public_profile, email'
							});

			
	 		}		

			function loginFB() {
				FB.login(
								function(response) {
									// Logged into your app and Facebook.
									if (response.status === 'connected') {
										document.getElementById('status').innerHTML = 'We are connected';
										loginFBUserAPI();
//	 									document.getElementById('btnLoginFB').style.visibility = 'hidden';
									} 
									// The person is logged into Facebook, but not your app.
									else if (response.status === 'not_authorized') {
										document.getElementById('status').innerHTML = 'We are not logged in.';
										loginFBUserAPI();
									} else {
										// The person is not logged into Facebook, so we're not sure if
									    // they are logged into this app or not.
										document.getElementById('status').innerHTML = 'You are not logged into Facebook.';
									}
								}, {
									scope : 'public_profile, email'
								});

				
			}
	
		function loginFBUserinApp(firstName, lastName, id, email){
				$.ajax({
					url : "loginFBUser.do",
					type : "POST",
					async: false,
					data : {
						nombre : firstName,
						apellido : lastName,
						username : email,
						password : id,
					},					
					success: function (){						
						login(email, id);}		
				});	
					
		}
		
		function login(username, password){				
			$.ajax({
				url : "http://localhost:8080/SocialMetadata/j_spring_security_check?",
				type : "POST",
				data : {
					username : username,
					password : password,
				},					
					success : function(data, textStatus) {						
						location.href = document.URL.substr(0, document.URL
								.lastIndexOf('/'))
								+ "/home";
					}
			});			
		}
		
		
		</script>

<div id="removable">
	<div class="container">

			


				<h1>Iniciar Sesion</h1>
				
				
				<div class="col-lg-6">

				<div class="well bs-component">


					<div align="middle">
						<div id="status" class="hidden"></div>
							<a class="btn btn-info" onclick="loginFB()">Iniciar Sesion con Facebook</a>
	
							</div>
							</div>


			
			

				<div class="well bs-component">
					<form:form class="form-horizontal" method="post"
						action="j_spring_security_check" modelAttribute="usuario">
						<fieldset>


							<div class="form-group">
								<label for="inputEmail" class="col-lg-2 control-label">E-mail </label>
								<div class="col-lg-10">
									<form:input path="username" type="text" class="form-control"
										id="inputEmail" placeholder="E-mail" />
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