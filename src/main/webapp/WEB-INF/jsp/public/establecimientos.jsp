<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp"%>



 <!-- Central Modal LIBRERIA -->
 <div class="modal fade" id="centralModalLibreria" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
   aria-hidden="true">
   <div class="modal-dialog modal-notify modal-info" role="document">
     <!--Content-->
     <div class="modal-content">
       <!--Header-->
       <div class="modal-header">
         <p class="heading lead"><em class="fas fa-info-circle fa-lg text-white pr-2"></em>Programa de Puntos</p>

         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true" class="white-text">&times;</span>
         </button>
       </div>

       <!--Body-->
       <div class="modal-body">
         <div class="text-center">
           <i class="fas fa-star fa-4x mb-3 animated rotateIn"></i>
           <p>Por cada euro consumido generas un punto.</p>
           <p>Cada 100 puntos te regalamos un libro de la colección de bolsillo.</p>
         </div>
       </div>

       <!--Footer-->
       <div class="modal-footer justify-content-center">
         <a type="button" class="btn btn-outline-info waves-effect" data-dismiss="modal">Cerrar</a>
       </div>
     </div>
     <!--/.Content-->
   </div>
 </div>
 <!-- Central Modal LBRERIA-->

<!-- Central Modal CERVECERIA -->
<div class="modal fade" id="centralModalCerveceria" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-notify modal-info" role="document">
        <!--Content-->
        <div class="modal-content">
            <!--Header-->
            <div class="modal-header">
                <p class="heading lead"><em class="fas fa-info-circle fa-lg text-white pr-2"></em>Programa de Puntos</p>

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" class="white-text">&times;</span>
                </button>
            </div>

            <!--Body-->
            <div class="modal-body">
                <div class="text-center">
                    <i class="fas fa-star fa-4x mb-3 animated rotateIn"></i>
                    <p>Por cada euro consumido generas un punto.</p>
                    <p>Cada 50 puntos te regalamos una pinta de importación.</p>
                </div>
            </div>

            <!--Footer-->
            <div class="modal-footer justify-content-center">
                <a type="button" class="btn btn-outline-info waves-effect" data-dismiss="modal">Cerrar</a>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>
<!-- Central Modal CERVECERIA -->

<!-- Central Modal CENTRO-MÉDICO -->
<div class="modal fade" id="centralModalCentroMedico" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-notify modal-info" role="document">
        <!--Content-->
        <div class="modal-content">
            <!--Header-->
            <div class="modal-header">
                <p class="heading lead"><em class="fas fa-info-circle fa-lg text-white pr-2"></em>Programa de Puntos</p>

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" class="white-text">&times;</span>
                </button>
            </div>

            <!--Body-->
            <div class="modal-body">
                <div class="text-center">
                    <i class="fas fa-star fa-4x mb-3 animated rotateIn"></i>
                    <p>Por cada visita a un especialista acumulas 100 puntos</p>
                    <p>Cada 300 puntos te regalamos una consulta a cualquiera de nuestros especialistas.</p>
                </div>
            </div>

            <!--Footer-->
            <div class="modal-footer justify-content-center">
                <a type="button" class="btn btn-outline-info waves-effect" data-dismiss="modal">Cerrar</a>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>
<!-- Central Modal CENTRO-MÉDICO -->


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



<br><br>

