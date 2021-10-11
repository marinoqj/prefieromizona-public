package es.golemdr.prefieromizona.service;


import java.net.URI;
import java.util.Arrays;
import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import es.golemdr.prefieromizona.domain.Punto;
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


}

