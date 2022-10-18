package com.hr.helpdesk.controllers;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hr.helpdesk.models.Ticket;
import com.hr.helpdesk.models.User;
import com.hr.helpdesk.services.TicketService;
import com.hr.helpdesk.services.UserService;

@Controller
public class HrHeadController {

	@Autowired private UserService uservice;
	@Autowired private TicketService tservice;
	@Autowired private HttpSession session;
	
	@GetMapping("")
	public String home() {
		return "index";
	}
	
	@PostMapping("")
	public String validate(String userid,String pwd,RedirectAttributes ra) {
		User user=uservice.validate(userid, pwd);
		if(user==null) {
			ra.addFlashAttribute("error", "Invalid username or password");
			return "redirect:/";
		}else {
			session.setAttribute("uname", user.getUname());
			session.setAttribute("userid", user.getUserid());
			session.setAttribute("role", user.getRole());
			session.setAttribute("edit", user.isAllowedit());
			return "redirect:/dashboard";
		}
	}
	
	@GetMapping("dashboard")
	public String dashboard() {
		return "dashboard";
	}
	
	@GetMapping("/tickets")
	public String tickets(Model model) {
		if(session.getAttribute("role").equals("HR Head")) {
			model.addAttribute("list", tservice.alltickets());
		}else {
			model.addAttribute("list", tservice.handlerTickets(uservice.findById(session.getAttribute("userid").toString())));
		}
			
		return "tickets";
	}
	
	@GetMapping("edit/{id}")
	public String edituser(@PathVariable("id") String id,Model model) {
		model.addAttribute("user", uservice.findById(id));
		return "edituser";
	}
	
	@PostMapping("edit/{id}")
	public String updateUser(@PathVariable("id") String id,User user) {
		User existuser=uservice.findById(id);
		user.setPassword(existuser.getPassword());
		user.setReportto(existuser.getReportto());
		uservice.saveUser(user);
		return "redirect:/users";
	}
	
	/*
	 * @GetMapping("delete/{id}") public String deleteuser(@PathVariable("id")
	 * String id,Model model) { model.addAttribute("user", uservice.findById(id));
	 * return "deleteuser"; }
	 */
	
	@GetMapping("/delete/{id}")
	public String deleteuser(@PathVariable("id") String userid)
	{
		User existuser=uservice.findById(userid);
		
		uservice.deleteUser(userid);
		return "redirect:/users";
		
	}
	
	@PostMapping("/tickets")
	public String saveReply(int id,String reply) {
		Ticket ticket=tservice.findById(id);
		ticket.setSolution(reply);
		ticket.setStatus("Processed");
		tservice.saveTicket(ticket);
		return "redirect:/tickets";
	}
	
	@GetMapping("register")
	public String register(Model model) {
		model.addAttribute("users", uservice.listall());
		return "register";
	}
	
	@PostMapping("/register")
	public String registerprocess(User user,RedirectAttributes ra) {
		uservice.saveUser(user);
		return "redirect:/users";
	}
	
	@GetMapping("/users")
	public String users(Model model) {
		if(session.getAttribute("role").equals("HR Head"))
			model.addAttribute("list", uservice.listall());
		else
			model.addAttribute("list",uservice.hrusers(session.getAttribute("userid").toString()));
		return "users";
	}
	
	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}
}
