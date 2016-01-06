package com.socialmetadata.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.socialmetadata.model.Item;


@Repository
public class ItemDAO {
	
	@Autowired
	private SessionFactory session;

	public int add(Item item) {
		Serializable i = session.getCurrentSession().save(item);

		int id = (Integer) i;
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
	
	@Transactional
	public void advancedSearch(String titulo, Integer year){
		Criteria criteria = session.getCurrentSession().createCriteria(Item.class);
		
		if(year != null) {
			criteria.add(Restrictions.eq("year", year));
		}
		
		if(titulo != null){
			criteria.add(Restrictions.ilike("titulo", "%"+titulo+"%" ));
			}
		
		
		List<Item> results = criteria.list();
		
		for (Item i: results){
			
			System.out.println("TITULO: "+ i.getTitulo());
			System.out.println("YEAR: "+ i.getYear());
			
		}
		
	}
	
	
	
	
	// Form object
//	public class bookingSearchForm {
//	    private String bookingId;
//	    public getBookingId()...
//	    public setBookingId()...
//	}
//
//	// Hibernate
//	Criteria criteria = getSession().createCriteria(Booking.class);
//	if(form.getBookingId() != null) {
//	    criteria.add(Restrictions.eq("bookingId", form.getBookingId()));
//	}
//	criteria.list();

}
