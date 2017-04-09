package com.socialmetadata.dao;

import java.io.Serializable;
import java.util.List;

import javax.xml.crypto.dsig.keyinfo.RetrievalMethod;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.ejb.criteria.predicate.IsEmptyPredicate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.socialmetadata.model.Idioma;
import com.socialmetadata.model.Item;
import com.socialmetadata.model.TipoItem;


@Repository
public class ItemDAO {
	
	@Autowired
	private SessionFactory session;
	@Autowired
	private IdiomaDAO idiomaDAO;
	@Autowired
	private TipoItemDAO tipoItemDAO;

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
	public List<Item> advancedSearch(String titulo, String year, String idTipoItem, String idIdioma, Item item){
		Criteria criteria = session.getCurrentSession().createCriteria(Item.class);
		
		System.out.println("String idIdioma"+idIdioma);
		System.out.println("ITEM DAO CRITERIA");
		System.out.println("YEAR: "+year);
		
//		criteria.createAlias("autores", "autor")
//		.add(Restrictions.in("autor.autor", item.getAutores()));
		

		
		
		if(!year.equals("0")) {
			criteria.add(Restrictions.eq("year", Integer.parseInt(year)));
		}
		if(titulo != null){
			criteria.add(Restrictions.ilike("titulo", "%"+titulo+"%" ));
			}
		if(!idTipoItem.equals("0")){			
			
			TipoItem tipoItem = tipoItemDAO.getTipoItem(Integer.parseInt(idTipoItem));
			
			System.out.println("entro tipo");
			criteria.add(Restrictions.eq("tipo", tipoItem));
			
		}
		if(!idIdioma.equals("0")){
			
			int intidIdioma = Integer.parseInt(idIdioma);
			
			Idioma idioma = idiomaDAO.getIdioma(intidIdioma);

			criteria.add(Restrictions.eq("idioma", idioma));
			
		}
		
		
		List<Item> results = criteria.list();
		
		System.out.println("ITEM DAO CRITERIA RESULTADO");
		
		
		for (Item i: results){
			
			System.out.println("TITULO: "+ i.getTitulo());
			System.out.println("YEAR: "+ i.getYear());
			
		}
		
		return results;
		
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