<div class="container py-5 mt-3">


  <!--Section: Content-->
  <section class="dark-grey-text p-sup-20">

    <div class="row">
      <div class="col-lg-12 col-xl-6 mb-5">
        <div class="view">
          <img src='<spring:url value="/static/imagenes/establecimientos.jpg" />' class="img-fluid mx-auto d-block" alt="Comercio Local">
        </div>
      </div>    
      <div class="col-lg-12 col-xl-6 px-3">
          <h1 class="font-weight-bold" style="color: #e94647;">¿Qué comercios se encuentran adheridos al programa?</h1>

        <p>En esta página se encuentra un listado de aquellos negocios que pertenecen al programa de fidelización <strong>PrefieroMiZona</strong>. Además podrás consultar una tabla de equivalencias
        	entre puntos y descuentos ofrecidos. No te olvides de visitar la web de cada establecimiento para estar al día de todos los descuentos y eventos programados.</p>
      </div>    
    </div>

    <hr class="mb-0">

      <style>
          .border-card {
              border: 1px solid #e1e1e1;
              border-radius: 10px;
          }
      </style>

    <!--/ .ACORDEON ESTABLECIMIENTOS -->
    <!--Accordion wrapper-->
    <div class="accordion md-accordion" id="accordionEstablecimientos" role="tablist" aria-multiselectable="true">

        <!-- Accordion card -->
        <div class="card">

            <!-- Card header -->
            <div class="card-header" role="tab" id="headingEstablecimiento3">
                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEstablecimientos" href="#collapseEstablecimiento3" aria-expanded="false" aria-controls="collapseEstablecimiento3">
                    <h5 class="mb-0">
                        <span style="color: #e94647; font-size: 1.8rem; font-weight: 600"><em class="fas fa-book pr-2"></em>Librerías<i class="fas fa-angle-down rotate-icon"></i></span>
                    </h5>
                </a>
            </div>

            <!-- Card body -->
            <div id="collapseEstablecimiento3" class="collapse" role="tabpanel" aria-labelledby="headingEstablecimiento3" data-parent="#accordionEstablecimientos">
                <div class="card-body">
                
					<!-- Grid Row -->
				  	<div class="row">
                        
				      <!--Grid column-->
				      <div class="col-md-12 col-lg-4 mb-4">
				        <!--Card-->
				        <div class="card" style="border-width: 0px !important">
				
				          <!--Card image-->
				          <div class="view overlay pt-2">
				            <img src='<spring:url value="/static/imagenes/libreriaweb.jpg" />' class="img-fluid mx-auto d-block" alt="LibreríaWeb">
				            <a>
				              <div class="mask rgba-white-slight waves-effect waves-light"></div>
				            </a>
				          </div>
				          <!--/.Card image-->
				
				          <!--Card content-->
				          <div class="card-body">
				            <!--Title-->
				            <h4 class="card-title"><strong>LibreríaWeb</strong></h4>
				            <hr>
				            <!--Text-->
				        	<p style="font-size: 1rem">En nuestra librería podrás encontrar todos tus libros. Si no encuentras un libro en particular no te preocupes, lo buscaremos por tí.</p>

				        	<a class="btn btn-orange btn-sm btn-rounded mx-0" data-toggle="modal" data-target="#centralModalLibreria"><em class="fas fa-star fa-lg pr-2"></em>Programa de puntos</a>
				        				       	   
				        	&nbsp;
				        	<a href='https://www.golemdr.es/libreriaweb-public/' target="_blank" type="button" class="btn btn-danger btn-sm btn-rounded mx-0"><em class="fas fa-globe fa-lg pr-2"></em>Web</a>



				          </div>
				          <!--/.Card content-->
				
				        </div>
				        <!--/.Card-->
				
				      </div>
				      <!--Grid column-->
				
				      <!--Grid column-->
				      <div class="col-md-12 col-lg-4 mb-4">
				        <!--Card-->
				        <div class="card" style="border-width: 0px !important">
				
				          <!--Card image-->
				          <div class="view overlay pt-2">
				            <img src='<spring:url value="/static/imagenes/libros-libres.jpg" />' class="img-fluid mx-auto d-block" alt="Libros Libres">
				            <a>
				              <div class="mask rgba-white-slight waves-effect waves-light"></div>
				            </a>
				          </div>
				          <!--/.Card image-->
				
				          <!--Card content-->
				          <div class="card-body">
				            <!--Title-->
				            <h4 class="card-title"><strong>Libros Libres</strong></h4>
				            <hr>
				            <!--Text-->
				        	<p style="font-size: 1rem">Los libros nos enseñan. A través de sus páginas viajamos a nuevos mundos, nuevas realidades que nos hacen soñar. Debemos soñar en libertad.</p>

				        	<a class="btn btn-orange btn-sm btn-rounded mx-0" data-toggle="modal" data-target="#centralModalEnObras"><em class="fas fa-star fa-lg pr-2"></em>Programa de puntos</a>
				        				       	   
				        	&nbsp;
				        	<a type="button" class="btn btn-danger btn-sm btn-rounded mx-0" data-toggle="modal" data-target="#centralModalEnObras"><em class="fas fa-globe fa-lg pr-2"></em>Web</a>



				          </div>
				          <!--/.Card content-->
				
				        </div>
				        <!--/.Card-->
				
				      </div>
				      <!--Grid column-->
				      
				      				
				      <!--Grid column-->
				      <div class="col-md-12 col-lg-4 mb-4">
				        <!--Card-->
				        <div class="card" style="border-width: 0px !important">
				
				          <!--Card image-->
				          <div class="view overlay pt-2">
				            <img src='<spring:url value="/static/imagenes/libreria-natural.jpg" />' class="img-fluid mx-auto d-block" alt="Librería de Montaña">
				            <a>
				              <div class="mask rgba-white-slight waves-effect waves-light"></div>
				            </a>
				          </div>
				          <!--/.Card image-->
				
				          <!--Card content-->
				          <div class="card-body">
				            <!--Title-->
				            <h4 class="card-title"><strong>Librería de Montaña</strong></h4>
				            <hr>
				            <!--Text-->
				        	<p style="font-size: 1rem">Si eres un amante de la naturaleza y te gustan los deportes de montaña, entonces nuestra librería encontrarás la mayor colección de libros especializados.</p>

				        	<a class="btn btn-orange btn-sm btn-rounded mx-0" data-toggle="modal" data-target="#centralModalEnObras"><em class="fas fa-star fa-lg pr-2"></em>Programa de puntos</a>
				        				       	   
				        	&nbsp;
				        	<a type="button" class="btn btn-danger btn-sm btn-rounded mx-0" data-toggle="modal" data-target="#centralModalEnObras"><em class="fas fa-globe fa-lg pr-2"></em>Web</a>



				          </div>
				          <!--/.Card content-->
				
				        </div>
				        <!--/.Card-->
				
				      </div>
				      <!--Grid column-->
				
				
				    </div>
					<!-- /.Grid Row -->
					
                </div>
            </div>

        </div>
        <!-- Accordion card -->

        <!-- Accordion card -->
        <div class="card">

            <!-- Card header -->
            <div class="card-header" role="tab" id="headingEstablecimiento1">
                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEstablecimientos" href="#collapseEstablecimiento1" aria-expanded="false" aria-controls="collapseEstablecimiento1">
                    <h5 class="mb-0">
                        <span style="color: #e94647; font-size: 1.8rem; font-weight: 600"><em class="fas fa-beer pr-2"></em>Cervecerías<i class="fas fa-angle-down rotate-icon"></i></span>
                    </h5>
                </a>
            </div>

            <!-- Card body -->
            <div id="collapseEstablecimiento1" class="collapse" role="tabpanel" aria-labelledby="headingEstablecimiento1" data-parent="#accordionEstablecimientos">
                <div class="card-body">



					<!-- Grid Row -->
				  	<div class="row">
				
				      <!--Grid column-->
				      <div class="col-md-12 col-lg-4 mb-4">
				        <!--Card-->
				        <div class="card" style="border-width: 0px !important">
				
				          <!--Card image-->
				          <div class="view overlay pt-2">
				            <img src='<spring:url value="/static/imagenes/cerveweb.jpg" />' class="img-fluid mx-auto d-block" alt="Cerveweb">
				            <a>
				              <div class="mask rgba-white-slight waves-effect waves-light"></div>
				            </a>
				          </div>
				          <!--/.Card image-->
				
				          <!--Card content-->
				          <div class="card-body">
				            <!--Title-->
				            <h4 class="card-title"><strong>Cerveweb</strong></h4>
				            <hr>
				            <!--Text-->
				        	<p>Si quieres difrutar de un lugar donde charlar tranquilamente mientras te tomas las mejores cervezas de la zona, no dudes en pasarte por nuestro local. Puedes realizar la reserva de plazas en la web.</p>

                              <a class="btn btn-orange btn-sm btn-rounded mx-0" data-toggle="modal" data-target="#centralModalCerveceria"><em class="fas fa-star fa-lg pr-2"></em>Programa de puntos</a>
				        	&nbsp;				       	   
				        	<a href='https://www.golemdr.es/cerveweb/' target="_blank" type="button" class="btn btn-danger btn-sm btn-rounded mx-0"><em class="fas fa-globe fa-lg pr-2"></em>Web</a>


				          </div>
				          <!--/.Card content-->
				
				        </div>
				        <!--/.Card-->
				
				      </div>
				      <!--Grid column-->
				
				      <!--Grid column-->
				      <div class="col-md-12 col-lg-4 mb-4">
				        <!--Card-->
				        <div class="card" style="border-width: 0px !important">
				
				          <!--Card image-->
				          <div class="view overlay pt-2">
				            <img src='<spring:url value="/static/imagenes/cerveceria-artesanal.jpg" />' class="img-fluid mx-auto d-block" alt="Cervecería Artesana">
				            <a>
				              <div class="mask rgba-white-slight waves-effect waves-light"></div>
				            </a>
				          </div>
				          <!--/.Card image-->
				
				          <!--Card content-->
				          <div class="card-body">
				            <!--Title-->
				            <h4 class="card-title"><strong>Cervecería Artesanal</strong></h4>
				            <hr>
				            <!--Text-->
				        	<p>Elaboramos nuestra propia cerveza con tanto cariño que nos dá pena tener que venderla. Ayúdanos a seguir manteniendo nuestra pasión de artesanos, para que sigamos elaborando cervezas tan buenas.</p>

				        	<a class="btn btn-orange btn-sm btn-rounded mx-0" data-toggle="modal" data-target="#centralModalEnObras"><em class="fas fa-star fa-lg pr-2"></em>Programa de puntos</a>
				        				       	   
				        	&nbsp;
				        	<a type="button" class="btn btn-danger btn-sm btn-rounded mx-0" data-toggle="modal" data-target="#centralModalEnObras"><em class="fas fa-globe fa-lg pr-2"></em>Web</a>


				          </div>
				          <!--/.Card content-->
				
				        </div>
				        <!--/.Card-->
				
				      </div>
				      <!--Grid column-->
				
				
				    </div>
					<!-- /.Grid Row -->

                </div>
            </div>

        </div>
        <!-- Accordion card -->

        <!-- Accordion card -->
        <div class="card">

            <!-- Card header -->
            <div class="card-header" role="tab" id="headingEstablecimiento2">
                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEstablecimientos" href="#collapseEstablecimiento2" aria-expanded="false" aria-controls="collapseEstablecimiento2">
                    <h5 class="mb-0">
                        <span style="color: #e94647; font-size: 1.8rem; font-weight: 600"><em class="fas fa-briefcase-medical pr-2"></em>Salud<i class="fas fa-angle-down rotate-icon"></i></span>
                    </h5>
                </a>
            </div>

            <!-- Card body -->
            <div id="collapseEstablecimiento2" class="collapse" role="tabpanel" aria-labelledby="headingEstablecimiento2" data-parent="#accordionEstablecimientos">
                <div class="card-body">
					<!-- Grid Row -->
				  	<div class="row">
				
				      <!--Grid column-->
				      <div class="col-md-12 col-lg-4 mb-4">
				        <!--Card-->
				        <div class="card" style="border-width: 0px !important">
				
				          <!--Card image-->
				          <div class="view overlay pt-2">
				            <img src='<spring:url value="/static/imagenes/centromedico.jpg" />' class="img-fluid mx-auto d-block" alt="Centro Médico">
				            <a>
				              <div class="mask rgba-white-slight waves-effect waves-light"></div>
				            </a>
				          </div>
				          <!--/.Card image-->
				
				          <!--Card content-->
				          <div class="card-body">
				            <!--Title-->
				            <h4 class="card-title"><strong>Centro Médico</strong></h4>
				            <hr>
				            <!--Text-->
				        	<p>¿Necesitas renovar tu carnet de conducir? O quizás estés necesitas atención médica o psicológica. No lo dudes más y ven a visitarnos. Contamos con grandes profesionales.</p>

                              <a class="btn btn-orange btn-sm btn-rounded mx-0" data-toggle="modal" data-target="#centralModalCentroMedico"><em class="fas fa-star fa-lg pr-2"></em>Programa de puntos</a>
				        	&nbsp;				       	   
				        	<a href='https://www.golemdr.es/centromedico/' target="_blank" type="button" class="btn btn-danger btn-sm btn-rounded mx-0"><em class="fas fa-globe fa-lg pr-2"></em>Web</a>


				          </div>
				          <!--/.Card content-->
				
				        </div>
				        <!--/.Card-->
				
				      </div>
				      <!--Grid column-->
				
