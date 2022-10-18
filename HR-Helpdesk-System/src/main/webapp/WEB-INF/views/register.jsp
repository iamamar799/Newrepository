<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:include page="cheader.jsp"></jsp:include>
<div class="container-fluid">
	<div class="row">
			<div class="col-sm-4 mx-auto mt-2">
				<div class="card shadow">
					<div class="card-header text-center bg-success text-white">
						<h5>User Registration</h5>
					</div>
					<div class="card-body">
						<form method="post">
						<div class="form-group">
						<label>Name</label>
						<input type="text" name="uname" required class="form-control">
						</div>
						<div class="form-group">
						<label>Phone</label>
						<input type="text" maxlength="10" name="phone" required class="form-control">
						</div>
						<div class="form-group">
						<label>Email</label>
						<input type="email" name="userid" required class="form-control">
						</div>
						<div class="form-group">
						<label>Gender</label>
						<select name="gender" required class="form-control">
							<option value="">Select Gender</option>
							<option>Male</option>
							<option>Female</option>
						</select>
						</div>
						<div class="form-group">
						<label>Role</label>
						<select name="role" required class="form-control">
							<option value="">Select Role</option>
							<option>HR</option>
							<option>Employee</option>
						</select>
						</div>
						<div class="form-group">
						<label>Department</label>
						<select name="department" required class="form-control">
							<option value="">Select Department</option>
							<option>Finance</option>
							<option>HR</option>
							<option>IT</option>
							<option>R&D</option>
						</select>
						</div>
						<div class="form-group">
						<label>Address</label>
						<input type="text" name="address" required class="form-control">
						</div>
						<div class="form-group">
						<label>Salary</label>
						<input type="number" name="salary" min="10000" required class="form-control">
						</div>
						<div class="form-group">
						<label>Password</label>
						<input type="password" name="password" required class="form-control">
						</div>
						<div class="form-group">
						<label>Reporting To</label>
						<select name="reportto" required class="form-control">
							<option value="">Select User</option>
							<c:forEach items="${users }" var="u">
									<c:if test="${u.role eq 'HR' || u.role eq 'HR Head'}">
										<c:if test="${u.role eq 'HR'}">
											<option value="${u.userid }">${u.uname }(HR)</option>
										</c:if>
										<c:if test="${u.role eq 'HR Head'}">
											<option value="${u.userid }">${u.uname }(HR Head)</option>
										</c:if>

									</c:if>
								</c:forEach>
							</select>
						</div>
						<input type="submit" value="Register" class="btn btn-success float-right px-4">
					</form>
					<c:if test="${error ne null }">
						<div class="alert text-danger font-weight-bold">${error }</div>
					</c:if>
					<c:if test="${msg ne null }">
						<div class="alert text-success font-weight-bold">${msg }</div>
					</c:if>
					</div>
				</div>
			</div>
		</div>
</div>
</body>
</html>