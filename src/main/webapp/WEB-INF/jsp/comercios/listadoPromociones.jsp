<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>


<br>
<br>
<br>
<br>
<br>

<style>
    .fecha {
        width: 80px;
    }
</style>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active"><em class="fas fa-list-alt fa-lg mr-1"></em><em
                            class="fas fa-shopping-bag fa-lg mr-2"></em>
                        Listado de Promociones
                    </li>
                </ol>
            </nav>
        </div>
    </div>

    <br>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <thead class="blue lighten-4">
                <tr class="bg-light">
                    <th scope="col"><div class="fecha">Fecha</div></th>
                    <th scope="col">Texto Promoción</th>
                    <th scope="col">Enviado a:</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><div class="fecha">29-10-2021</div></td>
                    <td>Celebra Halloween con nosotros. Habrá sorteos y regalos para todos los asistentes. Además te llevarás 2 puntos.</td>
                    <td>
                        <div class="row">
                            <div class="col"><h6><span class="badge badge-pill badge-secondary">Todos</span></h6></div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><div class="fecha">01-10-2021</div></td>
                    <td>El primer fin de semana de Octubre multiplica tus puntos x2</td>
                   <td>
                        <div class="row">
                            <div class="col"><h6><span class="badge badge-pill badge-info">Clientes poco frecuentes</span></h6></div>
                        </div>
                        <div class="row">
                            <div class="col"><h6><span class="badge badge-pill badge-info">Clientes de una sola vez</span></h6></div>
                        </div>

                    </td>
               </tr>
                <tr>
                    <td><div class="fecha">10-09-2021</div></td>
                    <td>¡¡Comienza un nuevo curso con alegría!! Vuelve a la rutina con nuestra fiesta de inaguración del nuevo curso. Habrá regalos y sorpresas.</td>
                    <td>
                        <div class="row">
                            <div class="col"><h6><span class="badge badge-pill badge-secondary">Todos</span></h6></div>
                        </div>                    
                    </td>
                </tr>
                <tr>
                    <td><div class="fecha">21-06-2021</div></td>
                    <td>Fiesta de Verano. Celebra la llegada del verano y pasa a conocernos. Te invitamos a una bebida fresquita.</td>
                    <td>
                        <div class="row">
                            <div class="col"><h6><span class="badge badge-pill badge-secondary">Todos</span></h6></div>
                        </div>                    
                    </td>
                </tr>   
                <tr>
                    <td><div class="fecha">01-06-2021</div></td>
                    <td>¡¡Gracias por tu fidelidad!! Sin tí no estaríamos aquí. Pásate por nuestro local y recibirás 3 puntos. Además tenemos una sorpresa reservada para tí ;)</td>
                   <td>
                        <div class="row">
                            <div class="col"><h6><span class="badge badge-pill badge-success">Mejores Clientes</span></h6></div>
                        </div>
                        <div class="row">
                            <div class="col"><h6><span class="badge badge-pill badge-success">Clientes habituales</span></h6></div>
                        </div>

                    </td>
               </tr>                
                             
                </tbody>
            </table>
        </div>


    </div>

    <div class="row">
        <div class="col">
            <button type="button" class="btn btn-success btn-rounded btn-sm"><i class="fas fa-search pr-2"></i>Buscar</button>
        </div>
    </div>


</div>
<!-- FIN CONTAINER -->
<br><br>

