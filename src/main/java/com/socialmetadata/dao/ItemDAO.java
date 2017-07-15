package com.socialmetadata.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.xml.crypto.dsig.keyinfo.RetrievalMethod;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.ejb.criteria.predicate.IsEmptyPredicate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.socialmetadata.model.Autor;
import com.socialmetadata.model.Idioma;
import com.socialmetadata.model.Item;
import com.socialmetadata.model.Tema;
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
		return (Item) session.getCurrentSession().get(Item.class, idItem);

	}

	public List<Item> getAllItems() {

		return session.getCurrentSession().createQuery("from Item").list();
	}
	
//	public List<Item> getItemsByTilePaiged(int from, int to){
//		return session.getCurrentSession()
//				.createQuery("FROM Item WHERE titulo like '%" + term + "%' limit 1,20")
//				.list();
//	}

	
	public List<Long> getItemsByTileTotalResults(String term) {
		
		
		Query qty = session.getCurrentSession().createQuery("SELECT COUNT(*) FROM Item WHERE titulo like '%" + term + "%'");

		
//		System.out.println("qty total: "+qty.list());
		
		List<Long> totalR = qty.list();
		
		return totalR;
		
	}
	
	
	public List<Item> getItemsByTile(String term, int from, int to) {
		
//		Session s = session.getCurrentSession();
		
		Query qty = session.getCurrentSession().createQuery("SELECT COUNT(*) FROM Item WHERE titulo like '%" + term + "%'");
//		qty.list();
		
		System.out.println("qty total: "+qty.list());
		
		List<Integer> totalR = qty.list();
		

		
//		String totalResults = qty.toString();
//		System.out.println("totalresults: "+ totalResults);
		
		Query q = session.getCurrentSession().createQuery("FROM Item WHERE titulo like '%" + term + "%'");
		q.setFirstResult(from);
		q.setMaxResults(to);
		
		return q.list();

//		return session.getCurrentSession()
//				.createQuery("FROM Item WHERE titulo like '%" + term + "%' limit 1, 20 ")
//				.list();
	}

	@Transactional
	public List<Item> advancedSearch(String titulo, String year,
			String idTipoItem, String idIdioma, Item item) {

		Criteria criteria = session.getCurrentSession().createCriteria(
				Item.class, "item");

		System.out.println("ITEM DAO CRITERIA");

		//Titulo
		if (titulo != null) {
			criteria.add(Restrictions.ilike("titulo", "%" + titulo + "%"));
		}
		//Year
		if (!year.equals("0")) {
			criteria.add(Restrictions.eq("year", Integer.parseInt(year)));
		}
		//Idioma
		if (!idIdioma.equals("0")) {
			int intidIdioma = Integer.parseInt(idIdioma);
			Idioma idioma = idiomaDAO.getIdioma(intidIdioma);
			criteria.add(Restrictions.eq("idioma", idioma));
		}
		
		//TipoItem
		if (!idTipoItem.equals("0")) {
			TipoItem tipoItem = tipoItemDAO.getTipoItem(Integer
					.parseInt(idTipoItem));
			criteria.add(Restrictions.eq("tipo", tipoItem));

		}
		
		//Autores
		Set<Autor> sautores = item.getAutores();
		Disjunction disjunction = Restrictions.disjunction();
		criteria.createAlias("autores", "a");
		for (Autor toau : sautores) {
			disjunction.add(Restrictions.eq("a.idAutor", toau.getIdAutor()));
		}
		criteria.add(disjunction);
		
		
		//Temas
		Set<Tema> stemas = item.getSetTemas();
		Disjunction disjunctionTemas = Restrictions.disjunction();
		criteria.createAlias("setTemas", "t");
		for (Tema temaAcomparar : stemas) {
			disjunctionTemas.add(Restrictions.eq("t.idTema", temaAcomparar.getIdTema()));
		}
		criteria.add(disjunctionTemas);
		

		List<Item> resultsD = criteria.list();
		
		
		
		//Limpieza
		List<Item> listaLimpia = new ArrayList();
		// Forma número 1 (Uso de Maps).
		Map<Integer, Item> mapItems = new HashMap<Integer, Item>(
				resultsD.size());
		// Aquí está la magia
		for (Item i : resultsD) {
			mapItems.put(i.getIdItem(), i);
		}
		// Agrego cada elemento del map a una nueva lista y muestro cada
		// elemento.
		System.out.println("Lista sin repetidos:");
		for (Entry<Integer, Item> i : mapItems.entrySet()) {
			listaLimpia.add(i.getValue());
			System.out.println(i.getValue());
		}

		System.out.println("ITEM DAO CRITERIA RESULTADO");

		for (Item i : listaLimpia) {
			System.out.println("TITULO: " + i.getTitulo());
			System.out.println("YEAR: " + i.getYear());
			System.out.println("IDIOMA: " + i.getIdioma().getIdioma());
			System.out.println("TIPO ITEM: " + i.getTipo().getDescripcion());
		}
		//
		return listaLimpia;

	}


}
