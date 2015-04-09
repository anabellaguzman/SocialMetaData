package com.socialmetadata.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import org.springframework.transaction.annotation.Transactional;

import com.socialmetadata.dao.TipoItemDAO;
import com.socialmetadata.model.TipoItem;

@Service
public class TipoItemService {
	
	@Autowired
	private TipoItemDAO tipoItemDAO;
	
	@Transactional
	public List<TipoItem> getAllTipoItem() {
		return tipoItemDAO.getAllTipoItem();
	}
}
