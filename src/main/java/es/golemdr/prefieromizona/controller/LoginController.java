package es.golemdr.prefieromizona.controller;

import java.text.MessageFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import es.golemdr.prefieromizona.controller.constantes.ForwardConstants;
import es.golemdr.prefieromizona.controller.constantes.UrlConstants;
import es.golemdr.prefieromizona.domain.Usuario;
import es.golemdr.prefieromizona.ext.Constantes;
import es.golemdr.prefieromizona.service.UsuariosService;



 
@Controller
public class LoginController {
	
	private static final Logger log = LogManager.getLogger(LoginController.class);

	@Autowired
	private UsuariosService usuariosService;
	
	@GetMapping(value=UrlConstants.URL_LOGIN)
	public String verlogin(Model model,HttpServletRequest request) {
		
		return ForwardConstants.FWD_LOGIN;
	}
	
	@PostMapping(value=UrlConstants.URL_LOGIN)
	public String login(Model model,HttpServletRequest request) {
		
		return ForwardConstants.FWD_HOME;
	}
	
	@GetMapping(value=UrlConstants.URL_LOGIN_FAILURE)
 	public String loginFailure(Model model) {
		
		String mensaje = "Usuario o password incorrectos";
		
		model.addAttribute("mensaje", mensaje);
		
		return ForwardConstants.FWD_LOGIN;
	}
	
    @GetMapping(value=UrlConstants.URL_ACCESO_OK)
    public String loginPage() {
    	
    	return ForwardConstants.FWD_HOME;
    }
    
	@GetMapping(value=UrlConstants.URL_ENTRADA_APLICACION)
	public String inicio(Model model,HttpServletRequest request) {
		
		String destino = null;
		Usuario usuarioLogado = null;
		
		String login = SecurityContextHolder.getContext().getAuthentication().getName(); // En este caso login y name son equivalentes
		
		
		usuarioLogado = usuariosService.getByLogin(login);
		
		if(usuarioLogado.getCambiarPassword().equals(Constantes.SI)) {
				
			// TODO - Implementar cambio de password
			
		}else {

			// Seteo los valores que necesito para luego no tener que hacerlo en cada JSP
			if(usuarioLogado.getCliente() != null) {
				
				usuarioLogado.setNombreEntidad(usuarioLogado.getCliente().getNombre() + " " + usuarioLogado.getCliente().getApellido1() + " " +  usuarioLogado.getCliente().getApellido2());
				usuarioLogado.setIdEntidad(usuarioLogado.getCliente().getIdCliente());
				
				
			}else if(usuarioLogado.getComercio() != null) {
				
				usuarioLogado.setNombreEntidad(usuarioLogado.getComercio().getRazonSocial());
				usuarioLogado.setIdEntidad(usuarioLogado.getComercio().getIdComercio());
			
			}else if(usuarioLogado.getCliente() == null && usuarioLogado.getComercio() == null) {
				
				usuarioLogado.setNombreEntidad("ADMINISTRADOR");
			}
			
			
			HttpSession session = request.getSession(false);
			session.setAttribute(Constantes.ATRIBUTO_SESSION_USUARIO, usuarioLogado);
			
			log.info(MessageFormat.format(Constantes.USUARIO_LOGADO_CORRECTAMENTE, usuarioLogado.getLogin()));
			
			destino = ForwardConstants.FWD_HOME;

			
		}
		
		return destino;
	}
  

}
