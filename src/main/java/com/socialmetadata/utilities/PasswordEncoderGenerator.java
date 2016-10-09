package com.socialmetadata.utilities;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncoderGenerator {

	public static String encodePassword(String password) {

		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(password);

//		System.out.println(hashedPassword);

		return hashedPassword;

	}
}
