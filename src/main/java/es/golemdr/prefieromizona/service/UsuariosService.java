package es.golemdr.prefieromizona.service;


import org.springframework.stereotype.Service;

import es.golemdr.prefieromizona.domain.Usuario;

@Service
public class UsuariosService extends BaseService{



		public Usuario getByLogin(String login) {

			return restTemplate.getForObject(SERVER + ":" + PORT + "/usuarios/" + login, Usuario.class);

		}



}

