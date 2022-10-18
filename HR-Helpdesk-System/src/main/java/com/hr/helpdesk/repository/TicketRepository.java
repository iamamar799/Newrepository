package com.hr.helpdesk.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hr.helpdesk.models.Ticket;
import com.hr.helpdesk.models.User;

@Repository
public interface TicketRepository extends JpaRepository<Ticket, Integer> {
	
	List<Ticket> findByCreatedby(User user);
	List<Ticket> findByHandleby(User user);

}
