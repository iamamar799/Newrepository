package com.hr.helpdesk.models;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Ticket {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String subject;
	private String description;
	private String status;
	private String solution;
	@ManyToOne
	@JoinColumn(name = "createdby")
	private User createdby;
	@ManyToOne
	@JoinColumn(name = "handleby")
	private User handleby;
	private LocalDate createdon;
	@ManyToOne
	@JoinColumn(name = "parentid")
	private Ticket parentid;
	
	public Ticket() {
		this.status="Pending";
		this.createdon=LocalDate.now();
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSolution() {
		return solution;
	}
	public void setSolution(String solution) {
		this.solution = solution;
	}
	public User getCreatedby() {
		return createdby;
	}
	public void setCreatedby(User createdby) {
		this.createdby = createdby;
	}
	public LocalDate getCreatedon() {
		return createdon;
	}
	public void setCreatedon(LocalDate createdon) {
		this.createdon = createdon;
	}
	
	public Ticket getParentid() {
		return parentid;
	}
	public void setParentid(Ticket parentid) {
		this.parentid = parentid;
	}
	public User getHandleby() {
		return handleby;
	}
	public void setHandleby(User handleby) {
		this.handleby = handleby;
	}
	@Override
	public String toString() {
		return "Ticket [id=" + id + ", subject=" + subject + ", description=" + description + ", status=" + status
				+ ", solution=" + solution + ", createdby=" + createdby + ", createdon=" + createdon + ", parentid="
				+ parentid + "]";
	}
	
	
}
