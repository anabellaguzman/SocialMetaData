package com.socialmetadata.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.socialmetadata.model.Autor;
import com.socialmetadata.model.Item;


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
	
	@Transactional
	public boolean autorexists(String nombre, String apellido){
		
		Criteria criteria = session.getCurrentSession().createCriteria(
				Autor.class, "autor");
		
		criteria.add(Restrictions.eq("nombre", nombre));
		criteria.add(Restrictions.eq("apellido", apellido));
		
		List<Autor> results = criteria.list();
		
		if(results.size()==0){
			return false;
			
		}
		else{
			return true;
		}
			

	}

	public List<Autor>getAllAutores() {
			
		
		return session.getCurrentSession().createQuery("from Autor").list();
	}
	
	public List<Autor>getAutoresLike(String term){
		
		return session.getCurrentSession().createQuery("FROM Autor WHERE nombre like '%"+ term + "%' OR apellido like'%"+ term + "%'").list();
	}
	
	


}
