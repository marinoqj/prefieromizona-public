package es.golemdr.prefieromizona.service;


import java.io.IOException;
import java.net.URI;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.zxing.WriterException;

import es.golemdr.prefieromizona.utils.QRCodeUtils;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import es.golemdr.prefieromizona.domain.Punto;
import es.golemdr.prefieromizona.domain.QRData;
import es.golemdr.prefieromizona.ext.utils.paginacion.PaginacionBean;
import es.golemdr.prefieromizona.ext.Constantes;

@Service
public class PuntosService extends BaseService{



		public List<Punto> getPuntos(PaginacionBean paginacion) {

			HttpEntity<String> entity =  buildHeaders(paginacion);

			ResponseEntity<Punto[]> response = restTemplate.exchange(SERVER + ":" + PORT + "/puntos/paginado", HttpMethod.GET,entity, Punto[].class);

			Punto[] puntos = response.getBody();

			String total=  response.getHeaders().getFirst(Constantes.PAGINACION_TOTAL);
			paginacion.setTotalRegistros(Integer.valueOf(total));

			return Arrays.asList(puntos);

		}
		
		public List<Punto> getPuntosCliente(PaginacionBean paginacion, Long idCliente) {

			HttpEntity<String> entity =  buildHeaders(paginacion);

			ResponseEntity<Punto[]> response = restTemplate.exchange(SERVER + ":" + PORT + "/puntos/cliente/" + idCliente , HttpMethod.GET,entity, Punto[].class);

			Punto[] puntos = response.getBody();

			String total=  response.getHeaders().getFirst(Constantes.PAGINACION_TOTAL);
			paginacion.setTotalRegistros(Integer.valueOf(total));

			return Arrays.asList(puntos);

		}		



		public URI insertarPunto(Punto punto) {

			return restTemplate.postForLocation(SERVER + ":" + PORT + "/puntos", punto);
		}


		public Punto getById(Long idPunto) {

			return restTemplate.getForObject(SERVER + ":" + PORT + "/puntos/" + idPunto.toString(), Punto.class);

		}

		public void actualizarPunto(Punto punto) {

			restTemplate.put(SERVER + ":" + PORT + "/puntos", punto);

		}


		public void borrarPunto(Long idPunto) {

			restTemplate.delete(SERVER + ":" + PORT + "/puntos/" + idPunto.toString());

		}
		
		public List<String> getPuntosClienteQR(List<Punto> infoPuntos) throws WriterException, IOException {
			List<String> resultado = new ArrayList<>();
			
			// Hora en milisegundos (Timestamp)
			long time = ZonedDateTime.now().toInstant().toEpochMilli();
			
			QRData qrData;
			ObjectMapper mapper = new ObjectMapper();
			String dataQRCode;
			String qrBase64;
			for(Punto punto : infoPuntos) {
				qrData = new QRData();
				qrData.setCodComercio(punto.getComercio().getCodComercio());
				qrData.setCodCliente(punto.getCliente().getCodCliente());
				qrData.setCantPuntos(Long.valueOf(punto.getTotal()).intValue());
				qrData.setTime(time);


				dataQRCode= mapper.writeValueAsString(qrData);
				qrBase64 = QRCodeUtils.generateQRCodeBase64(dataQRCode);

				resultado.add(qrBase64);
			}
			

			
			return resultado;
		}


}

