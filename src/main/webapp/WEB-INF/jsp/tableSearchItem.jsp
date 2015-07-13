<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<div class="bs-docs-section">

	<div class="row">
		<div class="col-lg-12">
			<div class="page-header">
				<h1 id="tables">Resultado de la búsqueda</h1>
			</div>

			<div class="bs-component">
				<table class="table table-striped table-hover ">
					<thead>
						<tr>
							<th>#</th>
							<th>Titulo</th>
							<th>Tipo Item</th>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${items}" var="item">
						<tr>
							<td>${item.idItem}</td>
							<td>${item.titulo}</td>
							<td>${item.tipo.descripcion}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- /example -->
		</div>
	</div>
</div>