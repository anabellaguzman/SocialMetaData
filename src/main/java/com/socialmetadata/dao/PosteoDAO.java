package com.socialmetadata.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.socialmetadata.model.Posteo;

@Repository
public class PosteoDAO {

	
	@Autowired
	private SessionFactory session;

	public int add(Posteo posteo) {
		Serializable i = session.getCurrentSession().save(posteo);

		int id = (Integer) i;
		return id;
		
		
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