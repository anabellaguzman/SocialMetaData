package com.socialmetadata.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.socialmetadata.dao.PosteoDAO;
import com.socialmetadata.model.Posteo;

@Service
public class PosteoService {
	
	@Autowired 
	PosteoDAO posteoDAO;
	
	@Transactional
	public int add(Posteo posteo) {
		return posteoDAO.add(posteo);
		
	}
	
	

}
