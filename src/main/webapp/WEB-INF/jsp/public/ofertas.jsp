<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp"%>

<!-- Central Modal EN OBRAS -->
<div class="modal fade" id="centralModalEnObras" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-notify modal-warning" role="document">
        <!--Content-->
        <div class="modal-content">
            <!--Header-->
            <div class="modal-header">
                <p class="heading lead"><em class="fas fa-info-circle fa-lg text-white pr-2"></em>En Construcción</p>

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" class="white-text">&times;</span>
                </button>
            </div>

            <!--Body-->
            <div class="modal-body">
                <div class="text-center">
                    <i class="fas fa-hard-hat fa-4x mb-3 animated rotateIn"></i>
                    <p>Este contenido aún no está implementado</p>
                </div>
            </div>

            <!--Footer-->
            <div class="modal-footer justify-content-center">
                <a type="button" class="btn btn-outline-warning waves-effect" data-dismiss="modal">Cerrar</a>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>
<!-- Central Modal EN OBRAS -->

<div class="container py-5 mt-3">

<br>
<br>


  <!--Section: Content-->
  <section class="dark-grey-text p-sup-10">

    <div class="row">
      <div class="col">
        <h1 class="font-weight-bold" style="color: #e94647;">Ofertas destacadas</h1>
        <p class="lead grey-text mx-auto mb-3">Aprovecha y p&aacute;sate por los locales con ofertas para obtener puntos extra y sorpresas.</p>
      </div>

    </div>
    
    
    
    <!-- Grid row -->
    <div class="row align-items-center">

      <!-- Grid column -->
      <div class="col-lg-5 col-xl-4">

        <!-- Featured image -->
        <div class="view overlay rounded shadow mb-lg-0 mb-4">
          <img class="img-fluid" src='<spring:url value="/static/imagenes/oktoberfest.jpg" />' alt="Sample image">
        </div>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-lg-7 col-xl-8">

        <!-- Post title -->
        <h4 class="font-weight-bold mb-3"><strong>CerveWeb</strong></h4>
        <!-- Excerpt -->
        <p class="dark-grey-text">Otro año más celebramos la <span class="text-danger">Oktoberfest</span>, además de las ofertas especiales, por cada compra de una cerveza de la Oktoberfest te regalamos dos puntos.</p>
        <!-- Post data -->
        <p>11/09/2021</p>
        <!-- Read more button -->
        <a class="btn btn-danger btn-sm mx-0 btn-rounded" data-toggle="modal" data-target="#centralModalEnObras">Leer más...</a>

      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row -->    
    
    <hr class="my-5">    
       
  	<!-- Grid row -->
    <div class="row align-items-center">

      <!-- Grid column -->
      <div class="col-lg-5 col-xl-4">

        <!-- Featured image -->
        <div class="view overlay rounded shadow mb-lg-0 mb-4">
          <img class="img-fluid" src='<spring:url value="/static/imagenes/semana-cultural.jpg" />' alt="Sample image">
        </div>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-lg-7 col-xl-8">

        <!-- Post title -->
        <h4 class="font-weight-bold mb-3"><strong>Librería de la Luz</strong></h4>
        <!-- Excerpt -->
        <p class="dark-grey-text">Celebra el la <span class="text-danger">Semana Cultural</span> con nosotros. Por la compra de cualquier libro te regalamos 1 punto.</p>
        <!-- Post data -->
        <p>10/09/2021</p>
        <!-- Read more button -->
        <a class="btn btn-danger btn-sm mx-0 btn-rounded" data-toggle="modal" data-target="#centralModalEnObras">Leer más...</a>

      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row -->

    <br>

	<nav aria-label="Page navigation example">
	  <ul class="pagination pg-red justify-content-end">
	    <li class="page-item ">
	      <a class="page-link" tabindex="-1">Anterior</a>
	    </li>
	    <li class="page-item"><a class="page-link">1</a></li>
	    <li class="page-item active">
	      <a class="page-link">2 <span class="sr-only">(current)</span></a>
	    </li>
	    <li class="page-item"><a class="page-link">3</a></li>
	    <li class="page-item ">
	      <a class="page-link">Siguiente</a>
	    </li>
	  </ul>
	</nav>    


  </section>
  <!--Section: Content-->


<br>
<br>

</div>