package es.golemdr.prefieromizona.service;


import java.net.URI;
import java.util.Arrays;
import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import es.golemdr.prefieromizona.domain.Canje;
import es.golemdr.prefieromizona.ext.utils.paginacion.PaginacionBean;
import es.golemdr.prefieromizona.ext.Constantes;

@Service
public class CanjesService extends BaseService{



		public List<Canje> getCanjes(PaginacionBean paginacion) {

			HttpEntity<String> entity =  buildHeaders(paginacion);

			ResponseEntity<Canje[]> response = restTemplate.exchange(SERVER + ":" + PORT + "/canjes/paginado", HttpMethod.GET,entity, Canje[].class);

			Canje[] canjes = response.getBody();

			String total=  response.getHeaders().getFirst(Constantes.PAGINACION_TOTAL);
			paginacion.setTotalRegistros(Integer.valueOf(total));

			return Arrays.asList(canjes);

		}



		public URI insertarCanje(Canje canje) {

			return restTemplate.postForLocation(SERVER + ":" + PORT + "/canjes", canje);
		}


		public Canje getById(Long idCanje) {

			return restTemplate.getForObject(SERVER + ":" + PORT + "/canjes/" + idCanje.toString(), Canje.class);

		}

		public void actualizarCanje(Canje canje) {

			restTemplate.put(SERVER + ":" + PORT + "/canjes", canje);

		}


		public void borrarCanje(Long idCanje) {

			restTemplate.delete(SERVER + ":" + PORT + "/canjes/" + idCanje.toString());

		}


}

