<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:include page="cheader.jsp"></jsp:include>
<div class="container-fluid">
	<div class="row">
			<div class="col-sm-4 mx-auto mt-2">
				<div class="card shadow">
					<div class="card-header text-center bg-success text-white">
						<h5>Edit User Information</h5>
					</div>
					<div class="card-body">
						<form method="post">
						<div class="form-group">
						<label>Name</label>
						<input type="text" name="uname" value="${user.uname }" required class="form-control">
						</div>
						<div class="form-group">
						<label>Phone</label>
						<input type="text" maxlength="10" name="phone" value="${user.phone }" required class="form-control">
						</div>
						<div class="form-group">
						<label>Email</label>
						<input type="email" readonly name="userid" value="${user.userid }" required class="form-control">
						</div>
						<div class="form-group">
						<label>Gender</label>
						<select name="gender" required class="form-control">
							<option value="">Select Gender</option>
							<option ${user.gender eq 'Male' ?'selected':'' }>Male</option>
							<option ${user.gender eq 'Female' ?'selected':'' }>Female</option>
						</select>
						</div>
						<div class="form-group">
						<label>Role</label>
						<select name="role" required class="form-control">
							<option value="">Select Role</option>
							<option ${user.role eq 'HR' ?'selected':'' }>HR</option>
							<option ${user.role eq 'Employee' ?'selected':'' }>Employee</option>
						</select>
						</div>
						<div class="form-group">
						<label>Department</label>
						<select name="department" required class="form-control">
							<option value="">Select Department</option>
							<option ${user.department eq 'Finance' ?'selected':'' }>Finance</option>
							<option ${user.department eq 'HR' ?'selected':'' }>HR</option>
							<option ${user.department eq 'IT' ?'selected':'' }>IT</option>
						</select>
						</div>
						<div class="form-group">
						<label>Address</label>
						<input type="text" name="address" value="${user.address }" required class="form-control">
						</div>
						<c:if test="${sessionScope.role == 'HR Head' and user.role=='HR' }">
						<div class="form-group form-check">
						<input id="allow" type="checkbox" name="allowedit" ${user.allowedit ? 'checked':'' } value="1" class="form-check-input">
						<label for="allow" class="form-check-label">Allow Edit Employee</label>
						</div>
						</c:if>
						<div class="form-group">
						<label>Salary</label>
						<input type="number" name="salary" value="${user.salary }" min="10000" required class="form-control">
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