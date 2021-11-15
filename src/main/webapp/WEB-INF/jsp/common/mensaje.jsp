<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>

		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>

<c:set var="tipoAlert" value="alert-success"/>
<c:set var="icono" value="fas fa-info-circle"/>

<c:if test="${not fn:contains(mensaje, '.ok')}">
	<c:set var="tipoAlert" value="alert-danger"/>
	<c:set var="icono" value="fas fa-exclamation-triangle"/>
</c:if>


		
<c:if test="${not empty mensaje}">
	<div class="row alert ${tipoAlert} ">
		<div class="col text-center pt-3">
				<span><em class="${icono} fa-2x align-bottom"></em></span>&nbsp;&nbsp;&nbsp;
				<span class="agradecimiento"><spring:message code="${mensaje}" /></span>
				<br><br>
		</div>
	</div>
	<br><br><br>	
</c:if>