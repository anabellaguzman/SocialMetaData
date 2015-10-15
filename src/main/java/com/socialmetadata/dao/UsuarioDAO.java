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
	
	public Usuario getByUsername(String username) {

		List<Usuario> usuarios = new ArrayList<Usuario>();

		usuarios = session.getCurrentSession().createQuery("from usuario where username=?").setParameter(0, username).list();

		if (usuarios.size() > 0) {
			return usuarios.get(0);
		} else {
			return null;
		}

	}

//	public Usuario getUsuario(String login) {
//		
//		List<Usuario> userList = new ArrayList<Usuario>();
//		Query query = session.getCurrentSession().createQuery("from usuario u where u. = :login");
//		query.setParameter("login", login);
//		userList = query.list();
//		if (userList.size() > 0)
//			return userList.get(0);
//		else
//			return null;	
//		
//		
//	}
	
	public Usuario getUsuario(int idUsuario) {
		
		return (Usuario)session.getCurrentSession().get(Usuario.class, idUsuario);
		
		
	}

	

	public List<Usuario>getAllUsuarios() {
			
		
		return session.getCurrentSession().createQuery("from Usuario").list();
	}
	
	



}
