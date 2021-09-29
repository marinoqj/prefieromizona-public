
<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>


	<form:form modelAttribute="comercio" action='${modo}Comercio.do' method="post">


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
					<spring:message code="label.alta.comercio"/>
					</c:if>
					<c:if test="${modo == 'actualizar'}">
					<spring:message code="label.editar.comercio"/>
					</c:if>
					</li>
				</ol>
			</nav>
		</div>
		</div>

						

							<c:if test="${modo == 'actualizar'}">

								<form:hidden path="idComercio"/>

							</c:if>
							

								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="codComercio"><spring:message code="label.codComercio"/></label> <form:input path="codComercio" class="form-control"/><form:errors path="codComercio" element="div" id="rojo"/>
									</div>
								</div>
					

								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="razonSocial"><spring:message code="label.razonSocial"/></label> <form:input path="razonSocial" class="form-control"/><form:errors path="razonSocial" element="div" id="rojo"/>
									</div>
								</div>
					

								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="cif"><spring:message code="label.cif"/></label> <form:input path="cif" class="form-control"/><form:errors path="cif" element="div" id="rojo"/>
									</div>
								</div>
					

								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="nombreResponsable"><spring:message code="label.nombreResponsable"/></label> <form:input path="nombreResponsable" class="form-control"/><form:errors path="nombreResponsable" element="div" id="rojo"/>
									</div>
								</div>
					

								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="apellido1Responsable"><spring:message code="label.apellido1Responsable"/></label> <form:input path="apellido1Responsable" class="form-control"/><form:errors path="apellido1Responsable" element="div" id="rojo"/>
									</div>
								</div>
					

								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="apellido2Responsable"><spring:message code="label.apellido2Responsable"/></label> <form:input path="apellido2Responsable" class="form-control"/><form:errors path="apellido2Responsable" element="div" id="rojo"/>
									</div>
								</div>
					

								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="direccion"><spring:message code="label.direccion"/></label> <form:input path="direccion" class="form-control"/><form:errors path="direccion" element="div" id="rojo"/>
									</div>
								</div>
					

								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="municipio"><spring:message code="label.municipio"/></label> <form:input path="municipio" class="form-control"/><form:errors path="municipio" element="div" id="rojo"/>
									</div>
								</div>
					

								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="codPostal"><spring:message code="label.codPostal"/></label> <form:input path="codPostal" class="form-control"/><form:errors path="codPostal" element="div" id="rojo"/>
									</div>
								</div>
					


							<a href="./listadoComercios1.do" class="btn btn-secondary btn-sm"><em class="fas fa-times-circle"></em>&nbsp;&nbsp;Cancelar</a>
							<button type="submit" class="btn btn-success btn-sm" ><em class="fas fa-save"></em> &nbsp;&nbsp;Guardar</button>





	</form:form>

