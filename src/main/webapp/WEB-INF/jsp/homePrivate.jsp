<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp"%>

<br><br>

<div class="container py-5 mt-3">

  <!--Section: Content-->
  <section class="dark-grey-text p-sup-20">

    <div class="row">
      <div class="col-md-4 d-flex align-items-center">
        <div>
          
          <sec:authorize access="hasRole('COMERCIO')">
	          <h3 class="font-weight-bold">Zona privada-comercio</h3>
	          <p>Gestiona las compras realizadas en tu comercio y consulta los informes generados.</p>
		  </sec:authorize>
          <sec:authorize access="hasRole('CLIENTE')">
	          <h3 class="font-weight-bold">Zona privada-cliente</h3>
	          <p>Desde aquí podrás gestionar tus puntos y acceder a todas las ventajas que te ofrece nuestro sitio.</p>
		  </sec:authorize>
        	

        </div>
      </div>    
      <div class="col-md-6">
        <div class="view">

          <img src='<spring:url value="/static/imagenes/comercio-local_03.png" />' class="img-fluid" alt="Comercio Local">

        </div>

      </div>
    </div>

  </section>
  <!--Section: Content-->
<br><br>

</div>