package com.socialmetadata.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.socialmetadata.dao.TemaDAO;
import com.socialmetadata.model.Tema;


@Service
public class TemaService {
	
	@Autowired
	private TemaDAO temaDAO;
	
	@Transactional
	public List<Tema> getAllTemas() {
		return temaDAO.getAllTemas();
	}
	
	@Transactional
	public List<Tema> getTemasLike(String term) {
		return temaDAO.getTemasLike(term); 
	}

}
