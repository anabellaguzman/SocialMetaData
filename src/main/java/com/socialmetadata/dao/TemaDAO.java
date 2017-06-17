package com.socialmetadata.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;




import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.socialmetadata.model.Autor;
import com.socialmetadata.model.Tema;

@Repository
public class TemaDAO {
	
	@Autowired
	private SessionFactory session;

	public void add(Tema tema) {
		session.getCurrentSession().save(tema);
		
	}

	public void edit(Tema tema) {
		session.getCurrentSession().update(tema);
		
	}

	public void delete(int idTema) {
		session.getCurrentSession().delete(getTema(idTema));
		
	}

	public Tema getTema(int idTema) {
				
		return (Tema)session.getCurrentSession().get(Tema.class, idTema);
		
		
	}

	public List<Tema> getAllTemas() {
			
		
		return session.getCurrentSession().createQuery("from Tema").list();
	}
	
	public List<Tema>getTemasLike(String term){
		
		return session.getCurrentSession().createQuery("FROM Tema WHERE tema like '%"+ term + "%'").list();
	}
	
	@Transactional
	public boolean temaExists(String tema){

		Criteria criteria = session.getCurrentSession().createCriteria(
				Tema.class, "tema");
		
		criteria.add(Restrictions.eq("tema", tema));
		
		List<Tema> results = criteria.list();
		
		if(results.size()==0){
			return false;
			
		}
		else{
			return true;
		}
	}
}
