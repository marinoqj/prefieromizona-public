<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>

		<br>
		<br>
		<br>
		<br>
		<br>
<!-- CONTAINER -->
<div class="container">


	<div class="row">
		<div class="col-md-12">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item active">
						<em class="fas fa-bell fa-lg pr-2"></em>Notificaciones
					</li>
				</ol>
			</nav>
		</div>
	</div>

<%--<br>--%>
<%--  <div class="row">--%>
<%--    <div class="col blue-text">--%>
<%--      <i class="fas fa-trash-alt pr-2"></i><i class="far fa-eye pr-2"></i><i class="fas fa-filter"></i>--%>
<%--    </div>--%>
<%--  </div>--%>



<br>

  <div class="row">
    <div class="col">
      <!-- Table  -->
      <table class="table">
        <!-- Table head -->
        <thead class="thead-light">
        <tr>
          <th>
            <!-- Default unchecked -->
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="tableDefaultCheck1">
              <label class="custom-control-label" for="tableDefaultCheck2"> </label>
            </div>
          </th>
          <th><span class="font-weight-bold">Remitente</span></th>
          <th><span class="font-weight-bold">Asunto</span></th>
          <th><span class="font-weight-bold">Fecha</span></th>
        </tr>
        </thead>
        <!-- Table head -->

        <!-- Table body -->
        <tbody>
        <tr style="background-color: #f6f6f6">
          <th scope="row">
            <!-- Default unchecked -->
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="tableDefaultCheck2">
              <label class="custom-control-label" for="tableDefaultCheck2"> </label>
            </div>
          </th>
          <td>Librería de la Luz</td>
          <td>¡¡Esta semana nos hemos vuelto locos!!! Por cada punto que obtengas te regalamos otro</td>
          <td>12:30</td>
        </tr>
        <tr style="background-color: #f6f6f6">
          <th scope="row">
            <!-- Default unchecked -->
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="tableDefaultCheck3">
              <label class="custom-control-label" for="tableDefaultCheck3"> </label>
            </div>
          </th>
          <td>CerveWeb</td>
          <td>Te echamos de menos. Pásate por nuestro local y retira tu regalo sorpresa</td>
          <td>18 Oct</td>
        </tr>
        <tr>
          <th scope="row">
            <!-- Default unchecked -->
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="tableDefaultCheck4">
              <label class="custom-control-label" for="tableDefaultCheck4"> </label>
            </div>
          </th>
          <td><span class="font-weight-bold">Librería de la Luz</span></td>
          <td><span class="font-weight-bold">Semana de la Novela Negra. ¡¡Los libros de este género conceden el doble de puntos!!</span></td>
          <td><span class="font-weight-bold">20 Sept</span></td>
        </tr>
        <tr style="background-color: #f6f6f6">
          <th scope="row">
            <!-- Default unchecked -->
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="tableDefaultCheck2">
              <label class="custom-control-label" for="tableDefaultCheck2"> </label>
            </div>
          </th>
          <td>Librería de la Luz</td>
          <td>Chssss...Al comprar un cuento infantil te regalamos tres puntos.</td>
          <td>16 Ago</td>
        </tr>
        <tr>
          <th scope="row">
            <!-- Default unchecked -->
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="tableDefaultCheck4">
              <label class="custom-control-label" for="tableDefaultCheck4"> </label>
            </div>
          </th>
          <td><span class="font-weight-bold">Centro Médico</span></td>
          <td><span class="font-weight-bold">¿Cuanto hace que no te realizas una revisión? 2x1 en puntos de revisiones médicas</span></td>
          <td><span class="font-weight-bold">18 Ago</span></td>
        </tr>

        </tbody>
        <!-- Table body -->
      </table>
      <!-- Table  -->
    </div>
  </div>

	


<nav aria-label="Page navigation example">
  <ul class="pagination pg-blue justify-content-end">
    <li class="page-item disabled">
      <a class="page-link" tabindex="-1">Anterior</a>
    </li>
    <li class="page-item active"><a class="page-link">1</a></li>
    <li class="page-item"><a class="page-link">2</a></li>
    <li class="page-item"><a class="page-link">3</a></li>
    <li class="page-item">
      <a class="page-link">Siguiente</a>
    </li>
  </ul>
</nav>

	
</div><!-- ./container -->
