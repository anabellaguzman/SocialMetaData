package com.socialmetadata.utilities;

import java.util.Comparator;

import com.socialmetadata.model.Posteo;

public class PostIdComparator implements Comparator<Posteo>{

	@Override
	public int compare(Posteo o1, Posteo o2) {
		// TODO Auto-generated method stub
		return o1.getIdPosteo()-o2.getIdPosteo();
	}

}



