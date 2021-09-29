

<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>

<script>
function borrarComercio(idComercio){

	 	document.formulario.idComercio.value = idComercio;
	 	document.formulario.action="borrarComercio.do";
	 	document.formulario.submit();

}
function editarComercio(idComercio){

 	document.formulario.idComercio.value = idComercio;
 	document.formulario.action="editarComercio.do";
 	document.formulario.submit();


}

function mostarConfirmBorrarComercio(idComercio) {
    var message = '<spring:message code="confirmacion.borrar.comercio"/>';

    $("#aceptarBorrar").attr("href", "javascript:borrarComercio(" + idComercio + ");");

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
	<input type="hidden" name="idComercio"/>
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
						<li class="breadcrumb-item active"><em class="fas fa-list-alt fa-lg mr-1"></em>
						<em class="fas fa-users fa-lg mr-2"></em>
						Listado de comercios</li>
					</ol>
				</nav>
			</div>
		</div>



<c:if  test="${!empty comercios}">


<div class="row">
	<div class="col-md-8"></div>

	<c:if test="${hayFiltro eq false}">
		<mistags:paginacion accion="listadoComercios" />
	</c:if>

	<c:if test="${hayFiltro eq true}">
		<mistags:paginacion accion="listadoComerciosFiltrado" />
	</c:if>
</div>


<br>

	<table class="table table-hover">
		<thead class="blue lighten-4">
			<tr class="bg-light">
	    		
					<th scope="col"><spring:message code="label.codComercio"/></th>
					
					<th scope="col"><spring:message code="label.razonSocial"/></th>
					
					<th scope="col"><spring:message code="label.cif"/></th>
					
					<th scope="col"><spring:message code="label.nombreResponsable"/></th>
					
					<th scope="col"><spring:message code="label.apellido1Responsable"/></th>
					
					<th scope="col"><spring:message code="label.apellido2Responsable"/></th>
					
					<th scope="col"><spring:message code="label.direccion"/></th>
					
					<th scope="col"><spring:message code="label.municipio"/></th>
					
					<th scope="col"><spring:message code="label.codPostal"/></th>
					
					<th scope="col">&nbsp;</th>
				</tr>
			</thead>
			<tbody>
		<c:forEach items="${comercios}" var="comercio">
			<tr>
			
				<td>${comercio.codComercio}</td>
			
				<td>${comercio.razonSocial}</td>
			
				<td>${comercio.cif}</td>
			
				<td>${comercio.nombreResponsable}</td>
			
				<td>${comercio.apellido1Responsable}</td>
			
				<td>${comercio.apellido2Responsable}</td>
			
				<td>${comercio.direccion}</td>
			
				<td>${comercio.municipio}</td>
			
				<td>${comercio.codPostal}</td>
			
				<td>
					<div>
							<label data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <span style="cursor: pointer;"><em class="fas fa-cog fa-lg"></em></span>
							</label>
							<ul class="dropdown-menu dropdown-primary">
								<li class="nav-item dropdown"><a class="dropdown-item"
									href="javascript:editarComercio('${comercio.idComercio}')"><spring:message code="label.editar"/></a></li>
								<li class="nav-item dropdown"><a class="dropdown-item"
									href="javascript:mostarConfirmBorrarComercio('${comercio.idComercio}')"><spring:message code="label.borrar"/></a></li>
							</ul>
						</div>
				</td>
			</tr>
		</c:forEach>
			</tbody>
			</table>


		</c:if>

		<c:if  test="${empty comercios}">

			<br>
			<br>
			<br>
			<br>
			<div class="text-center">No hay comercios que mostrar...</div>
		</c:if>

		<div class="row">
			<div class="col-md-12">
				<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#nuevoFormulario"><em class="fas fa-plus-circle"></em>&nbsp;&nbsp;Nuevo</button>
				<button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#ventanaBuscar"><em class="fas fa-search"></em> &nbsp;&nbsp;Buscar</button>
			</div>
		</div>


<!-- Modal Nuev@ comercio-->
<div class="modal fade" id="nuevoFormulario" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header border-bottom-0" style="background-color: #e9ecef; color: #6c757d">
        <span class="modal-title" id="exampleModalLabel"><em class="fas fa-plus-circle fa-lg pr-1"></em><em class="fas fa-cube fa-lg pr-2"></em>Nueva comercio</span>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="color: #6c757d">
		<form:form modelAttribute="comercio" action="insertarComercio.do" method="post">

    		


					<div class="form-group">
						<label for="codComercio"><spring:message code="label.codComercio"/></label> <form:input path="codComercio" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="razonSocial"><spring:message code="label.razonSocial"/></label> <form:input path="razonSocial" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="cif"><spring:message code="label.cif"/></label> <form:input path="cif" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="nombreResponsable"><spring:message code="label.nombreResponsable"/></label> <form:input path="nombreResponsable" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="apellido1Responsable"><spring:message code="label.apellido1Responsable"/></label> <form:input path="apellido1Responsable" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="apellido2Responsable"><spring:message code="label.apellido2Responsable"/></label> <form:input path="apellido2Responsable" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="direccion"><spring:message code="label.direccion"/></label> <form:input path="direccion" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="municipio"><spring:message code="label.municipio"/></label> <form:input path="municipio" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="codPostal"><spring:message code="label.codPostal"/></label> <form:input path="codPostal" class="form-control"/>
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
		<form:form modelAttribute="comercio" action='buscarComercios.do' method="post" id="formularioBuscar">

    		


					<div class="form-group">
						<label for="codComercio"><spring:message code="label.codComercio"/></label> <form:input path="codComercio" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="razonSocial"><spring:message code="label.razonSocial"/></label> <form:input path="razonSocial" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="cif"><spring:message code="label.cif"/></label> <form:input path="cif" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="nombreResponsable"><spring:message code="label.nombreResponsable"/></label> <form:input path="nombreResponsable" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="apellido1Responsable"><spring:message code="label.apellido1Responsable"/></label> <form:input path="apellido1Responsable" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="apellido2Responsable"><spring:message code="label.apellido2Responsable"/></label> <form:input path="apellido2Responsable" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="direccion"><spring:message code="label.direccion"/></label> <form:input path="direccion" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="municipio"><spring:message code="label.municipio"/></label> <form:input path="municipio" class="form-control"/>
					</div>

					


					<div class="form-group">
						<label for="codPostal"><spring:message code="label.codPostal"/></label> <form:input path="codPostal" class="form-control"/>
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


