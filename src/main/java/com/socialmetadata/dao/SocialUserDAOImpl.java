package com.socialmetadata.dao;

import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Repository;
import org.springframework.util.MultiValueMap;

import com.socialmetadata.model.SocialUser;

@Repository
public class SocialUserDAOImpl implements SocialUserDAO{

	@Override
	public List<SocialUser> findByUserId(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SocialUser> findByUserIdAndProviderId(String userId,
			String providerId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SocialUser> findByUserIdAndProviderUserIds(String userId,
			MultiValueMap<String, String> providerUserIds) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SocialUser get(String userId, String providerId,
			String providerUserId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SocialUser> findPrimaryByUserIdAndProviderId(String userId,
			String providerId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer selectMaxRankByUserIdAndProviderId(String userId,
			String providerId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> findUserIdsByProviderIdAndProviderUserId(
			String providerId, String providerUserId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> findUserIdsByProviderIdAndProviderUserIds(
			String providerId, Set<String> providerUserIds) {
		// TODO Auto-generated method stub
		return null;
	}

}
