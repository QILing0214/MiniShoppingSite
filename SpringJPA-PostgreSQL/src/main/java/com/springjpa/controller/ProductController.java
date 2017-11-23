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

import com.springjpa.model.Customer;
import com.springjpa.model.Product;
import com.springjpa.model.User;
import com.springjpa.repo.ProductRepository;
import com.springjpa.repo.UserRepository;
@RestController
public class ProductController {
	@Autowired
	ProductRepository repository;
	@RequestMapping(value = "/testPost2", method = RequestMethod.POST, produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity <Product> getCustomers(@RequestBody Product product1){
		
		Integer pid=product1.getPid()+1;
		Product product=repository.findOne(pid);
		return new ResponseEntity<Product>(product,HttpStatus.OK);
	}
	@RequestMapping(value = "/findallProductsByJson", method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity <List<Product>> getProducts(){
		List<Product> products=(List<Product>) repository.findAll();
		return new ResponseEntity<List<Product>>(products,HttpStatus.OK);
	}
	@RequestMapping("/findbyPname")
	public ResponseEntity <List<Product>> fetchDataByPame(@RequestParam("pname") String pName){
		
		
		List<Product> products=repository.findByPname(pName);
		return new ResponseEntity<List<Product>>(products,HttpStatus.OK);
	}
	@RequestMapping("/findbyCatalog")
	public ResponseEntity <List<Product>> fetchDataByCatalog(@RequestParam("catalog") String catalog){
		
		
		List<Product> products=repository.findByCatalog(catalog);
		return new ResponseEntity<List<Product>>(products,HttpStatus.OK);
	}
	@RequestMapping(value = "/findbyPid")
   public ResponseEntity <Product> fetchDataByPid(@RequestParam("pid") Integer pid){
		
		
		Product  products=repository.findOne(pid);
		return new ResponseEntity<Product>(products,HttpStatus.OK);
	}
	@RequestMapping("/findbyPnameContaining")
	public ResponseEntity <List<Product>> fetchDataByPameContaining(@RequestParam("pname") String pName){
		
		
		List<Product> products=repository.findByPnameIgnoreCaseContaining(pName);
		return new ResponseEntity<List<Product>>(products,HttpStatus.OK);
	}
	@RequestMapping("/findbyPnameCatalog")
	public ResponseEntity <List<Product>> fetchDataByPameCatalog(@RequestParam("pname") String pName,@RequestParam("catalog") String catalog){
		
		
		List<Product> products=repository.findByPnameIgnoreCaseContainingAndCatalog(pName,catalog);
		return new ResponseEntity<List<Product>>(products,HttpStatus.OK);
	}
}

