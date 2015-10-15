package com.socialmetadata.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.socialmetadata.model.Item;


@Repository
public class ItemDAO {
	
	@Autowired
	private SessionFactory session;

	public int add(Item item) {
		Serializable i = session.getCurrentSession().save(item);

		int id = (Integer) i;
//		System.out.println("ID: "+ id);
		return id;
	}

	public void update(Item item) {
		session.getCurrentSession().update(item);
		
	}

	public void delete(int idItem) {
		session.getCurrentSession().delete(getItem(idItem));
		
	}

	public Item getItem(int idItem) {
		return (Item)session.getCurrentSession().get(Item.class, idItem);
	
	}

	public List<Item> getAllItems() {
		
		return session.getCurrentSession().createQuery("from Item").list();
	}
	
	public List<Item> getItemsByTile(String term) {
		
		return session.getCurrentSession().createQuery("FROM Item WHERE titulo like '%"+ term + "%'").list();
	}

}
