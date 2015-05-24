package com.socialmetadata.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.socialmetadata.dao.AutorDAO;
import com.socialmetadata.model.Autor;


@Service
public class AutorService {
	
	@Autowired
	private AutorDAO autorDAO;
	
	@Transactional
	public List<Autor> getAllAutores() {
		return autorDAO.getAllAutores();
	}
	
	@Transactional
	public List<Autor> getAutoresLike(String term) {
		return autorDAO.getAutoresLike(term); 
	}

}
