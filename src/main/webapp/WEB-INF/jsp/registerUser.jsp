
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>

<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->



<html>
<head>
<title>Crear Cuenta | Social Metadata</title>
</head>
<style>
.divider {
	color: black;
}
</style>
<body>



	<div id="removable">
		<div class="container">
			<!-- 			<div class="row"> -->
			<h1>Regístrate</h1>

			<div class="col-lg-6">
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
									<p align="center" class="text-danger" id=checkMsg></p>
										<div class="col-lg-10 col-lg-offset-2">
											<button type="button" class="btn btn-primary"
 									onclick="controllData()">Registrarme</button>
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
	
		function controllData(){
			
				var pass1 = $("#password").val();
				var lpass1 = pass1.length;
				
// 				console.log("largo pass: "+ lpass1);
			
			
			if ($("#nombre").val()===""||$("#apellido").val()===""||$("#username").val()===""){
					
				
				checkMsg="Debe completar todos los campos";
				$( "#checkMsg").text(checkMsg);
			}
			else{if(lpass1<8||lpass1>45){
				checkMsg="La contraseña debe contener entre 8 y 45 caracteres";
				 $( "#checkMsg").text(checkMsg);
				}
				 else{if($("#password").val()!=$("#passwordConfirm").val()){
					
					checkMsg="Las contraseñas no coinciden";
					 $( "#checkMsg").text(checkMsg);
					
					}
					else{
						registerUser();
					}
				
			}
			
					
			
			}
			
			
			
			
			
		}
		function registerUser() {
			console.log("ENTRA A registerUser");
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


</body>
</html>