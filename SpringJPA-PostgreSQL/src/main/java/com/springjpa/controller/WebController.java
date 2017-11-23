package com.springjpa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.springjpa.model.Customer;
import com.springjpa.repo.CustomerRepository;

@RestController
public class WebController {
	@Autowired
	CustomerRepository repository;
	
	@RequestMapping("/save")
	public String process(){
		repository.save(new Customer("Jack", "Smith"));
		repository.save(new Customer("Adam", "Johnson"));
		repository.save(new Customer("Kim", "Smith"));
		repository.save(new Customer("David", "Williams"));
		repository.save(new Customer("Peter", "Davis"));
		return "Done";
	}
	
//	@RequestMapping("/findall")
//	public String findAll(){
//		String result = "<html>";
//		
//		for(Customer cust : repository.findAll()){
//			result += "<div>" + cust.toString() + "</div>";
//		}
//		
//		return result + "</html>";
//	}
	
	
	@RequestMapping(value = "/findall2", method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_VALUE})
	public Customer findAll2(@RequestParam("id") long id){

		return repository.findOne(id);
		//String result = repository.findOne(id).toStringJson() ;
		
		//return result;
	}
	
	@RequestMapping(value = "/findallByJson", method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity <List<Customer>> getCustomers(){
		List<Customer> customers=(List<Customer>) repository.findAll();
		return new ResponseEntity<List<Customer>>(customers,HttpStatus.OK);
	}
	
	
	@RequestMapping("/findall")
	public String findAll(){
		String result = "<html>";
		
		for(Customer cust : repository.findAll()){
			result += "<div>" + cust.toString() + "</div>";
		}
		
		return result + "</html>";
	}
	
	@RequestMapping("/findbyid")
	public String findById(@RequestParam("id") long id){
		String result = "";
		result = repository.findOne(id).toString();
		return result;
	}
	
	@RequestMapping("/findbylastname")
	public String fetchDataByLastName(@RequestParam("lastname") String lastName){
		String result = "<html>";
		
		for(Customer cust: repository.findByLastName(lastName)){
			result += "<div>" + cust.toString() + "</div>"; 
		}
		
		return result + "</html>";
	}
	
	@RequestMapping("/deletebyid")
	public String deleteById(@RequestParam("id") long id){
		
		repository.delete(id);
		return "Done";
	}
}

