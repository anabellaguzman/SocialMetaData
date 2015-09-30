
package com.socialmetadata.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.socialmetadata.dao.AtributoItemDAO;
import com.socialmetadata.model.AtributoItem;


@Service
public class AtributoItemService {
	
	@Autowired
	private AtributoItemDAO atributoItemDAO;
	
	@Transactional
	public AtributoItem getAtributoItem(int idAtributoItem) {		
		return atributoItemDAO.getAtributoItem(idAtributoItem);
	}

}
