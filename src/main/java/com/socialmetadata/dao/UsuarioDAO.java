package com.socialmetadata.dao;

import java.util.ArrayList;
import java.util.List;


import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.socialmetadata.model.Usuario;


@Repository
public class UsuarioDAO {

	
	@Autowired
	private SessionFactory session;

	public void add(Usuario usuario) {
		session.getCurrentSession().save(usuario);
		
	}

	public void edit(Usuario usuario) {
		session.getCurrentSession().update(usuario);
		
	}

	public void delete(int idUsuario) {
		session.getCurrentSession().delete(getUsuario(idUsuario));
		
	}
	
	public List<Usuario> getByUsername(String username) {

		List<Usuario> usuarios = new ArrayList<Usuario>();
		usuarios = session.getCurrentSession().createQuery("FROM Usuario WHERE username = '"+username+"'").list();	
		return usuarios;
	}

	
	public Usuario getUsuario(int idUsuario) {
		
		return (Usuario)session.getCurrentSession().get(Usuario.class, idUsuario);
		
		
	}

	

	public List<Usuario>getAllUsuarios() {
			
		
		return session.getCurrentSession().createQuery("from Usuario").list();
	}
	

	
	



}
