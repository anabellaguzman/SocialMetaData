package com.socialmetadata.dao;


import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.socialmetadata.model.Item;
import com.socialmetadata.model.Votacion;
import com.socialmetadata.modeloDao.embebedPK.VotacionEPK;

@Repository
public class VotacionDAO {
	
	@Autowired
	private SessionFactory session;
	
	@Autowired
	private ItemDAO itemDAO;

	public Item add(Votacion votacion, Item item) {
		session.getCurrentSession().save(votacion);
		
		item.getListadoVotos().add(votacion);
	
//			for (Votacion v: item.getListadoVotos()){
//				
//				System.out.println("usuario: "+v.getVotacionPK().getUsuario().getIdUsuario() +"item: "+v.getVotacionPK().getItem().getIdItem()+" puntaje: "+v.getPuntaje());
//				
//			}
		return item;
	}

	public Item edit(Votacion votacion, Item item) {
		
		Votacion votoDB = getVotacion(votacion.getVotacionPK());
		
		
		if (votoDB == null){
			System.out.println("voto es null");
			return add(votacion, item);
		}
		
		else{
			
			System.out.println("actualizar votoDB con puntaje de votacion");
			votoDB.setPuntaje(votacion.getPuntaje());
			session.getCurrentSession().update(votoDB);
			item = itemDAO.getItem(item.getIdItem());
						
			}
			
			return item;
			
		}
		
		
	

	public void delete(VotacionEPK idVotacion) {
		session.getCurrentSession().delete(getVotacion(idVotacion));
		
	}

	public Votacion getVotacion(VotacionEPK idVotacion) {
				
		return (Votacion)session.getCurrentSession().get(Votacion.class, idVotacion);
		
		
	}

	public List<Votacion> getAllVotaciones() {	

		return session.getCurrentSession().createQuery("from UsuarioItemPuntaje").list();
		 
		
		
	}
	


}
