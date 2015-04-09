package com.socialmetadata.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.socialmetadata.model.Autor;


@Repository
public class AutorDAO {

	
	@Autowired
	private SessionFactory session;

	public void add(Autor autor) {
		session.getCurrentSession().save(autor);
		
	}

	public void edit(Autor autor) {
		session.getCurrentSession().update(autor);
		
	}

	public void delete(int idAutor) {
		session.getCurrentSession().delete(getAutor(idAutor));
		
	}

	public Autor getAutor(int idAutor) {
				
		return (Autor)session.getCurrentSession().get(Autor.class, idAutor);
		
		
	}

	public List<Autor>getAllAutores() {
			
		
		return session.getCurrentSession().createQuery("from Autor").list();
	}
	
	


}
