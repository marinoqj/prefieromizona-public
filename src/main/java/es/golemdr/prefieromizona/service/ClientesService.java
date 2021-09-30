package es.golemdr.prefieromizona.service;

import java.net.URI;
import java.text.MessageFormat;
import java.util.Arrays;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import es.golemdr.prefieromizona.domain.Cliente;
import es.golemdr.prefieromizona.ext.Constantes;
import es.golemdr.prefieromizona.ext.utils.paginacion.PaginacionBean;

@Service
public class ClientesService extends BaseService{


		private static Logger log = LogManager.getLogger(ClientesService.class);
		
	
		public List<Cliente> getClientesPaginados(PaginacionBean paginacion) {
	
			HttpEntity<String> entity =  buildHeaders(paginacion);
	
			ResponseEntity<Cliente[]> response = restTemplate.exchange(SERVER + ":" + PORT + "/clientes/paginado", HttpMethod.GET,entity, Cliente[].class);
	
			Cliente[] clientes = response.getBody();
	
			String total=  response.getHeaders().getFirst(Constantes.PAGINACION_TOTAL);
			paginacion.setTotalRegistros(Integer.valueOf(total));
	
			return Arrays.asList(clientes);
	
		}
	
	
	
		public URI insertarCliente(Cliente cliente) {
	
			return restTemplate.postForLocation(SERVER + ":" + PORT + "/clientes", cliente);
		}
	
	
		public Cliente getById(Long idCliente) {
	
			return restTemplate.getForObject(SERVER + ":" + PORT + "/clientes/" + idCliente.toString(), Cliente.class);
	
		}
	
		public void actualizarCliente(Cliente cliente) {
	
			restTemplate.put(SERVER + ":" + PORT + "/clientes", cliente);
	
		}
	
	
		public void borrarCliente(Long idCliente) {
	
			restTemplate.delete(SERVER + ":" + PORT + "/clientes/" + idCliente.toString());
	
		}
		
		
		public Cliente findByCodCliente(String codCliente){
			
			Cliente resultado = null;
			
			try {
				
				resultado = restTemplate.getForObject(SERVER + ":" + PORT + "/clientes/buscar/" + codCliente, Cliente.class);
				
			}catch (Exception e) {
				
				log.error(MessageFormat.format(Constantes.PREFIJO_MENSAJE_ERROR,e.getMessage()));
			}
			
			return resultado;
	
		}



}

