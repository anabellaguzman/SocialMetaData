package com.socialmetadata.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




import com.socialmetadata.model.AtributoItem;
import com.socialmetadata.model.Idioma;
import com.socialmetadata.model.ValorAtributoItem;
import com.socialmetadata.modeloDao.embebedPK.ValorAtributoItemEPK;


@Repository
public class IdiomaDAO {
	
	@Autowired
	private SessionFactory session;

	public void add(Idioma idioma) {
		session.getCurrentSession().save(idioma);
		
	}

	public void edit(Idioma idioma) {
		session.getCurrentSession().update(idioma);
		
	}

	public void delete(int idIdioma) {
		session.getCurrentSession().delete(getIdioma(idIdioma));
		
	}

	public Idioma getIdioma(int idIdioma) {
				
		return (Idioma)session.getCurrentSession().get(Idioma.class, idIdioma);
		
		
	}

	public List getAllIdiomas() {
			
		
		return session.getCurrentSession().createQuery("from Idioma").list();
	}
	
	
	public void valoratributomet(){
		
//		List lista;
//		AtributoItem ai;
//		
//		 lista = session.getCurrentSession().createQuery("from AtributoItem").list();
//		 
//			for(int i=0;i<lista.size();i++){
//				
//				ai=(AtributoItem)lista.get(i);
//				
//				System.out.println("NOMBRE ATRIBUTO ITEM "+ai.getNombre());
//			
//		}
		
			
			//-----------------------------------------------------------
		
//		AtributoItemEPK aiepk = new AtributoItemEPK(1, 1);
//		AtributoItem ai = new AtributoItem();
//		
//		ai =  (AtributoItem)session.getCurrentSession().get(AtributoItem.class, aiepk);
//		System.out.println("EL VALOR ES: "+ ai.getNombre());
		
		
		
		//----------------------------------------------
		
//		System.out.println("HOLA");
		
//		ValorAtributoItemEPK vaiepk = new ValorAtributoItemEPK(1,1);
//		ValorAtributoItem vai = new ValorAtributoItem();
//				
//		vai = (ValorAtributoItem)session.getCurrentSession().get(ValorAtributoItem.class, vaiepk);
//		vai.getValor();
//		
//		System.out.println("EL VALOR ES: "+ vai.getValor());
		
		
	}

}
