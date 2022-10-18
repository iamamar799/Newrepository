<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>HR Helpdesk System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<style>
body{
 background-repeat: no-repeat;
 background-attachment: fixed;
 background-size: cover;
 background-position: top;
 background-image:url(https://tinyurl.com/indexbackground);
 width: 100%;
 height: 100%;
 font-family: Arial, Helvetica;
 letter-spacing: 0.02em;
  font-weight: 400;
 -webkit-font-smoothing: antialiased; 
}

h4 {
  width: 60%;
  margin: 0 auto 0 auto;
  font-family: 'Lato', sans-serif;
  line-height: 10px;
  font-size: 2.5rem;
  padding: 10px 40px;
  text-align: center;
  text-transform: uppercase;
  text-rendering: optimizeLegibility;
}

/*	
============
	Light
============
*/
h4::before {
  content:"";
  width: 100%;
  height: 50px;
  position: absolute;
  top: -100px;
  left: 10px;
  transform: rotate(55deg);
  background: rgba(206,188,155,.7);
  background: -moz-linear-gradient(left, rgba(206,188,155,.7) 0%, rgba(42,31,25,0) 65%);
  background: -webkit-gradient(left top, right top, color-stop(0%, rgba(206,188,155,.7)), color-stop(65%, rgba(42,31,25,0)));
  background: -webkit-linear-gradient(left, rgba(206,188,155,.7) 0%, rgba(42,31,25,0) 65%);
  background: -o-linear-gradient(left, rgba(206,188,155,.7) 0%, rgba(42,31,25,0) 65%);
  background: -ms-linear-gradient(left, rgba(206,188,155,.7) 0%, rgba(42,31,25,0) 65%);
  background: linear-gradient(to right, rgba(206,188,155,.7) 0%, rgba(42,31,25,0) 65%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cebc9b', endColorstr='#2a1f19', GradientType=0.7 ); );
}



/*	
========================
			3D Effect
========================
*/
#text3d {
    color: #70869d;
    letter-spacing: .10em;
    text-shadow: 
      -1px -1px 1px #efede3, 
      0px 1px 0 #2e2e2e, 
      0px 2px 0 #2c2c2c, 
      0px 3px 0 #2a2a2a, 
      0px 4px 0 #282828, 
      0px 5px 0 #262626, 
      0px 6px 0 #242424, 
      0px 7px 0 #222, 
      0px 8px 0 #202020, 
      0px 9px 0 #1e1e1e, 
      0px 10px 0 #1c1c1c, 
      0px 11px 0 #1a1a1a, 
      0px 12px 0 #181818, 
      0px 13px 0 #161616, 
      0px 14px 0 #141414, 
      0px 15px 0 #121212,
      2px 20px 5px rgba(0, 0, 0, 0.9),
      5px 23px 5px rgba(0, 0, 0, 0.3),
      8px 27px 8px rgba(0, 0, 0, 0.5),
      8px 28px 35px rgba(0, 0, 0, 0.9);
 }


</style>
</head>
<body>
<div class="jumbotron text-center rounded-0 bg-success text-white">
	<h4 id="text3d">HR Helpdesk System</h4>
</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-4 mx-auto mt-2">
				<div class="card shadow">
					<div class="card-header text-center bg-success text-white">
						<h5>Login Screen</h5>
					</div>
					<div class="card-body">
						<form method="post">
							<div class="form-group">
								<label>User ID</label> <input type="text" name="userid" required
									class="form-control">
							</div>
							<div class="form-group">
								<label>Password</label> <input type="password" name="pwd"
									required class="form-control">
							</div>
							<input type="submit" value="Log In"
								class="btn btn-success float-right px-4">
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