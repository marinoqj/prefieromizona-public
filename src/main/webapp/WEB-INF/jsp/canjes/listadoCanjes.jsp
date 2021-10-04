

<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>

<script>
function borrarCanje(idCanje){

	 	document.formulario.idCanje.value = idCanje;
	 	document.formulario.action="borrarCanje.do";
	 	document.formulario.submit();

}
function editarCanje(idCanje){

 	document.formulario.idCanje.value = idCanje;
 	document.formulario.action="editarCanje.do";
 	document.formulario.submit();


}

function mostarConfirmBorrarCanje(idCanje) {
    var message = '<spring:message code="confirmacion.borrar.canje"/>';

    $("#aceptarBorrar").attr("href", "javascript:borrarCanje(" + idCanje + ");");

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


<!-- Warning Modal -->
<div id="alertModal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
         <p></p>
      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal"><em class="fas fa-times-circle"></em>&nbsp;&nbsp;Cancelar</button>
         <a class="btn btn-primary btn-sm" role="button" href="#" id="aceptarBorrar"><em class="fas fa-check-circle"></em>&nbsp;&nbsp;<spring:message code="button.aceptar" /></a>
      </div>
    </div>
  </div>
</div>

<!-- ./ Warning Modal -->

<form name="formulario" method="post">
	<input type="hidden" name="idCanje"/>
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
							<em class="fas fa-users fa-lg mr-2"></em>
							Listado de canjes</li>
					</ol>
				</nav>
			</div>
		</div>



<c:if  test="${!empty canjes}">


<div class="row">
	<div class="col-md-8"></div>

	<c:if test="${hayFiltro eq false}">
		<mistags:paginacion accion="listadoCanjes" />
	</c:if>

	<c:if test="${hayFiltro eq true}">
		<mistags:paginacion accion="listadoCanjesFiltrado" />
	</c:if>
</div>


<br>

	<table class="table table-hover">
		<thead class="blue lighten-4">
			<tr class="bg-light">
	    		
					<th scope="col"><spring:message code="label.fechaCanje"/></th>
					
					<th scope="col"><spring:message code="label.puntos"/></th>
					
					<th scope="col"><spring:message code="label.comercio"/></th>
					
					<th scope="col"><spring:message code="label.cliente"/></th>
					
					<th scope="col">&nbsp;</th>
				</tr>
			</thead>
			<tbody>
		<c:forEach items="${canjes}" var="canje">
			<tr>
			
				<td><fmt:formatDate value="${canje.fechaCanje}" pattern="dd-MM-yyyy" /></td>
			
				<td>${canje.puntos}</td>
			
				<td>${canje.comercio.razonSocial}</td>
			
				<td>${canje.cliente.nombre} ${canje.cliente.apellido1} ${canje.cliente.apellido2}</td>
			
				<td>
					<div>
							<label data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <span style="cursor: pointer;"><em class="fas fa-cog fa-lg"></em></span>
							</label>
							<ul class="dropdown-menu dropdown-primary">
								<li class="nav-item dropdown"><a class="dropdown-item"
									href="javascript:editarCanje('${canje.idCanje}')"><spring:message code="label.editar"/></a></li>
								<li class="nav-item dropdown"><a class="dropdown-item"
									href="javascript:mostarConfirmBorrarCanje('${canje.idCanje}')"><spring:message code="label.borrar"/></a></li>
							</ul>
						</div>
				</td>
			</tr>
		</c:forEach>
			</tbody>
			</table>


		</c:if>

		<c:if  test="${empty canjes}">

			<br>
			<br>
			<br>
			<br>
			<div class="text-center">No hay canjes que mostrar...</div>
		</c:if>

		<div class="row">
			<div class="col-md-12">
				<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#nuevoFormulario"><em class="fas fa-plus-circle"></em>&nbsp;&nbsp;Nuevo</button>
				<button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#ventanaBuscar"><em class="fas fa-search"></em> &nbsp;&nbsp;Buscar</button>
			</div>
		</div>


<!-- Modal Nuev@ canje-->
<div class="modal fade" id="nuevoFormulario" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header border-bottom-0" style="background-color: #e9ecef; color: #6c757d">
        <span class="modal-title" id="exampleModalLabel"><em class="fas fa-plus-circle fa-lg pr-1"></em><em class="fas fa-cube fa-lg pr-2"></em>Nueva canje</span>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="color: #6c757d">
		<form:form modelAttribute="canje" action="insertarCanje.do" method="post">

    		


					<div class="form-group">
						<label for="fechaCanje"><spring:message code="label.fechaCanje"/></label> <form:input path="fechaCanje" class="form-control"/>
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
        <button type="submit" class="btn btn-success btn-sm"><em class="fas fa-save"></em> &nbsp;&nbsp;Guardar</button>
      </div>

      </form:form>
    </div>
  </div>
</div>
</div>


<!-- Modal Busqueda -->
<div class="modal fade" id="ventanaBuscar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header border-bottom-0" style="background-color: #e9ecef; color: #6c757d">
        <span class="modal-title" id="exampleModalLabel"><em class="fas fas fa-search fa-lg pr-1"></em><em class="fas fa-cube fa-lg pr-2"></em>Buscar Constante</span>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="color: #6c757d">
		<form:form modelAttribute="canje" action='buscarCanjes.do' method="post" id="formularioBuscar">

    		


					<div class="form-group">
						<label for="fechaCanje"><spring:message code="label.fechaCanje"/></label> <form:input path="fechaCanje" class="form-control"/>
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
        <button type="submit" class="btn btn-success btn-sm"><em class="fas fa-save"></em> &nbsp;&nbsp;Buscar</button>
      </div>

      </form:form>
    </div>
  </div>
</div>
</div>


