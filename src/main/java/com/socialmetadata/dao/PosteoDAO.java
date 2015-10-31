package com.socialmetadata.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.socialmetadata.model.Posteo;

@Repository
public class PosteoDAO {

	
	@Autowired
	private SessionFactory session;

	public void add(Posteo posteo) {
		session.getCurrentSession().save(posteo);
		
	}

	public void edit(Posteo posteo) {
		session.getCurrentSession().update(posteo);
		
	}

	public void delete(int idPosteo) {
		session.getCurrentSession().delete(getPosteo(idPosteo));
		
	}

	public Posteo getPosteo(int idPosteo) {
				
		return (Posteo)session.getCurrentSession().get(Posteo.class, idPosteo);
		
		
	}

	public List<Posteo> getAllPosteos() {
			
		
		return session.getCurrentSession().createQuery("from Posteo").list();
	}

}