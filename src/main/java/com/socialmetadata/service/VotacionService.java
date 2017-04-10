package com.socialmetadata.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.socialmetadata.dao.VotacionDAO;
import com.socialmetadata.model.Item;
import com.socialmetadata.model.Votacion;


@Service
public class VotacionService {
	
	@Autowired
	private VotacionDAO votacionDAO;
	
	@Transactional
	public Item addVotacion(Votacion votacion, Item item) {	
		return votacionDAO.edit(votacion, item);
		
	}

}
