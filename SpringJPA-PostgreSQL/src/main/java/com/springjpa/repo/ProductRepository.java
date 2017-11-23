package com.springjpa.repo;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;


import com.springjpa.model.Product;

public interface ProductRepository extends CrudRepository<Product, Integer> {
	List<Product> findByPname(String pname);
	List<Product> findByCatalog(String catalog);
	List<Product> findByPrice(double price);
	List<Product> findByPhoto(String photo);
	List<Product> findByDescription(String description);
	List<Product> findByDetail(String detail);
    List<Product> findByPnameIgnoreCaseContaining(String pname);
    
   //?? @Query("select p from product p  where UPPER(p.pname) like UPPER(%?1)" and p.catalog=?1)
   
    List<Product> findByPnameIgnoreCaseContainingAndCatalog(String pname,String catalog);

}
