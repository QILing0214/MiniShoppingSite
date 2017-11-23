package com.springjpa.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;


import com.springjpa.model.User;

public interface UserRepository extends CrudRepository<User, Integer> {
	User findByUname(String uname);
	//List<User> findByUname(String uname);

}
