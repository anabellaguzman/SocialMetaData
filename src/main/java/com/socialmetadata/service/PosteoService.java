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
	public Posteo add(Posteo posteo) {
		
		posteo = posteoDAO.getPosteo(posteoDAO.add(posteo));
		
		return posteo;
//		System.out.println(posteo.getUsuario()+" "+posteo.getComentario()+" "+posteo.getIdPosteo());
		
	}
	
	

}