<!-- 				      Grid column -->
<!-- 				      <div class="col-md-12 col-lg-4 mb-4"> -->
				
<!-- 				        Card -->
<!-- 				        <div class="card"> -->
				
<!-- 				          Card image -->
<!-- 				          <div class="view overlay"> -->
<!-- 				            <img src="https://mdbootstrap.com/img/Photos/Horizontal/Architecture/4-col/img%20(3).jpg" class="card-img-top" alt=""> -->
<!-- 				            <a> -->
<!-- 				              <div class="mask rgba-white-slight waves-effect waves-light"></div> -->
<!-- 				            </a> -->
<!-- 				          </div> -->
<!-- 				          /.Card image -->
				
<!-- 				          Card content -->
<!-- 				          <div class="card-body"> -->
<!-- 				            Title -->
<!-- 				            <h4 class="card-title"><strong>Card title</strong></h4> -->
<!-- 				            <hr> -->
<!-- 				            Text -->
<!-- 				            <p class="card-text mb-3">Some quick example text to build on the card title and make up the bulk -->
<!-- 				              of the card's -->
<!-- 				              content. -->
<!-- 				            </p> -->

<!-- 				          </div> -->
<!-- 				          /.Card content -->
				
<!-- 				        </div> -->
<!-- 				        /.Card -->
<!-- 				      </div> -->
<!-- 				      Grid column -->
				
