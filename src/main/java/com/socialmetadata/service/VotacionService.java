package com.socialmetadata.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.socialmetadata.dao.VotacionDAO;

import com.socialmetadata.model.Votacion;


@Service
public class VotacionService {
	
	@Autowired
	private VotacionDAO votacionDAO;
	
	@Transactional
	public void addVotacion(Votacion votacion) {	
		votacionDAO.edit(votacion);
		
		
		
//		 votacionDAO.add(votacion);
	}

}
