
<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>


<script>

<c:set var="function" value="canjear"/>
<c:if test='${roleUser ne "COMERCIO"}'>
    <c:set var="function" value="guardar"/>
</c:if>

function ${function}Puntos(data){
    $('#datosQR').val(data);
    document.formulario.action="${function}Puntos.do";
    document.formulario.submit();
}


</script>

<form name="formulario" method="post">
	<input type="hidden" name="numPuntos" id="numPuntos"/>
	<input type="hidden" name="datosQR" id="datosQR"/>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>


<br>
<br>

<c:if test='${roleUser ne "COMERCIO"}'>
    <br>
    <br>
    <br>
</c:if>


<c:if test='${roleUser eq "COMERCIO"}'>
<div class="container">
    <!-- Horizontal Steppers -->
    <div class="row">
        <div class="col-md-12">

            <!-- Stepers Wrapper -->
            <ul class="stepper stepper-horizontal">

                <!-- First Step -->
                <li class="completed" id="first-stepper">
                    <a href='<spring:url value="/verEscanearCodigo.do"/>'>
                        <span class="circle">1</span>
                        <span class="label">Introduzca cantidad puntos</span>
                    </a>
                </li>

                <!-- Second Step -->
                <li id="second-stepper">
                    <a href="#!">
                        <span class="circle">2</span>
                        <span class="label">Escanear código QR</span>
                    </a>
                </li>

            </ul>
            <!-- /.Stepers Wrapper -->

        </div>
    </div>
    <!-- /.Horizontal Steppers -->
</div>
</c:if>


<main id="bloque-qr" class="default-content ${roleUser eq 'COMERCIO'?'ocultar':''}" aria-label="Content" style="min-height: 100%">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper-content">
                    <link rel="canonical" href="https://blog.minhazav.dev/research/html5-qrcode"/>
                    <style>
                        #reader {
                            width: 640px;
                        }
                        @media(max-width: 600px) {
                            #reader {
                                width: 300px;
                            }
                        }
                        .empty {
                            display: block;
                            width: 100%;
                            height: 20px;
                        }
                        .alert {
                            padding: 15px;
                            margin-bottom: 20px;
                            border: 1px solid transparent;
                            border-radius: 4px;
                        }
                        .alert-info {
                            color: #31708f;
                            background-color: #d9edf7;
                            border-color: #bce8f1;
                        }
                        .alert-success {
                            color: #3c763d;
                            background-color: #dff0d8;
                            border-color: #d6e9c6;
                        }

                        a {
                            text-decoration: none !important;
                        }

                        button {
                            background-color: #0069d9; /* Primay Bootstrap */
                            border: 1px solid transparent;
                            border-radius: .25rem;
                            color: white;
                            text-align: center;
                            text-decoration: none;
                            display: inline-block;
                            font-weight: 400;
                            font-size: 1rem;
                            padding: .375rem .75rem;
                        }

                        select {
                            display: inline-block;
                            width: fit-content;
                            padding: .375rem .75rem;
                            font-size: 0.8rem;
                            line-height: 1.5;
                            color: #495057;
                            background-color: #fff;
                            background-clip: padding-box;
                            border: 1px solid #ced4da;
                            border-radius: .25rem;
                            transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
                        }

                        input[type="file"] {

                        }

                        #reader__dashboard_section_csr, #reader__dashboard_section_fsr {
                            padding-bottom: 25px;
                        }
                    </style>

                    <div class="container">
                        <div class="row">
                            <div class="col text-center text-secondary"><h3>QR Code scanner</h3></div>
                        </div>
                        <div class="row">
                            <div class="col-md-12" style="text-align: center;margin-bottom: 20px;">
                                <div id="reader" style="display: inline-block;"></div>
                                <div class="empty"></div>
                                <div id="scanned-result"></div>
                            </div>
                        </div>
                    </div>


                    <script src='<spring:url value="/static/js/highlight.min.js"/>'></script>
                    <script src='<spring:url value="/static/js/html5-qrcode.min.js"/>'></script>
                    <script>
                        // REFERENCIAS:
                        // https://blog.minhazav.dev/research/html5-qrcode
                        // https://github.com/mebjas/html5-qrcode#extra-optional-configuration-in-start-method

                        function docReady(fn) {
                            // see if DOM is already available
                            if (document.readyState === "complete" || document.readyState === "interactive") {
                                // call on next available tick
                                setTimeout(fn, 1);
                            } else {
                                document.addEventListener("DOMContentLoaded", fn);
                            }
                        }

                        docReady(function() {
                            hljs.initHighlightingOnLoad();
                            var lastCode;
                            function onScanSuccess(decodedText, decodedResult) {

                                // lastCode almacena el último código escaneado. Sirve para evitar hacer doble submit
                                // y también para evitar escanear dos veces el mismo código QR
                                if (lastCode !== decodedText) {
                                    lastCode = decodedText;
                                    ${function}Puntos(decodedText);
                                }
                            	
                            }
                            let html5QrcodeScanner = new Html5QrcodeScanner(
                                "reader",
                                {
                                    fps: 10,
                                    qrbox: 250,
                                    // Important notice: this is experimental feature, use it at your
                                    // own risk. See documentation in
                                    // mebjas@/html5-qrcode/src/experimental-features.ts
                                    experimentalFeatures: {
                                        useBarCodeDetectorIfSupported: true
                                    },
                                    rememberLastUsedCamera: true
                                });
                            html5QrcodeScanner.render(onScanSuccess);
                        });

                    </script>
                </div>
            </div>
        </div>
    </div>

