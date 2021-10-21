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
  <section class="magazine-section dark-grey-text p-sup-10">

      <div class="row">
          <div class="col">
              <h1 class="font-weight-bold" style="color: #e94647;">Noticias</h1>
              <p class="lead grey-text mx-auto mb-3">Citas y actividades de interés organizadas por los establecimientos</p>
          </div>
      </div>

  	<!-- Grid row -->
    <div class="row">

      <!-- Grid column -->
      <div class="col-lg-6 col-md-12 mb-4">

        <!-- Featured news -->
        <div class="single-news">

          <!-- Image -->
          <div class="view overlay rounded z-depth-2 mb-4">
            <img class="img-fluid" src='<spring:url value="/static/imagenes/halloween-beer.jpg" />' alt="Sample image">
          </div>

          <!-- Excerpt -->
          <div class="text-danger h5-responsive"><b>CerveWeb</b></div>
          <div class="font-weight-bold dark-grey-text">14/10/2021</div>
          <p class="dark-grey-text">Ven a disfrutrar con nosotros de nuestra tradicional fiesta de Halloween. Habrá música, sorteos y, como siempre, muy buen ambiente.</p>
          <!-- Read more button -->
          <a class="btn btn-danger btn-sm mx-0 btn-rounded" data-toggle="modal" data-target="#centralModalEnObras">Leer más...</a>

        </div>
        <!-- Featured news -->

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-lg-6 col-md-12 mb-4">

        <!-- Small news -->
        <div class="single-news mb-4">

          <!-- Grid row -->
          <div class="row">

            <!-- Grid column -->
            <div class="col-md-3">

              <!--Image-->
              <div class="view overlay rounded z-depth-1 mb-4">
                <img class="img-fluid" src='<spring:url value="/static/imagenes/dia-vision.jpg" />' alt="Sample image">
              </div>

            </div>
            <!-- Grid column -->

            <!-- Grid column -->
            <div class="col-md-9">

              <!-- Excerpt -->
              <div class="text-danger h5-responsive"><b>Centro Médico</b></div>
              <div class="font-weight-bold dark-grey-text">14/10/2021</div>
              <div class="d-flex justify-content-between">
                <div class="col-11 text-truncate pl-0 mb-3">
                  <a href="#!" class="dark-grey-text">Día Mundial de la Visión</a>
                </div>
                <a data-toggle="modal" data-target="#centralModalEnObras"><i class="fas fa-angle-double-right red-text"></i></a>
              </div>

            </div>
            <!-- Grid column -->

          </div>
          <!-- Grid row -->

        </div>
        <!-- Small news -->

        <!-- Small news -->
        <div class="single-news mb-4">

          <!-- Grid row -->
          <div class="row">

            <!-- Grid column -->
            <div class="col-md-3">

              <!--Image-->
              <div class="view overlay rounded z-depth-1 mb-4">
                <img class="img-fluid" src='<spring:url value="/static/imagenes/lecturas-recomendadas.jpg" />' alt="Sample image">
              </div>

            </div>
            <!-- Grid column -->

            <!-- Grid column -->
            <div class="col-md-9">

              <!-- Excerpt -->
              <div class="text-danger h5-responsive"><b>Libros Libres</b></div>
              <div class="font-weight-bold dark-grey-text">12/10/2021</div>
              <div class="d-flex justify-content-between">
                <div class="col-11 text-truncate pl-0 mb-3">
                  <a href="#!" class="dark-grey-text">Presentación de novedades Literarias</a>
                </div>
                <a data-toggle="modal" data-target="#centralModalEnObras"><i class="fas fa-angle-double-right red-text"></i></a>
              </div>

            </div>
            <!-- Grid column -->

          </div>
          <!-- Grid row -->

        </div>
        <!-- Small news -->

        <!-- Small news -->
        <div class="single-news mb-4">

          <!-- Grid row -->
          <div class="row">

            <!-- Grid column -->
            <div class="col-md-3">

              <!--Image-->
              <div class="view overlay rounded z-depth-1 mb-4">
                <img class="img-fluid" src='<spring:url value="/static/imagenes/cervezas-artesanas.jpg" />' alt="Sample image">
              </div>

            </div>
            <!-- Grid column -->

            <!-- Grid column -->
            <div class="col-md-9">

              <!-- Excerpt -->
              <div class="text-danger h5-responsive"><b>CerveWeb</b></div>
              <div class="font-weight-bold dark-grey-text">19/07 al 25/07/2021</div>
              <div class="d-flex justify-content-between">
                <div class="col-11 text-truncate pl-0 mb-3">
                  <a href="#!" class="dark-grey-text">Semana de la cerveza artesana</a>
                </div>
                <a data-toggle="modal" data-target="#centralModalEnObras"><i class="fas fa-angle-double-right red-text"></i></a>
              </div>

            </div>
            <!-- Grid column -->

          </div>
          <!-- Grid row -->

        </div>
        <!-- Small news -->

        <!-- Small news -->
        <div class="single-news">


        </div>
        <!-- Small news -->

      </div>
      <!--Grid column-->

    </div>
    <!-- Grid row -->
    
    
	<nav aria-label="Page navigation example">
	  <ul class="pagination pg-red justify-content-end">
	    <li class="page-item ">
	      <a class="page-link" tabindex="-1">Anterior</a>
	    </li>
	    <li class="page-item active"><a class="page-link">1</a></li>
	    <li class="page-item">
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


</div>