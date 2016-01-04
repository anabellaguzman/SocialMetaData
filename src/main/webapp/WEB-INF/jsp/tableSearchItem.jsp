<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>


	<div class="jumbotron">

			<div class="row">
				<div >
					<div class="page-header">
						<h1 id="tables">Resultado de la búsqueda</h1>
					</div>

					<div class="bs-component">
						<table class="table table-striped table-hover ">
							<thead>
								<tr>
									<!-- 							<th style="display:none;">id</th> -->
									<th>Titulo</th>
									<th>Tipo Item</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${items}" var="item">
									<tr onclick="doSearchItem('${item.idItem}')">
										<%-- 							<td id="td${item.idItem}" style="display:none;">${item.idItem}</td> --%>
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
	

<script type="text/javascript">
	function doSearchItem(id) {

		location.href = document.URL.substr(0, document.URL.lastIndexOf('/'))
				+ "/item?idItem=" + id;
	}
</script>