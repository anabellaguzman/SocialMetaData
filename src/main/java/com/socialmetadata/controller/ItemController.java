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
import org.springframework.web.bind.annotation.ResponseBody;
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
	@ResponseBody
	public String votarItem(@RequestParam Double voto, @RequestParam int idItem) {
		
		System.out.println("voto: "+ voto+"idItem: "+idItem);
		
		
//		VotacionEPK pk = new VotacionEPK (, idItem);

		
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String name = auth.getName(); // get logged in username
		System.out.println(name);
		Item item = itemService.getItem(idItem);
		Usuario usuario = usuarioService.getByUsername(name);
		
//		idUsuario = usuario.getIdUsuario();
		
//		System.out.println("idUsuario: "+ usuario.getIdUsuario());

		
		VotacionEPK pk = new VotacionEPK (item, usuario);
		Votacion votacion = new Votacion(pk, voto);
		
		item = votacionService.addVotacion(votacion, item);
		
//		String result = votacionService.addVotacion(votacion, item);
		
//		Set<Votacion> listadoVotos = item.getListadoVotos();
//		listadoVotos.add(votacion);
//		
//		item.setListadoVotos(listadoVotos);
//		
//		itemService.update(item);
//		item = itemService.getItem(item.getIdItem());
		
//		String result = votacionService.addVotacion(votacion, item);
		
		 
		
//		Set<Votacion> listadoVotos = item.getListadoVotos();
//		
//		if (result == "1"){
//			System.out.println("SE ACTUALIZO DB");
//			
//			votaciones = item.getListadoVotos();
////			votaciones.add(votacion);
//			
//			for (Votacion v: item.getListadoVotos()){
//				
//				System.out.println("usuario: "+v.getVotacionPK().getUsuario().getIdUsuario() +"item: "+v.getVotacionPK().getItem().getIdItem()+" puntaje: "+v.getPuntaje());
//				
//			}
			
//			calculateAvg(item);
			item.setPuntaje(calculateAvg(item));
			
			itemService.update(item);
			
			return "Su voto ha sido guardado correctamente!";
		}
	
	
		private Double calculateAvg (Item item){
			
			Double sumQtyVotos = 0.00;
			Integer qtyVotos = 0;
			
			
			
			for (Votacion v: item.getListadoVotos()){
				
//				System.out.println("usuario: "+v.getVotacionPK().getUsuario().getIdUsuario() +"item: "+v.getVotacionPK().getItem().getIdItem()+" puntaje: "+v.getPuntaje());
				
				qtyVotos ++;
				sumQtyVotos = sumQtyVotos + v.getPuntaje();
				
			}
			
			System.out.println("Qty Votos:  "+ qtyVotos+"sumQtyVotos: "+ sumQtyVotos);
			
			Double avg = sumQtyVotos/qtyVotos;
			System.out.println("AVG:  "+ avg);
			
			return avg;
			
		}
		
		
		@RequestMapping(value = "/getNewAvg", method = RequestMethod.POST)
		@Transactional
		@ResponseBody
		public Double getNewAvg( @RequestParam int idItem) {
			
			Item item = itemService.getItem(idItem);
			
			item.getPuntaje();
			
			return item.getPuntaje();
		}
		

		
		
		
//		ValorAtributoItem valAI = new ValorAtributoItem(pk, valOwnAtr.get(i));
		
	}

		
		


