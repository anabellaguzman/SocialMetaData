package com.socialmetadata.springsocial;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.socialmetadata.dao.AutorDAO;
import com.socialmetadata.model.Autor;

@Service
public class SocialUserService {
	
	@Autowired
	private SocialUserDAOImpl socialUserDAO;
	
	@Transactional
	public void addSocialUser(SocialUser socialUser) {
		socialUserDAO.add(socialUser);
	}

}
