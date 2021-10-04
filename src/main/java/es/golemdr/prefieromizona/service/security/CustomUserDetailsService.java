package es.golemdr.prefieromizona.service.security;




import java.text.MessageFormat;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import es.golemdr.prefieromizona.domain.Usuario;
import es.golemdr.prefieromizona.ext.Constantes;
import es.golemdr.prefieromizona.service.BaseService;


@Service
public class CustomUserDetailsService extends BaseService implements UserDetailsService {
	
	
	private static final Logger log = LogManager.getLogger(CustomUserDetailsService.class);
	
	
	@Override
	public UserDetails loadUserByUsername(String login)
			throws UsernameNotFoundException {

		
		Usuario usuario = null;
		UserDetails securityUser = null;
		
//		try {
			
			//usuario = restTemplate.getForObject(SERVER + ":" + PORT + "/usuarios/" + login, Usuario.class);
			
			if(!login.equals("a")) {
				throw new UsernameNotFoundException("Usuario incorrecto");
			}
			
			usuario = new Usuario();
			usuario.setIdUsuario(1L);
			usuario.setLogin("a");
			usuario.setPassword("1");
			usuario.setRolesUsuario(new String[] {"CLIENTE"});
			
			securityUser = User.withUsername(login).password(new BCryptPasswordEncoder().encode(usuario.getPassword())).roles(usuario.getRolesUsuario()).build();
			
//		}catch (Exception e) {
//			
//			log.error(MessageFormat.format(Constantes.PREFIJO_MENSAJE_ERROR,e.getMessage()));
//		}
		

		return securityUser;

	}
		

}

