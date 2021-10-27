

<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>

<script>
function borrarCompra(idCompra){

	 	document.formulario.idCompra.value = idCompra;
	 	document.formulario.action="borrarCompra.do";
	 	document.formulario.submit();

}
function editarCompra(idCompra){

 	document.formulario.idCompra.value = idCompra;
 	document.formulario.action="editarCompra.do";
 	document.formulario.submit();


}

function mostarConfirmBorrarCompra(idCompra) {
    var message = '<spring:message code="confirmacion.borrar.compra"/>';

    $("#aceptarBorrar").attr("href", "javascript:borrarCompra(" + idCompra + ");");

    mostrarConfirm(message);
}


function mostrarConfirm(message) {
    $('#alertModal').find('.modal-body p').html(message);
    $('#alertModal').modal('show');
}

$(document).ready(function(){
    $('#ventanaBuscar').on('hidden.bs.modal', function () {
        $('form[id="formularioBuscar"]').trigger('reset');
    });
});


</script>

<!-- CONTAINER -->
<div class="container">

<!-- Warning Modal -->
<div id="alertModal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
       <div class="modal-header bg-danger">
           <h5 class="modal-title text-white">
               <i class="fas fa-exclamation-triangle fa-lg"></i>&nbsp;&nbsp;
               Atención
           </h5>
           <button class="close text-white" data-dismiss="modal">&times;</button>
       </div>
       <div class="modal-body">
           <p class="text-danger"></p>
       </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal"><em class="fas fa-times-circle"></em>&nbsp;&nbsp;Cancelar</button>
         <a class="btn btn-danger btn-sm" role="button" href="#" id="aceptarBorrar"><em class="fas fa-check-circle"></em>&nbsp;&nbsp;<spring:message code="button.aceptar" /></a>
      </div>
    </div>
  </div>
</div>

<!-- ./ Warning Modal -->

<form name="formulario" method="post">
	<input type="hidden" name="idCompra"/>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

		<br>
		<br>
		<br>
		<br>
		<br>


		<div class="row">
			<div class="col-md-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item active"><em class="fas fa-list-alt fa-lg mr-1"></em><em class="fas fa-shopping-cart fa-lg mr-2"></em>Listado de compras</li>
					</ol>
				</nav>
			</div>
		</div>


<c:if  test="${!empty compras}">


<div class="row">
	<div class="col-md-8"></div>

	<c:if test="${hayFiltro eq false}">
		<mistags:paginacion accion="listadoCompras" />
	</c:if>

	<c:if test="${hayFiltro eq true}">
		<mistags:paginacion accion="listadoComprasFiltrado" />
	</c:if>
</div>


<br>

	<table class="table table-hover">
		<thead class="blue lighten-4">
			<tr class="bg-light">
	    		
					<th scope="col"><spring:message code="label.fechaCompra"/></th>
					
					<th scope="col"><spring:message code="label.puntos"/></th>
					
					<c:if test='${tipo ne "comercio"}'>
						<th scope="col"><spring:message code="label.comercio"/></th>
					</c:if>
					
					<c:if test='${tipo ne "cliente"}'>
						<th scope="col"><spring:message code="label.cliente"/></th>
					</c:if>
					
					<th scope="col">&nbsp;</th>
				</tr>
			</thead>
			<tbody>
		<c:forEach items="${compras}" var="compra">
			<tr>
			
				<td><fmt:formatDate value="${compra.fechaCompra}" pattern="dd-MM-yyyy" /></td>
			
				<td>${compra.puntos}</td>
			
				<c:if test='${tipo ne "comercio"}'>
					<td>${compra.comercio.razonSocial}</td>
				</c:if>
			
				<c:if test='${tipo ne "cliente"}'>
					<td>${compra.cliente.nombre} ${compra.cliente.apellido1} ${compra.cliente.apellido2}</td>
				</c:if>
			
				<td>
					<div>
							<label data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <span style="cursor: pointer;"><em class="fas fa-cog fa-lg"></em></span>
							</label>
							<ul class="dropdown-menu dropdown-primary">
								<li class="nav-item dropdown"><a class="dropdown-item"
									href="javascript:editarCompra('${compra.idCompra}')"><spring:message code="label.editar"/></a></li>
								<li class="nav-item dropdown"><a class="dropdown-item"
									href="javascript:mostarConfirmBorrarCompra('${compra.idCompra}')"><spring:message code="label.borrar"/></a></li>
							</ul>
						</div>
				</td>
			</tr>
		</c:forEach>
			</tbody>
			</table>


		</c:if>

		<c:if  test="${empty compras}">

			<br>
			<br>
			<br>
			<br>
			<div class="text-center">No hay compras que mostrar...</div>
		</c:if>

		<div class="row">
			<div class="col-md-12">				
				<button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#ventanaBuscar"><em class="fas fa-search"></em> &nbsp;&nbsp;Buscar</button>
			</div>
		</div>




<!-- Modal Busqueda -->
<div class="modal fade" id="ventanaBuscar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header border-bottom-0" style="background-color: #e9ecef; color: #6c757d">
        <span class="modal-title" id="exampleModalLabel"><em class="fas fas fa-search fa-lg pr-1"></em><em class="fas fa-shopping-cart fa-lg mr-2"></em>Buscar compra</span>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="color: #6c757d">
		<form:form modelAttribute="compra" action='buscarCompras.do' method="post" id="formularioBuscar">

    		


					<div class="form-group">
						<label for="fechaCompra"><spring:message code="label.fechaCompra"/></label> <form:input path="fechaCompra" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="puntos"><spring:message code="label.puntos"/></label> <form:input path="puntos" class="form-control"/>
					</div>
					


					<div class="form-group">
						<label for="idComercio"><spring:message code="label.idComercio"/></label> <form:input path="idComercio" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="idCliente"><spring:message code="label.idCliente"/></label> <form:input path="idCliente" class="form-control"/>
					</div>

					


			<br>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal"><em class="fas fa-times-circle"></em>&nbsp;&nbsp;Cancelar</button>
        <button type="submit" class="btn btn-success btn-sm"><em class="fas fa-search"></em> &nbsp;&nbsp;Buscar</button>
      </div>

      </form:form>
    </div>
  </div>
</div>
</div>


</div><!-- ./container -->
<br><br>