</main>

<section class="${roleUser eq 'CLIENTE'?'ocultar':''}" id="teclado-puntos">
<script>
    function mostrarEscanear(numPuntos) {
        $('#numPuntos').val(numPuntos);
        $('#bloque-qr').toggleClass('ocultar');
        $('#teclado-puntos').toggleClass('ocultar');

        if (numPuntos == 0) {
            $('#first-stepper').addClass('completed');
            $('#second-stepper').removeClass('completed');
        } else {
            $('#first-stepper').removeClass('completed');
            $('#second-stepper').addClass('completed');
        }

        console.log('NumPuntos = ' + document.getElementById('numPuntos').value);

    }
</script>
<div class="container">
    <div class="row">
        <div class="col-md-4 text-center">
            <a href="javascript: mostrarEscanear(1)" title="Canjear 1 puntos">
                <img class="img-fluid" src='<spring:url value="/static/imagenes/1.png"/>' style="max-width: 200px">
            </a>
        </div>
        <div class="col-md-4 text-center">
            <a href="javascript: mostrarEscanear(2)" title="Canjear 2 puntos">
                <img class="img-fluid" src='<spring:url value="/static/imagenes/2.png"/>' style="max-width: 200px">
            </a>
        </div>
        <div class="col-md-4 text-center">
            <a href="javascript: mostrarEscanear(3)" title="Canjear 3 puntos">
                <img class="img-fluid" src='<spring:url value="/static/imagenes/3.png"/>' style="max-width: 200px">
            </a>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-md-4 text-center">
            <a href="javascript: mostrarEscanear(4)" title="Canjear 4 puntos">
                <img class="img-fluid" src='<spring:url value="/static/imagenes/4.png"/>' style="max-width: 200px">
            </a>
        </div>
        <div class="col-md-4 text-center">
            <a href="javascript: mostrarEscanear(5)" title="Canjear 5 puntos">
                <img class="img-fluid" src='<spring:url value="/static/imagenes/5.png"/>' style="max-width: 200px">
            </a>
        </div>
        <div class="col-md-4 text-center">
            <a href="javascript: mostrarEscanear(6)" title="Canjear 6 puntos">
                <img class="img-fluid" src='<spring:url value="/static/imagenes/6.png"/>' style="max-width: 200px">
            </a>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-md-4 text-center">
            <a href="javascript: mostrarEscanear(7)" title="Canjear 7 puntos">
                <img class="img-fluid" src='<spring:url value="/static/imagenes/7.png"/>' style="max-width: 200px">
            </a>
        </div>
        <div class="col-md-4 text-center">
            <a href="javascript: mostrarEscanear(8)" title="Canjear 8 puntos">
                <img class="img-fluid" src='<spring:url value="/static/imagenes/8.png"/>' style="max-width: 200px">
            </a>
        </div>
        <div class="col-md-4 text-center">
            <a href="javascript: mostrarEscanear(9)" title="Canjear 9 puntos">
                <img class="img-fluid" src='<spring:url value="/static/imagenes/9.png"/>' style="max-width: 200px">
            </a>
        </div>
    </div>
    <br><br><br><br><br>
</div>
</section>

<script>
    $( document ).ready(function() {
        $('body').attr('data-instant-allow-query-string');
        $('body').attr('data-instant-allow-external-links');
    });
</script>
      
</body>