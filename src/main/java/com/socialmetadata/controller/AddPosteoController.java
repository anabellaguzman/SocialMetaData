package com.socialmetadata.controller;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.socialmetadata.model.Archivo;
import com.socialmetadata.model.Comentario;
import com.socialmetadata.model.Error;
import com.socialmetadata.model.Item;
import com.socialmetadata.model.Posteo;
import com.socialmetadata.model.Usuario;
import com.socialmetadata.service.ItemService;
import com.socialmetadata.service.PosteoService;
import com.socialmetadata.service.UsuarioService;
import com.socialmetadata.utilities.FileFormBean;

@Controller
public class AddPosteoController {

	@Autowired
	private UsuarioService usuarioService;
	@Autowired
	private ItemService itemService;
	@Autowired
	private PosteoService posteoService;

	@RequestMapping(value = "/addComment", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView addComment(@RequestParam String tituloC,
			@RequestParam String comentarioC, @RequestParam int idItem) {

		Posteo comentario = createComentario();
		comentario = addPosteo(comentario, tituloC, comentarioC, idItem);
		ModelAndView mav = new ModelAndView("comentario");
		mav.addObject("comentario", comentario);

		return mav;

	}

	@RequestMapping(value = "/addError", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView addError(@RequestParam String tituloE,
			@RequestParam String comentarioE, @RequestParam int idItem) {
		Posteo error = createError();
		error = addPosteo(error, tituloE, comentarioE, idItem);
		ModelAndView mav = new ModelAndView("comentario");
		mav.addObject("comentario", error);

		return mav;

	}

	@RequestMapping(value = "/addArchivo", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView addArchivo(@RequestParam int idItem,
			@ModelAttribute FileFormBean fileFormBean,
			HttpServletRequest request) {

		Posteo archivo = createArchivo();

		CommonsMultipartFile file = fileFormBean.getFichero();
		String fileName = file.getOriginalFilename();

		String extension = "." + FilenameUtils.getExtension(fileName);

		 archivo = addPosteo(archivo, file.getOriginalFilename(),extension, idItem);
		 System.out.println("id posteo: " + archivo.getIdPosteo());

		FileUploadController fileUploadController = new FileUploadController();
		fileUploadController.guardaFichero(fileFormBean, request, archivo.getIdPosteo(),
				"resources/archivos/");

		
		ModelAndView mav = new ModelAndView("archivoLink");
		mav.addObject("archivos", archivo );

		return mav;

	}
	
	
	@RequestMapping(value = "/addPortrait", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView addPortrait(@RequestParam int idItem,
			@ModelAttribute FileFormBean fileFormBean,
			HttpServletRequest request) {
		
		System.out.println("(value = /addPortrait");
		
		Item item = itemService.getItem(idItem);

		CommonsMultipartFile file = fileFormBean.getPortrait();

		String fileName = file.getOriginalFilename();
		String imagen = Integer.toString(idItem);
		
		String extension = "." + FilenameUtils.getExtension(fileName);
		imagen =imagen+extension;
		System.out.println(imagen);
	
		item.setImagen(imagen);
//
//		 archivo = addPosteo(archivo, file.getOriginalFilename(),extension, idItem);
//		 System.out.println("id posteo: " + archivo.getIdPosteo());
//
		FileUploadController fileUploadController = new FileUploadController();
		fileUploadController.guardaPortada(fileFormBean, request, imagen,
				"resources/images/");
		
		itemService.update(item);
//
//		
		ModelAndView mav = new ModelAndView("portada");
		mav.addObject("item", item );
		

		return mav;

	}

	private Posteo addPosteo(Posteo posteo, String titulo, String comentario,
			int idItem) {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String username = auth.getName();

		Usuario usuario = usuarioService.getByUsername(username);
		Item item = itemService.getItem(idItem);

		Date date = new Date();

		posteo.setUsuario(usuario);
		posteo.setItem(item);
		posteo.setTitulo(titulo);
		posteo.setComentario(comentario);
		posteo.setFecha(date);

		return posteoService.add(posteo);
	}

	private Posteo createComentario() {
		Posteo comentario = new Comentario();
		return comentario;
	}

	private Posteo createError() {
		Error error = new Error();
		return error;
	}

	private Posteo createArchivo() {
		Archivo archivo = new Archivo();
		return archivo;
	}

}