<!-- 				      Grid column -->
<!-- 				      <div class="col-md-12 col-lg-4 mb-4"> -->
				
<!-- 				        Card -->
<!-- 				        <div class="card"> -->
				
<!-- 				          Card image -->
<!-- 				          <div class="view overlay"> -->
<!-- 				            <img src="https://mdbootstrap.com/img/Photos/Horizontal/Architecture/4-col/img%20(3).jpg" class="card-img-top" alt=""> -->
<!-- 				            <a> -->
<!-- 				              <div class="mask rgba-white-slight waves-effect waves-light"></div> -->
<!-- 				            </a> -->
<!-- 				          </div> -->
<!-- 				          /.Card image -->
				
<!-- 				          Card content -->
<!-- 				          <div class="card-body"> -->
<!-- 				            Title -->
<!-- 				            <h4 class="card-title"><strong>Card title</strong></h4> -->
<!-- 				            <hr> -->
<!-- 				            Text -->
<!-- 				            <p class="card-text mb-3">Some quick example text to build on the card title and make up the bulk -->
<!-- 				              of the card's -->
<!-- 				              content. -->
<!-- 				            </p> -->
<!-- 				          </div> -->
<!-- 				          /.Card content -->
				
<!-- 				        </div> -->
<!-- 				        /.Card -->
<!-- 				      </div> -->
<!-- 				      Grid column -->
				
				
				    </div>
					<!-- /.Grid Row -->
                </div>
            </div>

        </div>
        <!-- Accordion card -->
    </div>
    <!-- Accordion wrapper -->
    <!--/ .ACORDEON ESTABLECIMIENTOS -->

  </section>
</div>

<br><br>
