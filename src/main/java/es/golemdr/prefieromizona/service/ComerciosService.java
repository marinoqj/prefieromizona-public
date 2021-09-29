package es.golemdr.prefieromizona.service;


import java.net.URI;
import java.util.Arrays;
import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import es.golemdr.prefieromizona.domain.Comercio;
import es.golemdr.prefieromizona.ext.Constantes;
import es.golemdr.prefieromizona.ext.utils.paginacion.PaginacionBean;

@Service
public class ComerciosService extends BaseService{



		public List<Comercio> getComerciosPaginados(PaginacionBean paginacion) {

			HttpEntity<String> entity =  buildHeaders(paginacion);

			ResponseEntity<Comercio[]> response = restTemplate.exchange(SERVER + ":" + PORT + "/comercios/paginado", HttpMethod.GET,entity, Comercio[].class);

			Comercio[] comercios = response.getBody();

			String total=  response.getHeaders().getFirst(Constantes.PAGINACION_TOTAL);
			paginacion.setTotalRegistros(Integer.valueOf(total));

			return Arrays.asList(comercios);

		}



		public URI insertarComercio(Comercio comercio) {

			return restTemplate.postForLocation(SERVER + ":" + PORT + "/comercios", comercio);
		}


		public Comercio getById(Long idComercio) {

			return restTemplate.getForObject(SERVER + ":" + PORT + "/comercios/" + idComercio.toString(), Comercio.class);

		}

		public void actualizarComercio(Comercio comercio) {

			restTemplate.put(SERVER + ":" + PORT + "/comercios", comercio);

		}


		public void borrarComercio(Long idComercio) {

			restTemplate.delete(SERVER + ":" + PORT + "/comercios/" + idComercio.toString());

		}



}

