<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:include page="cheader.jsp"></jsp:include>
<div class="container-fluid">
	<h4 class="p-2" style="border-bottom:2px solid green;">All Members List</h4>
	<c:if test="${msg ne null }">
		<div class="alert alert-success">
			${msg }
		</div>			
	</c:if>
	<table class="table table-bordered table-sm">
		<thead class="table-dark">
			<tr>
				<th>User ID</th>
				<th>Full Name</th>
				<th>Address</th>
				<th>Gender</th>
				<th>Phone</th>
				<th>Department</th>
				<th>Reporting To</th>
				<th>Role</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="m">
			<tr bgcolor="white">
				<td>${m.userid }</td>
				<td>${m.uname }</td>
				<td>${m.address }</td>
				<td>${m.gender }</td>
				<td>${m.phone }</td>
				<td>${m.department }</td>
				<td>${m.reportto.uname }</td>
				<td>${m.role }</td>
				<td>
				<c:if test="${sessionScope.edit }">
					<a href="/edit/${m.userid}" class="btn btn-primary btn-sm">Update</a>					
					<a href="/delete/${m.userid }" onclick="return confirm('Are you sure you want to delete this User?')" class="btn btn-danger btn-sm">Delete</a>
								
				</c:if>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>