<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>

<div class="container my-5 py">



  <!--Section: Block Content-->
<section>

<br>
<br>
<br>

<div class="row">
    <div class="col-lg-6">
        <div class="card mb-4">
            <div class="card-body">
                <h5 class="card-title">Puntos emitidos
                	<em class="fas fa-question-circle fa-sm text-primary pl-2" 
                		style="cursor: pointer"
                		data-toggle="popover" 
                		title="Mayor actividad" 
                		data-content="La cantidad de puntos emitidos en diferentes tramos horarios nos indica los preiodos de máxima actividad.">
                	</em>                
                </h5>
                <em>Día y franja horaria</em><br><br>
                <div class="grah-container">
                	<canvas id="grafica-contratos" width="800" height="300"></canvas>
                </div>
                <p class="leyenda text-center">
                		<em class="fas fa-circle verde-lima mr-2"></em>9 a 12h
                		<em class="fas fa-circle verde mx-2"></em>12 a 15h
                		<em class="fas fa-circle turquesa mx-2"></em>15 a 18h
                		<em class="fas fa-circle azul-oscuro mx-2"></em>18 a 20h
                </p>
            </div> 
            <div class="card-footer small text-muted"><em class="fas fa-history mr-2"></em>Actualizado el 05/11/2021</div>          
        </div>
    </div>
    
    <div class="col-lg-6">
        <div class="card mb-4">
            <div class="card-body">
                <h5 class="card-title">Puntos emitidos y canjeados
                	<em class="fas fa-question-circle fa-sm text-primary pl-2" 
                		style="cursor: pointer"
                		data-toggle="popover" 
                		title="Tasa de Canje" 
                		data-content="La relación entre puntos emitidos y canjeados indica si el programa de fidelización funciona o no.">
                	</em>
                </h5>
                <em>&Uacute;ltimos 4 meses</em><br><br>
                <div class="graph-container">
                	<canvas id="graph-bar-usuarios"  width="800" height="480"></canvas>
                </div>
                <p class="leyenda text-center">
              		<em class="fas fa-square verde-lima mr-2"></em>Puntos Emitidos
              		<em class="fas fa-square azul-oscuro mx-2"></em>Puntos Canjeados
                </p>
            </div>
            <div class="card-footer small text-muted"><em class="fas fa-history mr-2"></em>Actualizado ayer a las 11:59 PM</div>            
        </div>
    </div>

</div>

  </section>
  <!--Section: Block Content-->


</div>

<script type="text/javascript" src='<spring:url value="/static/js/Chart.min.js"/>'></script>
<script>
	
//***************************************** Puntos Emitidos-canjeados (4 meses) **********************************************
    new Chart(document.getElementById("graph-bar-usuarios"), {
        type: 'bar',
        data: {
          labels: ["Oct", "Nov", "Dic", "Ene"],
          datasets: [{
              label: "Emitidos",
              type: "line",
              borderColor: "#45c490",
              data: [280,320,400,500],
              fill: false
            }, {
              label: "Consumidos",
              type: "line",
              borderColor: "#008d93",
              data: [230,260,300,400],
              fill: false
            }, {
              label: "Emitidos",
              type: "bar",
              backgroundColor: "rgb(202, 242, 112)",
              data: [280,320,400,500],
            }, {
              label: "Consumidos",
              type: "bar",
              backgroundColor: "rgb(46, 84, 104)",
              backgroundColorHover: "#3e95cd",
              data: [230,260,300,400],
            }
          ]
        },
        options: {
          title: {
            display: false,
            text: 'Puntos emitidos y canjeados'
          },
          legend: { display: false }
        }
    });  
    
 
 
 	
    // ********************************** Puntos emitidos (día y franja) *****************************
    
    var myChart = new Chart(document.getElementById("grafica-contratos").getContext('2d'), {
        type: 'bar',
        data: {
            labels: ["Lun", "Mar", "Mie", "Jue", "Vie", "Sab", "Dom"],
            datasets: [{
                label: '9 a 12h',
                backgroundColor: "#caf270",
                data: [38, 24, 5, 56, 58, 12, 59],
            }, {
                label: '12 a 15h',
                backgroundColor: "#45c490",
                data: [12, 59, 15, 48, 30, 25, 45],
            }, {
                label: '15 a 18h',
                backgroundColor: "#008d93",
                data: [40, 30, 54, 25, 15, 42, 30],
            }, {
                label: '18 a 20h',
                backgroundColor: "#2e5468",
                data: [24, 12, 30, 30, 40, 10, 15],
            }],
        },
        options: {
            tooltips: {
                displayColors: true,
                callbacks: {
                    mode: 'x',
                },
            },
            scales: {
                xAxes: [{
                    stacked: true,
                    gridLines: {
                        display: false,
                    }
                }],
                yAxes: [{
                    stacked: true,
                    ticks: {
                        beginAtZero: true,
                    },
                    type: 'linear',
                }]
            },
            responsive: true,
            maintainAspectRatio: false,
            legend: {
            	display: false,
                position: 'bottom'
            },
        }
    });	
    
 	// popovers Initialization
    $(function () {
    	$('[data-toggle="popover"]').popover({ trigger: "hover" });
    })

</script>
