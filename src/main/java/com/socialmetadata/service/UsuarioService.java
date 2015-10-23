package com.socialmetadata.service;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.socialmetadata.dao.UsuarioDAO;
import com.socialmetadata.model.Rol;
import com.socialmetadata.model.Usuario;

@Service
public class UsuarioService {

	@Autowired
	private UsuarioDAO usuarioDAO;

	@Transactional
	public Usuario getUsuario(int idUsuario) {
		return usuarioDAO.getUsuario(idUsuario);
	}

	@Transactional
	public Usuario getByUsername(String username) {
	
		List<Usuario> usuarioL = usuarioDAO.getByUsername(username);
	
		Usuario u = usuarioL.get(0);
		for (Rol r : u.getRoles()){
//			System.out.println("Rol: "+ r.getRol());
			r.getRol();
		}
	
		return u;

	}

}
