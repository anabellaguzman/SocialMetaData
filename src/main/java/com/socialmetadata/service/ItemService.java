package com.socialmetadata.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.socialmetadata.dao.ItemDAO;
import com.socialmetadata.dao.PosteoDAO;
import com.socialmetadata.model.Archivo;
import com.socialmetadata.model.Autor;
import com.socialmetadata.model.Comentario;
import com.socialmetadata.model.Error;
import com.socialmetadata.model.Item;
import com.socialmetadata.model.Posteo;
import com.socialmetadata.model.ValorAtributoItem;
import com.socialmetadata.utilities.PostIdComparator;

@Service
public class ItemService {

	@Autowired
	private ItemDAO itemDAO;

	@Autowired
	private PosteoDAO posteoDAO;

	@Transactional
	// (propagation = Propagation.REQUIRES_NEW)
	public Item getItem(int idItem) {

		System.out.println("entrea a itemservice getItem: ");

		Item item = itemDAO.getItem(idItem);

		item.getTipo().getDescripcion();
		item.getIdioma().getIdioma();

		Set<ValorAtributoItem> sValAtProp = item.getValorAtributoPropio();

		System.out.println("largo: " + sValAtProp.size());

		for (ValorAtributoItem vai : sValAtProp) {
			System.out.println("NOMBRE: "
					+ vai.getPk().getAtributo().getNombre() + "VARLOR: "
					+ vai.getValor());
			vai.getValor();
			vai.getPk().getAtributo().getNombre();
		}

		for (Autor a : item.getAutores()) {
			a.getNombre();
			a.getApellido();
		}

		return item;
	}
	
	@Transactional
	public List<Long> getItemsByTileTotalResults(String term) {
		return itemDAO.getItemsByTileTotalResults(term);
		
	}
	
	
	@Transactional
	public List<Item> getItemByTitle(String term, int from, int to) {

		List<Item> items = itemDAO.getItemsByTile(term, from, to);

		for (Item i : items) {
			i.getTipo().getDescripcion();
			for (Autor a : i.getAutores()) {
			}
		}

		return items;
	}

	@Transactional
	public int add(Item item) {
		return itemDAO.add(item);

	}

	@Transactional
	public void update(Item item) {
		itemDAO.update(item);

	}

	// @Transactional
	// (propagation = Propagation.REQUIRES_NEW)
	public List<Comentario> getItemComentarios(Item item) {

		List<Comentario> post = new ArrayList<>();

		for (Comentario c : item.getComentarios()) {
			post.add(c);
			// c.getFecha();
			// c.getComentario();
		}

		Collections.sort(post, new PostIdComparator());

		//
		for (Posteo c : post) {

			c.getTitulo();
			c.getFecha();
			c.getUsuario().getNombre();

			System.out.println("ID COMENTARIO " + c.getIdPosteo() + "- "
					+ c.getComentario());
		}
		//
		return post;
	}

	public List<Error> getItemErrores(Item item) {

		List<Error> post = new ArrayList<>();

		for (Error c : item.getErrores()) {
			post.add(c);

			System.out.println("ID ERROR " + c.getIdPosteo() + "- "
					+ c.getComentario());
		}

		Collections.sort(post, new PostIdComparator());
		
		return post;

	}

	public void getItemArchivos(Item item) {
		for (Archivo c : item.getArchivos()) {
			c.getIdPosteo();
			c.getComentario();
			c.getTitulo();

			// System.out.println(c.getIdPosteo());
			// System.out.println(c.getComentario());
			// System.out.println(c.getTitulo());

		}
	}

	public List<Item> advancedSearch(String titulo, String year,
			String idTipoItem, String idIdioma, Item item) {
		return itemDAO.advancedSearch(titulo, year, idTipoItem, idIdioma, item);
	}

}
