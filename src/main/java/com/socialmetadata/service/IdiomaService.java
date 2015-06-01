package com.socialmetadata.service;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.socialmetadata.dao.IdiomaDAO;
import com.socialmetadata.dao.ItemDAO;
import com.socialmetadata.dao.PosteoDAO;
import com.socialmetadata.dao.UsuarioDAO;
import com.socialmetadata.dao.VotacionDAO;
import com.socialmetadata.model.Idioma;
import com.socialmetadata.model.Item;
import com.socialmetadata.model.ValorAtributoItem;

@Service
public class IdiomaService {
	
	@Autowired
	private IdiomaDAO idiomaDAO;
	
	@Autowired
	private ItemDAO itemDAO;
	
	@Autowired
	private UsuarioDAO usuarioDAO;
	
	@Autowired
	private VotacionDAO votacionDAO;
	
	@Autowired
	private PosteoDAO posteoDAO;
	
	
	@Transactional
	public void add(Idioma idioma) {
		idiomaDAO.add(idioma);
	}
	
	@Transactional
	public void edit(Idioma idioma) {
		idiomaDAO.edit(idioma);

	}
	
	@Transactional
	public void delete(int idIdioma) {
		idiomaDAO.delete(idIdioma);

	}
	
	@Transactional
	public Idioma getIdioma(int idIdioma) {
		return idiomaDAO.getIdioma(idIdioma);
	}
	
	@Transactional
	public List<Idioma> getAllIdiomas() {
		return idiomaDAO.getAllIdiomas();
	}
	
	@Transactional
	public Item metodoTestIdiomaService(){

		
		Item item = new Item();
		item = itemDAO.getItem(1);
		
//		Idioma idi = new Idioma();
//
//		
		System.out.println("Id item: "+ item.getIdItem());
		System.out.println("titulo item: "+ item.getTitulo());
		System.out.println("titulo año: "+ item.getAño());
		System.out.println("titulo puntaje: "+ item.getPuntaje());
		System.out.println("titulo tipo item:"+ item.getTipo().getDescripcion());
		
		
		Set<ValorAtributoItem> valoratri = item.getValorAtributoPropio();
//		
//		
		for (ValorAtributoItem vai : valoratri) {
	    System.out.println(" ValorAtributoItem VALOR: "+vai.getValor());
	    System.out.println(" ValorAtributoItem NOMBRE atributo: "+vai.getPk().getAtributo().getNombre());
	}
		
//		Set<Posteo> posteos;
//		
//		posteos = item.getPosteos();
//		
//		for (Posteo posteo : posteos) {
//	    System.out.println(" SET POSTEO Titulo: "+posteo.getTitulo());
//	}
//		
		
		
//		
//		idi = item.getIdioma();
//		
//		System.out.println("idioma item: "+ idi.getIdioma());
//		
//		
//		idi.getItems();
//		
//		Set<Item> items;
//
//		items = idi.getItems();
//		
//		for (Item it : items) {
//		    System.out.println("SET ITEM Titulo: "+it.getTitulo());
//		}
//		
//		Set<Tema> setTemas = item.getSetTemas();
//		
//		for (Tema t : setTemas) {
//		    System.out.println("SET TEMA tema: "+t.getTema());
//		}
//		
//		Set<Autor> setAutores = item.getAutores();
//		
//		for (Autor a : setAutores) {
//		    System.out.println("SET AUTOR nombre: "+a.getNombre());
//		}
//		
//--------------------------------------------------		
//		Usuario usuario = usuarioDAO.getUsuario(1);
//		
//		
//		System.out.println("Nombre usuario: "+ usuario.getNombre());
//		
//		Set<Item> itemsFavoritos = usuario.getItemsFavoritos();
//		
//		for (Item itemfav : itemsFavoritos) {
//		    System.out.println("itemsFavoritos Item titulo: "+ itemfav.getTitulo());
//		}
		
//----------------------------------------------------
		
//		VotacionEPK votepk = new VotacionEPK(1, 2);
//		
//		Votacion votacion = votacionDAO.getVotacion(votepk);
//		
//		System.out.println("VOTACION el puntaje es: "+ votacion.getPuntaje());
//---------------------------------------------------
		
		
//		Calendar calendario = GregorianCalendar.getInstance();
//		Date fecha = calendario.getTime();
//		
//		Posteo error = new Error();
//
//		
//		error.setTitulo("titulo error");
//		error.setComentario("comentario error");
//		error.setItem(item);
//		error.setUsuario(usuario);
//		error.setFecha(fecha);
//		
//		
//		posteoDAO.add(error);

//-------------------------------------------------------		
		
//		Posteo posteo = posteoDAO.getPosteo(1);
//		
//		System.out.println("El posteo lo comento: "+ posteo.getUsuario().getNombre());
//		
//		System.out.println("Sobre el item: " + posteo.getItem().getTitulo());
//		
//		System.out.println("En la fecha: " + posteo.getFecha());
//		
//		System.out.println("La clase es: " + posteo.getClass());
//		
		
		
		return item;
	}

}
