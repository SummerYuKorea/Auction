package edu.spring.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import edu.spring.service.ImageService;
import edu.spring.util.FileUploadUtil;
import edu.spring.util.MediaUtil;
import edu.spring.vo.ProductImageVO;

@Controller
public class FileUploadController {
   
   private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
   
   // servlet-context.xml 파일에 설정된 문자열 리소스를 주입(inject)
   @Resource(name = "uploadPath") // 서블릿-컨텍스트에서 설정해준 id
   private String uploadPath;
   
   
   private String uploadPath_profile;
   
   @RequestMapping(value = "/upload", method = RequestMethod.GET)
   public void uploadGet() {
      logger.info("uploadGet() 호출");
   }
   
   @RequestMapping(value = "/upload", method = RequestMethod.POST)
   public void uploadPOST(MultipartFile file, Model model) { // upload.jsp에서 name을 file로 줬으니 그대로 이름 써줘서 받아옴
      logger.info("uploadPOST() 호출");
      logger.info("파일 이름: " + file.getOriginalFilename());
      logger.info("파일 크기: " + file.getSize());
      
      String savedFile = saveUploadFile(file);
      model.addAttribute("savedFile", savedFile);
   }
   
   private String saveUploadFile(MultipartFile source) {
      // UUID: 업로드하는 파일 이름이 중복되지 않도록
      UUID uuid = UUID.randomUUID();
      String savedName = uuid + "_" + source.getOriginalFilename();
      File target = new File(uploadPath, savedName);
      try {
         FileCopyUtils.copy(source.getBytes(), target);
         logger.info("파일 저장 성공: " + savedName);
         
         return savedName;
      } catch (IOException e) {
         logger.error("실패지롱~~~~(데헷)");
         
         return null;
      }
   }
   
   @RequestMapping(value = "/upload2", method = RequestMethod.POST)
   public String uploadPost2(MultipartFile[] files, Model model) {
      logger.info("uploadPost2() 호출: 파일개수=" + files.length);
      
      String result = "";
      for(MultipartFile f : files) {
         result += saveUploadFile(f) + " ";
      }
      model.addAttribute("savedFile", result);
      
      return "upload";
   }
   
   @RequestMapping(value = "/upload-ajax", method = RequestMethod.GET)
   public void uploadAjaxGet() {
      logger.info("uploadAjaxGet() 호출");
   }
   
  
   
   @RequestMapping(value = "/upload-ajax", method = RequestMethod.POST)
   public ResponseEntity<String> uploadAjaxPost(MultipartFile[] files, Model model, HttpServletRequest req) {
      logger.info("uploadAjaxPost() 호출");
      /*
      String result = "";
      for (MultipartFile f : files) {
         logger.info(f.getOriginalFilename());
         result += saveUploadFile(f) + " ";
      }
      */
      // userid는 널이어선 안돼~(얘도 또 따로 interceptor에 mapping할까?)
      String userid= (String)req.getSession().getAttribute("login_id");
      // 파일 하나만 저장
      String result = null;
      try {
         result = FileUploadUtil.saveUploadedFile(uploadPath, userid , files[0].getOriginalFilename(), files[0].getBytes());
         System.out.println(result); // /aaaaa/temp/s_027a65d6-6699-4d13-a217-78732343d16f_A_login_01.gif
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
     // ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
      ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
            
      return entity;
   }
   
   @RequestMapping(value = "/display", method = RequestMethod.GET)
   public ResponseEntity<byte[]> display(String fileName) throws IOException {
      logger.info("display() 호출");
      
      // 리턴 타입
      ResponseEntity<byte[]> entity = null;
      // 저장된 파일 스트림
      InputStream in = null;
      String filePath = uploadPath + fileName;
      System.out.println("fileName은 "+fileName);// /summer/temp/s_f16059c6-067b-4040-86df-bd46d85f679f_login_kakao.jpg
      in = new FileInputStream(filePath);
      
      // 파일 확장자
      String extension = filePath.substring(filePath.lastIndexOf(".") + 1);
      // 응답 해더(response header)에 Content-Type을 설정해야 하기 때문에
      HttpHeaders httpHeaders = new HttpHeaders();
      httpHeaders.setContentType(MediaUtil.getMediaType(extension));
      
      // ResponseEntity 객체에
      entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),// 파일에서 읽은 데이
    		   httpHeaders, // 응답 헤더
    		   HttpStatus.OK); // 응답 코드
      
      return entity;
   }
   
   
}