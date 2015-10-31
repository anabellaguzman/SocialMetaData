package com.socialmetadata.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.socialmetadata.dao.ItemDAO;
import com.socialmetadata.dao.PosteoDAO;
import com.socialmetadata.model.Autor;
import com.socialmetadata.model.Comentario;
import com.socialmetadata.model.Error;
import com.socialmetadata.model.Item;
import com.socialmetadata.model.Posteo;
import com.socialmetadata.model.Usuario;
import com.socialmetadata.model.ValorAtributoItem;

@Service
public class ItemService {
	
	@Autowired
	private ItemDAO itemDAO;
	
	@Autowired
	private PosteoDAO posteoDAO;
	
	@Transactional
//	(propagation = Propagation.REQUIRES_NEW)
	public Item getItem(int idItem) {
		
		Item item = itemDAO.getItem(idItem);
	
		item.getTipo().getDescripcion();
		item.getIdioma().getIdioma();
	
		for (ValorAtributoItem vai : item.getValorAtributoPropio()) {
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
	public List<Item> getItemByTitle(String term){
		
		List<Item> items = itemDAO.getItemsByTile(term);
		
		for (Item i : items){	
			i.getTipo().getDescripcion();
			for (Autor a : i.getAutores()){			
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
	

	public void getItemComentarios(Item item) {
		for (Comentario c : item.getComentarios()){
			c.getComentario();
			c.getTitulo();	
		}
	}
	
	public void getItemErrores(Item item) {
		for (Error c : item.getErrores()){
			c.getComentario();
			c.getTitulo();
		}
	}


}
