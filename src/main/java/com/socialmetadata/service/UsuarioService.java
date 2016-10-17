package com.socialmetadata.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.socialmetadata.dao.RolDAO;
import com.socialmetadata.dao.UsuarioDAO;
import com.socialmetadata.model.Autor;
import com.socialmetadata.model.Item;
import com.socialmetadata.model.Rol;
import com.socialmetadata.model.Usuario;
import com.socialmetadata.model.ValorAtributoItem;
import com.socialmetadata.utilities.PasswordEncoderGenerator;

@Service
public class UsuarioService {

	@Autowired
	private UsuarioDAO usuarioDAO;
	
	@Autowired
	private RolDAO rolDAO;

	@Transactional
	public Usuario getUsuario(int idUsuario) {
		return usuarioDAO.getUsuario(idUsuario);
	}

	@Transactional
	public Usuario getByUsername(String username) {
	
		List<Usuario> usuarioL = usuarioDAO.getByUsername(username);
		
		
		
//		Usuario u = usuarioL.get(0);
		
		if(usuarioL.size()==0){
			
			System.out.println("size =0 usuarioService getbyusername");
			
			return null;
		}
		
		else{
			Usuario u = usuarioL.get(0);
			for (Rol r : u.getRoles()){
//				System.out.println("Rol: "+ r.getRol());
				r.getRol();
			}
			
			return u;
		}

//		Usuario u = new Usuario();
//		return u;

	}
	
	@Transactional
	public Usuario getFavoritos(int idUsuario) {
		
		System.out.println("usuario Service ");
		Usuario u = usuarioDAO.getUsuario(idUsuario);		
		u.getItemsFavoritos();

		
		for (Item i : u.getItemsFavoritos()) {
			
//			i.getIdItem();
			i.getTitulo();
		}



		return u;
	}
	
	
	@Transactional
	public void update(Usuario usuario) {
		
		usuarioDAO.update(usuario);
		
	}
	
	@Transactional
	public void add(Usuario usuario) {
		
//		Rol rol = rolDAO.getRol(1);
//		Set<Rol> roles = new HashSet<Rol>();
//		roles.add(rol);
//		
////		String password = usuario.getPassword();	
////		password = PasswordEncoderGenerator.encodePassword(password);
////		usuario.setPassword(password);	
//		usuario.setRoles(roles);
		
		
		usuarioDAO.add(usuario);
		
		
		
		
		
		
	}

}
