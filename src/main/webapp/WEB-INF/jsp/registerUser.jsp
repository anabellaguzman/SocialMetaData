
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Crear Cuenta | Social Metadata</title>
</head>
<body>

	<div id="removable">
		<div class="container">

			<form class="form-horizontal" method="POST" action="registerUser.do">
				<div class="well bs-component">
					<fieldset>
						<legend>Crear Cuenta </legend>
						<div class="form-group">
							<label for="nombre" class="col-lg-2 control-label">Nombre</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="nombre" name="nombre"
									placeholder="Nombre">
							</div>
						</div>
						<div class="form-group">
							<label for="inputApellido" class="col-lg-2 control-label">Apellido</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="apellido" name="apellido"
									placeholder="Apellido">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail" class="col-lg-2 control-label">Email</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="email" name="email"
									placeholder="Email">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail" class="col-lg-2 control-label">Elija
								un nombre de usuario</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="username" name="username"
									placeholder="Nombre de usuario">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-lg-2 control-label">Contraseña</label>
							<div class="col-lg-10">
								<input type="password" class="form-control" id="password" name="password"
									placeholder="Contraseña">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPasswordConfirm" class="col-lg-2 control-label">Repita
								Contraseña</label>
							<div class="col-lg-10">
								<input type="password" class="form-control" id="passwordConfirm"
									placeholder="Repita Contraseña">
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
</body>
</html>