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

<script  type="text/javascript">

function doSearchItem(id){
	
	
	
	$.ajax({
		url : "item",
		type : "GET",
		data : {idItem: id},
// 		success : function(response) {		
// 			 $("#subViewDiv").html(response);
// 		}
// 		,
// 		error: function (xhr,textStatus,errorThrown){
			
// 		alert("Error: " + xhr.status + " " + xhr.statusText);
// 		}
	
		
	});
}

</script>