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


import com.socialmetadata.dao.LoginDAO;
import com.socialmetadata.model.Rol;
import com.socialmetadata.model.Usuario;

@Service("loginService")
public class LoginServiceImpl implements UserDetailsService{

	@Autowired
	LoginDAO loginDao;
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		Usuario user = loginDao.findByUserName(username);

		List<GrantedAuthority> authorities = buildUserAuthority(user.getRoles());

		return buildUserForAuthentication(user, authorities);
		
	}
	
	private User buildUserForAuthentication(Usuario user,
			List<GrantedAuthority> authorities) {
		return new User(user.getUsername(), user.getPassword(),
				user.isEnabled(), true, true, true, authorities);
	}
	
	private List<GrantedAuthority> buildUserAuthority(Set<Rol> userRoles) {

		Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();

		// Build user's authorities
		for (Rol rol : userRoles) {
			setAuths.add(new SimpleGrantedAuthority(rol.getRol()));
		}

		List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(
				setAuths);

		return Result;
	}

}
