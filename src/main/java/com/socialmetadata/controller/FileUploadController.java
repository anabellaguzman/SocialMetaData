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
    	
//    	getFile();
    	return "Fichero grabado correctamente";
    }
    
//    public static String getCleanPath() {
////        ClassLoader classLoader = FileUploadController.class.getClassLoader();
//        File classpathRoot = new File(loader.getResource("").getPath());
//
//        return classpathRoot.getPath();
//    }
    
//    private void getFile(){
//    	
//		System.out.println("Obtener imagen");
//		System.out.println(loader.getResource("IMG_0662.JPG"));
//
//    	
//    }
// 
	private void grabarFicheroALocal(FileFormBean fileFormBean, String path, int idFile) throws Exception {
		
		

		CommonsMultipartFile file = fileFormBean.getFichero();
		String fileName = file.getOriginalFilename();
	 

		String extension = FilenameUtils.getExtension(fileName);
//    	File localFile = new File(path+"resources/images/"+idFile+"."+extension);
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
		
		
		
//		System.out.println("Obtener imagen");
//		System.out.println(loader.getResource("IMG_0662.JPG"));
//		
//		
//		URL url = loader.getResource("IMG_0662.JPG");
//		
//		System.out.println(url);
//		
//		System.out.println("METHOD");
//		
//		System.out.println(getCleanPath());

//		// in some function
//		loader.getResource("images/my-image.png");
//		loader.getResource("xml/my-schema.xsd");
//		loader.getResource("conf/log4j.conf");
//		File f=  new File(config.getServletContext().getRealPath
		
		//NO
//		String curDir = System.getProperty("user.dir");
//		
//		System.out.println("CUR DIR: "+ curDir);
//		
//		System.out.println(FileUploadController.class.getProtectionDomain().getCodeSource().getLocation());
//		
//		System.out.println(this.getClass().getResource("HOLA"));
//		
//		
//		//NO
//		File fichero = new File("fichero.txt");
//		System.out.println(fichero.getAbsolutePath());
//		
//		CommonsMultipartFile uploaded = fileFormBean.getFichero();
////    	File localFile = new File("/Users/Development/Desktop/"+uploaded.getOriginalFilename());
////    	new File("imagenes/imagen2.jpg")
//    	
//    	File localFile = new File("images/"+uploaded.getOriginalFilename());
//    	
//    	FileOutputStream os = null;
		
		
		
		
		
		
		
//		CommonsMultipartFile uploaded = fileFormBean.getFichero();
//    	File localFile = new File(getCleanPath()+"/"+uploaded.getOriginalFilename());
//		
//    	FileOutputStream os = null;
///   	
//    	try {
//    		
//    		os = new FileOutputStream(localFile);
//    		os.write(uploaded.getBytes());
//    		
//    	} finally {
//    		if (os != null) {
//    			try {
//					os.close();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//    		}
//    	}
}