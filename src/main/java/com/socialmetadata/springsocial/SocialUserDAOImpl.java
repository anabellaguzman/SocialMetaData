package com.socialmetadata.springsocial;

import java.util.List;
import java.util.Set;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.MultiValueMap;

import com.socialmetadata.model.Usuario;

@Repository
public class SocialUserDAOImpl{
	
	@Autowired
	private SessionFactory session;
	
	
	
	public void add(SocialUser socialUser) {
		session.getCurrentSession().save(socialUser);
		
	}
//
//	@Override
//	public List<SocialUser> findByUserId(String userId) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public List<SocialUser> findByUserIdAndProviderId(String userId,
//			String providerId) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public List<SocialUser> findByUserIdAndProviderUserIds(String userId,
//			MultiValueMap<String, String> providerUserIds) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public SocialUser get(String userId, String providerId,
//			String providerUserId) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public List<SocialUser> findPrimaryByUserIdAndProviderId(String userId,
//			String providerId) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public Integer selectMaxRankByUserIdAndProviderId(String userId,
//			String providerId) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public List<String> findUserIdsByProviderIdAndProviderUserId(
//			String providerId, String providerUserId) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public List<String> findUserIdsByProviderIdAndProviderUserIds(
//			String providerId, Set<String> providerUserIds) {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
