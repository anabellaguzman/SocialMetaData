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
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
<script src="../resources/flatly/bootswatch.js"></script>
<script src="<c:url value="/resources/flatly/bootswatch.js" />"></script>
<script src="<c:url value="/resources/js/jquery.form.js" />"></script>
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
						aria-label="Close" id="btnCloseModal">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Nuevo Tema</h4>
				</div>
				<div class="modal-body">



					<form id=formTema class="form-horizontal" method="POST"
						action="addTema">
						<fieldset>

							<div class="form-group">
								<label for="inNewTema" class="col-lg-2 control-label">Tema</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="newTema"
										name="newTema" placeholder="Tema">
								</div>
							</div>			
							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<button id="btnResetTema" type="reset" class="btn btn-default">Limpiar
										campos</button>
									<button type="submit" class="btn btn-primary">Guardar</button>
								</div>
							</div>
							<div id = serverMsg>							
							</div>
						</fieldset>
					</form>
				</div>

			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#formTema').ajaxForm({
				success : function(data) {
					console.log(data);
					createAlertSuccess(data, "#temaSuccess");
					$('#btnResetTema').trigger('click');
					$("#temaSuccess").fadeOut(4000, function(){
						$(this).remove();
					});
				}

			});
		});
		

		
		
		function createAlertSuccess(data, id){
			
				var $newAlert = $('<div/>', {
					'class' : "alert alert-dismiss alert-success",
					'id' : id,
					html : data
				}).append($('<button/>', {
					'type' : "button",
					'class' : "close",
					'data-dismiss' : "alert",
					html : "x"
				}));
				$newAlert.appendTo("#serverMsg");

			return;
		}
	</script>
</body>




</html>
