package es.golemdr.prefieromizona.service.security;




import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import es.golemdr.prefieromizona.domain.Usuario;
import es.golemdr.prefieromizona.domain.Rol;
import es.golemdr.prefieromizona.ext.Constantes;
import es.golemdr.prefieromizona.service.BaseService;


@Service
public class CustomUserDetailsService extends BaseService implements UserDetailsService {
	
	
	private static final Logger log = LogManager.getLogger(CustomUserDetailsService.class);
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	@Override
	public UserDetails loadUserByUsername(String login)
			throws UsernameNotFoundException {

		
		Usuario usuario = null;
		UserDetails securityUser = null;
		
		try {
			
			usuario = restTemplate.getForObject(SERVER + ":" + PORT + "/usuarios/" + login, Usuario.class);
			
			if(usuario == null) {
				throw new UsernameNotFoundException("Usuario incorrecto");
			}
	
			
			

			List<String> roles = new ArrayList<>();
			
			for(Rol unRol : usuario.getRoles()){
				roles.add(unRol.getNombreRol());
			}
			
			
			
			securityUser = User.withUsername(login).password(passwordEncoder.encode(usuario.getPassword())).roles(roles.toArray(new String[0])).build();
			
		}catch (Exception e) {
			
			log.error(MessageFormat.format(Constantes.PREFIJO_MENSAJE_ERROR,e.getMessage()));
		}
		

		return securityUser;

	}
		

}

