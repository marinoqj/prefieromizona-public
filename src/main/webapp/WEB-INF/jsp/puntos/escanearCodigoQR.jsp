
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
	<input type="hidden" name="numPuntos" id="numPuntos" value="${numPuntos}"/>
	<input type="hidden" name="datosQR" id="datosQR"/>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>


<br>
<br>
<br>
<br>
<br>


<main id="bloque-qr" class="default-content" aria-label="Content" style="min-height: 100%">
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

<script>
    $( document ).ready(function() {
        $('body').attr('data-instant-allow-query-string');
        $('body').attr('data-instant-allow-external-links');
    });
</script>

<br><br><br><br><br>
</body>