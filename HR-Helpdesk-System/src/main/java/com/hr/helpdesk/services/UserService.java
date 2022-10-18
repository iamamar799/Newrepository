package com.hr.helpdesk.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hr.helpdesk.models.User;
import com.hr.helpdesk.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository repo;
	
	public void saveUser(User user) {
		repo.save(user);
	}
	
	public void deleteUser(String userid)
	{
		repo.delete(repo.getById(userid));
	}
	
	public User findById(String userid) {
		return repo.getById(userid);
	}
	
	public List<User> listall(){
		return repo.findAll();
	}
	
	public List<User> hrusers(String userid){
		return repo.findByReportto(repo.getById(userid));
	}
	
	public User validate(String userid,String password) {
		if(repo.existsById(userid)) {
			User user=repo.getById(userid);
			if(user.getPassword().equals(password))
				return user;
		}
		return null;
	}
}
