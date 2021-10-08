layout.jsp<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp"%>

<br><br><br><br>

<div class="container-fluid py-5">


  <!--Section: Content-->
  <section class="dark-grey-text">

    <div class="row pr-lg-5">
      <div class="col-md-4 offset-2 d-flex align-items-center p-3">
        <div>
          
          <sec:authorize access="hasRole('COMERCIO')">
	          <h3 class="font-weight-bold">Zona privada-comercio</h3>
	          <p>Gestiona las compras realizadas en tu comercio y consulta los informes generados.</p>
		  </sec:authorize>
          <sec:authorize access="hasRole('CLIENTE')">
	          <h3 class="font-weight-bold">Zona privada-cliente</h3>
	          <p>Desde aquí podrás gestionar tus puntos y acceder a todas las ventajas que de ofrece nuestro sitio.</p>
		  </sec:authorize>
        	

        </div>
      </div>    
      <div class="col-md-6">
        <div class="view">
          <img src='<spring:url value="/static/imagenes/comercio-local_02.png" />' class="img-fluid" alt="Comercio Local">
        </div>

      </div>
    </div>

  </section>
  <!--Section: Content-->


</div>