package com.socialmetadata.dao;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.socialmetadata.model.Votacion;
import com.socialmetadata.modeloDao.embebedPK.VotacionEPK;

@Repository
public class VotacionDAO {
	
	@Autowired
	private SessionFactory session;

	public void add(Votacion votacion) {
		session.getCurrentSession().save(votacion);
	}

	public void edit(Votacion votacion) {
		
		Votacion votoDB = getVotacion(votacion.getVotacionPK());
		
		
		if (votoDB == null){
			System.out.println("voto es null");
			add(votacion);
		}
		
		else{
			
			System.out.println("actualizar votoDB con puntaje de votacion");
			votoDB.setPuntaje(votacion.getPuntaje());
			session.getCurrentSession().update(votoDB);
			
		}
		
		
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
