package com.socialmetadata.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.socialmetadata.model.AtributoItem;

@Repository
public class AtributoItemDAO {
	
	@Autowired
	private SessionFactory session;

	public void add(AtributoItem atributoItem) {
		session.getCurrentSession().save(atributoItem);
		
	}

	public void edit(AtributoItem atributoItem) {
		session.getCurrentSession().update(atributoItem);
		
	}

	public void delete(int idAtributoItem) {
		session.getCurrentSession().delete(getAtributoItem(idAtributoItem));
		
	}

	public AtributoItem getAtributoItem(int idAtributoItem) {
				
		return (AtributoItem)session.getCurrentSession().get(AtributoItem.class, idAtributoItem);
		
		
	}

	@SuppressWarnings("unchecked")
	public List<AtributoItem> getAllAtributoItem() {
			
			
		List<AtributoItem> lista = new ArrayList<AtributoItem>();
		lista = session.getCurrentSession().createQuery("from AtributoItem").list();
		return lista;
		
		
	}

}
