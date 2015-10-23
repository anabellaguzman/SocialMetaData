package com.socialmetadata.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.socialmetadata.model.Rol;

@Repository
public class RolDAO {
	
	@Autowired
	private SessionFactory session;
	
	public void add(Rol rol) {
		session.getCurrentSession().save(rol);
		
	}
	
	public void edit(Rol rol) {
		session.getCurrentSession().update(rol);
		
	}

	public void delete(int idRol) {
		session.getCurrentSession().delete(getRol(idRol));
		
	}

	public Rol getRol(int idRol) {
				
		return (Rol)session.getCurrentSession().get(Rol.class, idRol);
		
		
	}

	public List<Rol>getAllRoles() {
			
		
		return session.getCurrentSession().createQuery("from Rol").list();
	}
	

}
