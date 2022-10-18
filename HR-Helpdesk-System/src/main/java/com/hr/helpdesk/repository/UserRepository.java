package com.hr.helpdesk.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hr.helpdesk.models.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
	List<User> findByReportto(User user);
}
