<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="cheader.jsp"></jsp:include>
<div class="container-fluid">
<h5 class="p-2" style="border-bottom: 2px solid orange;">Help Desk
		Tickets</h5>
	<div class="row">
		<div class="col-sm-12">
			<table class="table table-bordered table-sm">
				<thead class="table-dark">
					<tr>
						<th>Ticket#</th>
						<th>Ticket Date</th>
						<th>Employee Name</th>
						<th>Subject</th>
						<th style="width: 300px">Message</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="m">
						<tr bgcolor="white">
							<td>${m.id }</td>
							<td>${m.createdon }</td>
							<td>${m.createdby.uname }</td>
							<td>${m.subject }</td>
							<td>
							${m.description }
							<c:if test="${m.status=='Processed'}">
							<h6>Reply from HelpDesk</h6>
							<p>${m.solution }</p>
							</c:if>
							</td>
							<td>${m.status }</td>
							<td>
							<c:if test="${m.status == 'Pending' }">
							<button type="button" class="btn btn-success btn-sm"
											data-toggle="modal" data-target="#m${m.id }">
											Reply</button>
											
							<div class="modal fade" id="m${m.id }" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<form method="post">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Ticket Reply</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<div class="form-group">
												<input type="hidden" value="${m.id }" name="id"> <label
													class="p-2">Subject</label> <input type="text" readonly
													name="subject" value="${m.subject }" class="form-control form-control-sm">
											</div>
											<div class="form-group">
												<label class="p-2">Reply</label>
												<textarea required name="reply" class="form-control form-control-sm"
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
							</c:if>
						</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>		
	</div>
	</div>
	</body>
	</html>