package com.hr.helpdesk.controllers;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hr.helpdesk.models.Ticket;
import com.hr.helpdesk.services.TicketService;
import com.hr.helpdesk.services.UserService;

@Controller
public class UserController {

	@Autowired private TicketService tservice;
	@Autowired private UserService uservice;
	@Autowired private HttpSession session;
	
	@GetMapping("/helpdesk")
	public String addticket(Model model) {
		String userid=session.getAttribute("userid").toString();
		model.addAttribute("list", tservice.userTickets(uservice.findById(userid)));
		return "helpdesk";
	}
	
	@PostMapping("/reopen")
	public String reopenticket(int id,String subject,String reason) {
		tservice.reopenTicket(id,subject,reason);
		return "redirect:/helpdesk";
	}
	
	@PostMapping("/helpdesk")
	public String saveTicket(Ticket ticket,RedirectAttributes ra) {
		tservice.saveTicket(ticket);
		ra.addFlashAttribute("msg", "Ticket raised successfully");
		return "redirect:/helpdesk";
	}
	
	@GetMapping("/delticket/{id}")
	public String deleteticket(@PathVariable("id")int id) {
		tservice.deleteTicket(id);
		return "redirect:/helpdesk";
	}
}
