package com.socialmetadata.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.socialmetadata.dao.ItemDAO;
import com.socialmetadata.model.Autor;
import com.socialmetadata.model.Item;
import com.socialmetadata.model.ValorAtributoItem;

@Service
public class ItemService {
	
	@Autowired
	private ItemDAO itemDAO;
	
	@Transactional
//	(propagation = Propagation.REQUIRES_NEW)
	public Item getItem(int idItem) {
		
		Item item = itemDAO.getItem(idItem);
	
		item.getTipo().getDescripcion();
	
		for (ValorAtributoItem vai : item.getValorAtributoPropio()) {
			vai.getValor();
			vai.getPk().getAtributo().getNombre();
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
	
	
	

}
