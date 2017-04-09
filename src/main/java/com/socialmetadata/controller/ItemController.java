package com.socialmetadata.controller;



import java.util.Set;

import javax.persistence.Column;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.socialmetadata.model.Archivo;
import com.socialmetadata.model.Comentario;
import com.socialmetadata.model.Item;
import com.socialmetadata.model.Posteo;
import com.socialmetadata.model.Usuario;
import com.socialmetadata.model.ValorAtributoItem;
import com.socialmetadata.model.Votacion;
import com.socialmetadata.modeloDao.embebedPK.ValorAtributoItemEPK;
import com.socialmetadata.modeloDao.embebedPK.VotacionEPK;
import com.socialmetadata.service.ItemService;
import com.socialmetadata.service.UsuarioService;
import com.socialmetadata.service.VotacionService;

@Controller
public class ItemController {

	@Autowired
	private ItemService itemService;
	
	
	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private VotacionService votacionService;


	@RequestMapping(value ="/item",  method = RequestMethod.GET)
	// @Transactional(propagation = Propagation.REQUIRES_NEW)
	@Transactional
	public ModelAndView setupForm(Integer idItem) {
		
		ModelAndView mav = new ModelAndView("item");
		Item item = itemService.getItem(idItem);
		itemService.getItemComentarios(item);
		itemService.getItemErrores(item);
		itemService.getItemArchivos(item);

		mav.addObject("item", item);

	 return mav;
	 
	 }
	
	
	
	@RequestMapping(value = "/votarItem", method = RequestMethod.POST)
	@Transactional
	public void votarItem(@RequestParam Double voto, @RequestParam int idItem) {
		
		System.out.println("voto: "+ voto+"idItem: "+idItem);
		
		
//		VotacionEPK pk = new VotacionEPK (, idItem);

		
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String name = auth.getName(); // get logged in username
		System.out.println(name);
		Item item = itemService.getItem(idItem);
		Usuario usuario = usuarioService.getByUsername(name);
		
//		idUsuario = usuario.getIdUsuario();
		
		System.out.println("idUsuario: "+ usuario.getIdUsuario());

		
		VotacionEPK pk = new VotacionEPK (item, usuario);
		Votacion votacion = new Votacion(pk, voto);
		
		votacionService.addVotacion(votacion);
		
		
		
		Set<Votacion> votaciones = item.getListadoVotos();
		
		for (Votacion v: votaciones){
			
			System.out.println("item get votos puntaje "+ v.getPuntaje());
			
			System.out.println("item get votos iditem "+ v.getVotacionPK().getItem().getIdItem());
		}
		
		
		
//		ValorAtributoItem valAI = new ValorAtributoItem(pk, valOwnAtr.get(i));
		
	}

		
		

}
