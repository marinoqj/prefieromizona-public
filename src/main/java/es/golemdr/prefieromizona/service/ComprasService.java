package es.golemdr.prefieromizona.service;


import java.net.URI;
import java.util.Arrays;
import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import es.golemdr.prefieromizona.domain.Compra;
import es.golemdr.prefieromizona.ext.Constantes;
import es.golemdr.prefieromizona.ext.utils.paginacion.PaginacionBean;

@Service
public class ComprasService extends BaseService{



		public List<Compra> getComprasPaginado(PaginacionBean paginacion) {

			HttpEntity<String> entity =  buildHeaders(paginacion);

			ResponseEntity<Compra[]> response = restTemplate.exchange(SERVER + ":" + PORT + "/compras/paginado", HttpMethod.GET,entity, Compra[].class);

			Compra[] compras = response.getBody();

			String total=  response.getHeaders().getFirst(Constantes.PAGINACION_TOTAL);
			paginacion.setTotalRegistros(Integer.valueOf(total));

			return Arrays.asList(compras);

		}
		
		
		public List<Compra> getCompras(PaginacionBean paginacion, Long idEntidad, String tipoEntidad) {

			HttpEntity<String> entity =  buildHeaders(paginacion);

			ResponseEntity<Compra[]> response = restTemplate.exchange(SERVER + ":" + PORT + "compras/" + tipoEntidad + "/" + idEntidad , HttpMethod.GET, entity, Compra[].class);

			Compra[] compras = response.getBody();

			String total=  response.getHeaders().getFirst(Constantes.PAGINACION_TOTAL);
			
			if (total == null) {
				total = "1";
			}
			
			paginacion.setTotalRegistros(Integer.valueOf(total));

			return Arrays.asList(compras);

		}			



		public URI insertarCompra(Compra compra) {

			return restTemplate.postForLocation(SERVER + ":" + PORT + "/compras", compra);
		}


		public Compra getById(Long idCompra) {

			return restTemplate.getForObject(SERVER + ":" + PORT + "/compras/" + idCompra.toString(), Compra.class);

		}

		public void actualizarCompra(Compra compra) {

			restTemplate.put(SERVER + ":" + PORT + "/compras", compra);

		}


		public void borrarCompra(Long idCompra) {

			restTemplate.delete(SERVER + ":" + PORT + "/compras/" + idCompra.toString());

		}



}

