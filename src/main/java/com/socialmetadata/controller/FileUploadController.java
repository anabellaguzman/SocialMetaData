package com.socialmetadata.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.socialmetadata.utilities.FileFormBean;

@Controller
@RequestMapping("fileUpload")
public class FileUploadController {
	
	static final ClassLoader loader = FileUploadController.class.getClassLoader();
	

	

    @RequestMapping(method = RequestMethod.GET)
//    public @ModelAttribute("fileFormBean") FileFormBean getInitialMessage() {
//        return new FileFormBean();
//    }
    
    public String getInitialMessage() {
        return "fileUpload";
    }
    
    
    
    
    public String guardaPortada(@ModelAttribute FileFormBean fileFormBean, HttpServletRequest request, String idFile, String folder) {
    	
    	String filePath = request.getServletContext().getRealPath("/"); 
    	filePath = filePath+folder;
    	
    	
//    	File fichero = new File("RUTA_DEL_ARCHIVO");
//        eliminarFichero(fichero);
    	
//    	File oldPortrait = new File(filePath+idFile);
//    	if (!oldPortrait.exists()) {
//            System.out.println("El archivo data no existe.");
//        } else {
//        	oldPortrait.delete();
//            System.out.println("El archivo data fue eliminado.");
//        }
    	
//    	System.out.println("ruta archivo existente"+filePath+folder+idFile);
//    	oldPortrait.delete();
    	
    	
    	System.out.println("FileUploadController: archivo path"+filePath+idFile);
    	
//    	/Users/Development/Documents/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SocialMetadata/    	
//    	multipartFile.transferTo(new File(filePath));
    	try {
			grabarPortadaALocal(fileFormBean, filePath, idFile );
		} catch (Exception e) {
			e.printStackTrace();
			return "No se ha podido grabar la portada";
		}
    	

    	System.out.println("Portada guardada correctamente");
    	return "Portada guardada correctamente";
    }
    

	private void grabarPortadaALocal(FileFormBean fileFormBean, String path, String imagen) throws Exception {
		
		

		CommonsMultipartFile file = fileFormBean.getPortrait();
//		String fileName = file.getOriginalFilename();
	 

//		String extension = FilenameUtils.getExtension(fileName);
    	File localFile = new File(path+imagen);

    	
    	FileOutputStream os = null;
    	
    	try {
    		
    		os = new FileOutputStream(localFile);
    		os.write(file.getBytes());
    		
    	} finally {
    		if (os != null) {
    			try {
					os.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
    		}
    	}
	}
    
 
    @RequestMapping(method = RequestMethod.POST)
    public @ModelAttribute("message") String guardaFichero(@ModelAttribute FileFormBean fileFormBean, HttpServletRequest request, int idFile, String folder) {
    	
    	String filePath = request.getServletContext().getRealPath("/"); 
    	filePath = filePath+folder;
    	
    	System.out.println(filePath);
    	
//    	/Users/Development/Documents/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SocialMetadata/    	
//    	multipartFile.transferTo(new File(filePath));
    	try {
			grabarFicheroALocal(fileFormBean, filePath, idFile );
		} catch (Exception e) {
			e.printStackTrace();
			return "No se ha podido grabar el fichero";
		}
    	

    	System.out.println("Fichero grabado correctamente");
    	return "Fichero grabado correctamente";
    }
    

	private void grabarFicheroALocal(FileFormBean fileFormBean, String path, int idFile) throws Exception {
		
		

		CommonsMultipartFile file = fileFormBean.getFichero();
		String fileName = file.getOriginalFilename();
	 

		String extension = FilenameUtils.getExtension(fileName);
    	File localFile = new File(path+idFile+"."+extension);

    	
    	FileOutputStream os = null;
    	
    	try {
    		
    		os = new FileOutputStream(localFile);
    		os.write(file.getBytes());
    		
    	} finally {
    		if (os != null) {
    			try {
					os.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
    		}
    	}
	}

}