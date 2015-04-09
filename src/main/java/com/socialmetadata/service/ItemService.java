package com.socialmetadata.service;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.socialmetadata.dao.ItemDAO;
import com.socialmetadata.model.Item;
import com.socialmetadata.model.ValorAtributoItem;

@Service
public class ItemService {
	
	@Autowired
	private ItemDAO itemDAO;
	
	@Transactional
	public Item getItem(int idItem) {
		
		Item item = itemDAO.getItem(idItem);

//		Set<ValorAtributoItem> valoratri = item.getValorAtributoPropio();
		
//		item.setValorAtributoPropio(valoratri);
		
		for (ValorAtributoItem vai : item.getValorAtributoPropio()) {
			vai.getValor();
			vai.getPk().getAtributo().getNombre();
//		    System.out.println(" ValorAtributoItem VALOR: "+vai.getValor());
//		    System.out.println(" ValorAtributoItem NOMBRE atributo: "+vai.getPk().getAtributo().getNombre());
		}
		
		
		return item;
	}

}
