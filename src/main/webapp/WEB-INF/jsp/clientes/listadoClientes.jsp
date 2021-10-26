

<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>

<script>

$(document).ready(function(){
	$('#ventanaBuscar').on('hidden.bs.modal', function () {
		$('form[id="formularioBuscar"]').trigger('reset');
	});
});


function borrarCliente(idCliente){

	 	document.formulario.idCliente.value = idCliente;
	 	document.formulario.action="borrarCliente.do";
	 	document.formulario.submit();

}
function editarCliente(idCliente){

 	document.formulario.idCliente.value = idCliente;
 	document.formulario.action="editarCliente.do";
 	document.formulario.submit();


}

function mostarConfirmBorrarCliente(idCliente) {
    var message = '<spring:message code="confirmacion.borrar.cliente"/>';

    $("#aceptarBorrar").attr("href", "javascript:borrarCliente(" + idCliente + ");");

    mostrarConfirm(message);
}


function mostrarConfirm(message) {
    $('#alertModal').find('.modal-body p').html(message);
    $('#alertModal').modal('show');
}

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
	<input type="hidden" name="idCliente"/>
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
						<li class="breadcrumb-item active">
							<em class="fas fa-list-alt fa-lg mr-1"></em>
							<em class="fas fa-users fa-lg mr-2"></em>Listado de clientes
						</li>
					</ol>
				</nav>
			</div>
		</div>



<c:if  test="${!empty clientes}">


<div class="row">
	<div class="col-md-8"></div>

	<c:if test="${hayFiltro eq false}">
		<mistags:paginacion accion="listadoClientes" />
	</c:if>

	<c:if test="${hayFiltro eq true}">
		<mistags:paginacion accion="listadoClientesFiltrado" />
	</c:if>
</div>


<br>

	<table class="table table-hover">
		<thead class="blue lighten-4">
			<tr class="bg-light">
	    		
					<th scope="col"><spring:message code="label.codCliente"/></th>
					
					<th scope="col"><spring:message code="label.nombre"/></th>
					
					<th scope="col"><spring:message code="label.apellido1"/></th>
					
					<th scope="col"><spring:message code="label.apellido2"/></th>
					
					<th scope="col"><spring:message code="label.dni"/></th>
					
					<th scope="col"><spring:message code="label.telefono"/></th>
					
					<th scope="col">&nbsp;</th>
				</tr>
			</thead>
			<tbody>
		<c:forEach items="${clientes}" var="cliente">
			<tr>
			
				<td>${cliente.codCliente}</td>
			
				<td>${cliente.nombre}</td>
			
				<td>${cliente.apellido1}</td>
			
				<td>${cliente.apellido2}</td>
			
				<td>${cliente.dni}</td>
			
				<td>${cliente.telefono}</td>
			
				<td>
					<div>
							<label data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <span style="cursor: pointer"><em class="fas fa-cog fa-lg"></em></span>
							</label>
							<ul class="dropdown-menu dropdown-primary">
								<li class="nav-item dropdown"><a class="dropdown-item"
									href="javascript:editarCliente('${cliente.idCliente}')"><spring:message code="label.editar"/></a></li>
								<li class="nav-item dropdown"><a class="dropdown-item"
									href="javascript:mostarConfirmBorrarCliente('${cliente.idCliente}')"><spring:message code="label.borrar"/></a></li>
							</ul>
						</div>
				</td>
			</tr>
		</c:forEach>
			</tbody>
			</table>


		</c:if>

		<c:if  test="${empty clientes}">

			<br>
			<br>
			<br>
			<br>
			<div class="text-center">No hay clientes que mostrar...</div>
		</c:if>

		<div class="row">
			<div class="col-md-12">
				<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#nuevoFormulario"><em class="fas fa-plus-circle"></em>&nbsp;&nbsp;Nuevo</button>
				<button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#ventanaBuscar"><em class="fas fa-search"></em> &nbsp;&nbsp;Buscar</button>
			</div>
		</div>


<!-- Modal Nuev@ cliente-->
<div class="modal fade" id="nuevoFormulario" tabindex="-1" role="dialog" aria-labelledby="modalLabelNuevo"
  aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header border-bottom-0" style="background-color: #e9ecef; color: #6c757d">
        <span class="modal-title" id="modalLabelNuevo"><em class="fas fa-plus-circle fa-lg pr-1"></em><em class="fas fa-users fa-lg mr-2"></em>Nuevo cliente</span>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="color: #6c757d">
		<form:form modelAttribute="cliente" action="insertarCliente.do" method="post">

    		
					<!-- Grid row -->
					<div class="form-row">
						<!-- Default input -->
						<div class="form-group col-md-2">
							<label for="codCliente"><spring:message code="label.codCliente"/></label> <form:input path="codCliente" class="form-control"/>
						</div>
						<!-- Default input -->
						<div class="form-group col-md-5">
							<label for="dni"><spring:message code="label.dni"/></label> <form:input path="dni" class="form-control"/>
						</div>
						<!-- Default input -->
						<div class="form-group col-md-5">
							<label for="telefono"><spring:message code="label.telefono"/></label> <form:input path="telefono" class="form-control"/>
						</div>
						
					</div>
					<!-- Grid row -->

					
					<!-- Grid row -->
					<div class="form-row">
						<!-- Default input -->
						<div class="form-group col-md-4">
							<label for="nombre"><spring:message code="label.nombre"/></label> <form:input path="nombre" class="form-control"/>
						</div>
						<!-- Default input -->
						<div class="form-group col-md-4">
							<label for="apellido1"><spring:message code="label.apellido1"/></label> <form:input path="apellido1" class="form-control"/>
						</div>
						<!-- Default input -->
						<div class="form-group col-md-4">
							<label for="apellido2"><spring:message code="label.apellido2"/></label> <form:input path="apellido2" class="form-control"/>
						</div>
						
					</div>
					<!-- Grid row -->


			<br>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal"><em class="fas fa-times-circle"></em>&nbsp;&nbsp;Cancelar</button>
        <button type="submit" class="btn btn-primary btn-sm"><em class="fas fa-save"></em> &nbsp;&nbsp;Guardar</button>
      </div>

      </form:form>
    </div>
  </div>
</div>
</div>


<!-- Modal Busqueda -->
<div class="modal fade" id="ventanaBuscar" tabindex="-1" role="dialog" aria-labelledby="modalLabelBusqueda"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header border-bottom-0" style="background-color: #e9ecef; color: #6c757d">
        <span class="modal-title" id="modalLabelBusqueda"><em class="fas fas fa-search fa-lg pr-1"></em><em class="fas fa-users fa-lg mr-2"></em>Buscar cliente</span>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="color: #6c757d">
		<form:form modelAttribute="cliente" action='buscarClientes.do' method="post" id="formularioBuscar">

    		


					<div class="form-group">
						<label for="codCliente"><spring:message code="label.codCliente"/></label> <form:input path="codCliente" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="nombre"><spring:message code="label.nombre"/></label> <form:input path="nombre" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="apellido1"><spring:message code="label.apellido1"/></label> <form:input path="apellido1" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="apellido2"><spring:message code="label.apellido2"/></label> <form:input path="apellido2" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="dni"><spring:message code="label.dni"/></label> <form:input path="dni" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="telefono"><spring:message code="label.telefono"/></label> <form:input path="telefono" class="form-control"/>
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


</div>