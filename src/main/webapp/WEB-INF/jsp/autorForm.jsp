<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>
<script src="<c:url value="/resources/flatly/bootstrap.min.js" />"></script>
<script src="../resources/flatly/bootswatch.js"></script>
<script src="<c:url value="/resources/flatly/bootswatch.js" />"></script>
</head>

<body>
	<a class="btn btn-primary" data-toggle="modal"
		data-target="#modalAddTema">+</a>
	<div class="modal fade" id="modalAddTema" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Nuevo Autor</h4>
				</div>
				<div class="modal-body">



					<form class="form-horizontal">
						<fieldset>

							<div class="form-group">
								<label for="inNewAutorNombre" class="col-lg-2 control-label">Nombre</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="inNewAutorNombre"
										placeholder="Nombre">
								</div>
							</div>
							<div class="form-group">
								<label for="inNewAutorApellido" class="col-lg-2 control-label">Apellido</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="inNewAutorApellido"
										placeholder="Apellido">
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<button type="reset" class="btn btn-default">Cancel</button>
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</div>
						</fieldset>
					</form>
				</div>

			</div>
		</div>
	</div>
</body>

</html>
