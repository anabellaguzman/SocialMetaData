<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<html>
<head>
<title>Login | Social Metadata</title>
</head>
<body>
	<br />
	<br />
	<br />



	<div class="container">
		<div class="row">

			<div class="col-lg-6">
				<div class="well bs-component">

					<form:form class="form-horizontal" method="post"
						action="j_spring_security_check" modelAttribute="usuario">
						<fieldset>


							<legend>Login</legend>
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
								<div class="col-lg-10 col-lg-offset-2">
									<button type="reset" class="btn btn-default">Cancel</button>
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</div>
						</fieldset>
					</form:form>


				</div>
			</div>
		</div>
	</div>

</body>
</html>