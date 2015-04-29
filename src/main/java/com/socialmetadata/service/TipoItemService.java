package com.socialmetadata.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import org.springframework.transaction.annotation.Transactional;

import com.socialmetadata.dao.TipoItemDAO;
import com.socialmetadata.model.AtributoItem;
import com.socialmetadata.model.TipoItem;
import com.socialmetadata.model.ValorAtributoItem;

@Service
public class TipoItemService {
	
	@Autowired
	private TipoItemDAO tipoItemDAO;
	
	@Transactional
	public List<TipoItem> getAllTipoItem() {
		return tipoItemDAO.getAllTipoItem();
	}
	
	@Transactional
	public TipoItem getTipoItem (int idTipoItem){
		
		TipoItem tipoItem = tipoItemDAO.getTipoItem(idTipoItem);
		
		for (AtributoItem ai : tipoItem.getAtributoItem()) {
			ai.getIdAtributoItem();
			ai.getNombre();
		}
		
		tipoItem.getDescripcion();
		tipoItem.getIdTipoItem();
		
		return tipoItem;
	}
	
}
