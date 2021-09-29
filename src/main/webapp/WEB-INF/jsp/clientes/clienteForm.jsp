
<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>


	<form:form modelAttribute="cliente" action='${modo}Cliente.do' method="post">


	<br>
	<br>
	<br>
	<br>
	<br>


	<div class="row">
		<div class="col-md-12">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item active"><em class="fas fa-list-alt fa-lg mr-1"></em><em class="fas fa-users fa-lg mr-2"></em>
					<c:if test="${modo == 'insertar'}">
					<spring:message code="label.alta.cliente"/>
					</c:if>
					<c:if test="${modo == 'actualizar'}">
					<spring:message code="label.editar.cliente"/>
					</c:if>
					</li>
				</ol>
			</nav>
		</div>
		</div>

						

							<c:if test="${modo == 'actualizar'}">

								<form:hidden path="idCliente"/>

							</c:if>
							

								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="codCliente"><spring:message code="label.codCliente"/></label> <form:input path="codCliente" class="form-control"/><form:errors path="codCliente" element="div" id="rojo"/>
									</div>
								</div>
					

								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="nombre"><spring:message code="label.nombre"/></label> <form:input path="nombre" class="form-control"/><form:errors path="nombre" element="div" id="rojo"/>
									</div>
								</div>
					

								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="apellido1"><spring:message code="label.apellido1"/></label> <form:input path="apellido1" class="form-control"/><form:errors path="apellido1" element="div" id="rojo"/>
									</div>
								</div>
					

								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="apellido2"><spring:message code="label.apellido2"/></label> <form:input path="apellido2" class="form-control"/><form:errors path="apellido2" element="div" id="rojo"/>
									</div>
								</div>
					

								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="dni"><spring:message code="label.dni"/></label> <form:input path="dni" class="form-control"/><form:errors path="dni" element="div" id="rojo"/>
									</div>
								</div>
					

								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="telefono"><spring:message code="label.telefono"/></label> <form:input path="telefono" class="form-control"/><form:errors path="telefono" element="div" id="rojo"/>
									</div>
								</div>
					


							<a href="./listadoClientes1.do" class="btn btn-secondary btn-sm"><em class="fas fa-times-circle"></em>&nbsp;&nbsp;Cancelar</a>
							<button type="submit" class="btn btn-success btn-sm" ><em class="fas fa-save"></em> &nbsp;&nbsp;Guardar</button>





	</form:form>

