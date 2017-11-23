package com.springjpa.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import com.springjpa.model.User;

import com.springjpa.repo.UserRepository;
@RestController
public class LoginController {
	@Autowired
	UserRepository repository;
	@RequestMapping(value = "/testPost", method = RequestMethod.POST, produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity <User> testPost(@RequestBody User user1){
		
		Integer uid=user1.getUid()+1;
		User user=repository.findOne(uid);
		return new ResponseEntity<User>(user,HttpStatus.OK);
	}
	@RequestMapping(value = "/findallUsersByJson", method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity <List<User>> findAllProducts(){
		List<User> users=(List<User>) repository.findAll();
		return new ResponseEntity<List<User>>(users,HttpStatus.OK);
	}
	@RequestMapping("/findbyUname")
	public String fetchDataByUname(@RequestParam("uname") String uName){
		String result = "<html>";
		
		User user=repository.findByUname(uName);
	    result += "<div>" + user.getPasswd() + "</div>"; 
		
		
		return result + "</html>";
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String checkLogin(@RequestParam("uname") String uname,@RequestParam("passwd") String passwd){
		
		String Uname=uname;
		String PASSWD=passwd;
		
		User user=repository.findByUname(Uname);
		if(user!=null&&user.getPasswd().equals(PASSWD)) {
		  return "{\"result\": \"good\"}";
	}else {
		return "{\"result\": \"error\"}";
	}
 }
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ResponseEntity <User>saveUser(@RequestParam("uname") String uname,@RequestParam("passwd") String passwd,@RequestParam("email") String email){
		
		String Uname=uname;
		String PASSWD=passwd;
		String Email=email;
		
		User user=new User();
		user.setEmail(Email);
		user.setPasswd(PASSWD);
		user.setUname(Uname);
		
		return new ResponseEntity<User>(repository.save(user),HttpStatus.OK);
		
		
		
 }
}

