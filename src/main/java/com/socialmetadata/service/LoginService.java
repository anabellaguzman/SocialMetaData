package com.socialmetadata.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.socialmetadata.model.Rol;
import com.socialmetadata.model.Usuario;

@Service("loginService")
public class LoginService implements UserDetailsService {
	
	@Autowired
	UsuarioService usuarioService;

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		
		Usuario usuario = usuarioService.getByUsername(username);
		List<GrantedAuthority> authorities = buildUserAuthority(usuario.getRoles());
		
		return buildUserForAuthentication(usuario, authorities);
	}
	
	private User buildUserForAuthentication(Usuario u,
			List<GrantedAuthority> authorities) {
		return new User(u.getUsername(), u.getPassword(),
				u.isEnabled(), true, true, true, authorities);
	}
	
	private List<GrantedAuthority> buildUserAuthority(Set<Rol> roles) {

		Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();

		// Build user's authorities
		for (Rol r : roles) {
			setAuths.add(new SimpleGrantedAuthority(r.getRol()));
		}

		List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(
				setAuths);

		return Result;
	}
	
	
	
	

}
