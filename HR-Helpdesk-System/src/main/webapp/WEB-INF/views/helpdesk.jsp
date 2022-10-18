<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="cheader.jsp"></jsp:include>
<div class="container-fluid">
	<div class="card shadow my-2">
		<div class="card-body">
		<h4 class="p-2 font-weight-bold my-1" style="border-bottom: 2px solid orange;">Help Desk</h4>
		<button type="button" class="btn btn-primary btn-sm float-right"
data-toggle="modal" data-target="#exampleModal">
											New Ticket</button>
			<h4 class="p-2 text-center" style="border-bottom: 2px solid blue">All
				Tickets</h4>
			<table class="table table-bordered table-sm">
				<thead>
					<tr>
					<th>Ticket#</th>
						<th>Query Date</th>
						<th>Subject</th>
						<th>Message</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list }" var="m">
						<tr>
						<td>${m.id }</td>
							<td>${m.createdon }</td>
							<td>${m.subject }</td>
							<td>
							${m.description }
							<c:if test="${m.status=='Processed' or m.status=='Reopen'}">
							<h5>Reply from HelpDesk</h5>
							<h6>${m.solution }</h6>
							</c:if>
							</td>
							<td>${m.status }</td>
							<td>
							<c:choose>
							<c:when test="${m.status=='Pending' }">
								<a href="delticket/${m.id }" onclick="return confirm('Are you sure you want to delete this ticket?')" class="btn btn-danger btn-sm">Cancel</a>
								</c:when>
							<c:when test="${m.status=='Processed' }">
								<button type="button" class="btn btn-success btn-sm"
											data-toggle="modal" data-target="#m${m.id }">
											Reopen</button>
											
							<div class="modal fade" id="m${m.id }" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<form method="post" action="reopen">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Ticket Reopen</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<div class="form-group">
												<input type="hidden" value="${m.id }" name="id"> <label
													class="p-2">Subject</label> <input type="text" readonly
													name="subject" value="Reopen: ${m.subject }" class="form-control form-control-sm">
											</div>
											<div class="form-group">
												<label class="p-2">Reason</label>
												<textarea required name="reason" class="form-control form-control-sm"
													rows="5"></textarea>
											</div>
										</div>
										<div class="modal-footer">
											<input type="submit" value="Save Reply" class="btn btn-primary btn-sm">
										</div>
									</form>
								</div>
							</div>
						</div>
								</c:when>
								</c:choose>
							</td>
						</tr>
                    </c:forEach>
				</tbody>
			</table>
			
			<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form method="post">
			<input type="hidden" name="createdby" value="${sessionScope.userid }">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Create Ticket</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label class="p-2">Subject</label> <!-- <input type="text" required
							name="subject" class="form-control form-control-sm"> -->
							
							<select name="subject" required class="form-control form-control-sm">
							<option value="">Select Reason</option>
							<option>Attendance</option>
							<option>Access</option>
							<option>Allowance</option>
							<option>Assets</option>
							<option>Contract</option>
							<option>IJP</option>
							<option>Expenses/Reimbursement</option>
							<option>Report an issue</option>
							<option>Salary Related</option>
						</select>
					</div>
					<div class="form-group">
						<label class="p-2">Message</label>
						<textarea required name="description" class="form-control form-control-sm"
							rows="5"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary btn-sm">Save changes</button>
				</div>
			</form>
		</div>
	</div>
</div>
		</div>
	</div>
</div>
</body>
</html>