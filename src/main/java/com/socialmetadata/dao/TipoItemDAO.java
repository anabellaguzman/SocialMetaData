package com.socialmetadata.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.socialmetadata.model.TipoItem;

@Repository
public class TipoItemDAO {
	
	@Autowired
	private SessionFactory session;

	public void add(TipoItem tipoItem) {
		session.getCurrentSession().save(tipoItem);

	}

	public void edit(TipoItem tipoItem) {
		session.getCurrentSession().update(tipoItem);

	}

	public void delete(int idTipoItem) {
		session.getCurrentSession().delete(getTipoItem(idTipoItem));

	}

	public TipoItem getTipoItem(int idTipoItem) {
		return (TipoItem)session.getCurrentSession().get(TipoItem.class, idTipoItem);
	}

	public List<TipoItem> getAllTipoItem() {
		return session.getCurrentSession().createQuery("from TipoItem").list();
	}

}
