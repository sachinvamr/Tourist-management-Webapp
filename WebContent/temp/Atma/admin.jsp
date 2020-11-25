<%@ page
	import="com.atma.database.AdminDAO,java.util.LinkedList,com.atma.database.AdminDAO.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Tables - Admin</title>
<link href="css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<%
		if (session.getAttribute("admin") == null) {
			response.sendRedirect("Login_v19/index.html");
		}
	%>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand" href="index.html">ATMA</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
		
		
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						
						<div class="sb-sidenav-menu-heading">Interface</div>
						<a class="nav-link" href="logOut">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> LogOut
						</a>


						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="chart2.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> Charts & MoreInfo
						</a> <a class="nav-link" href="#">
							
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Administrator
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
			<div class="container-fluid">
				<h1 class="mt-4">Tables</h1>
				
				<div class="card mb-4" style="opacity:0">
					<div class="card-body" >
					
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table mr-1"></i> DataBase Tables 
					</div>
					<div class="card-body">

						<form action="confirm" method="get">
							<div>
								<p>
									<b>Confirm pending Bookings(Format: (YYYY-MM-DD))</b>
								</p>
								Date on which to <b>confirm</b> all bookings between <input
									type="text" name="date1"> and <input type="text"
									name="date2"><br> Set status to <input type="text"
									name="status"><br> 0-pending , 1-confirmed , 2-cancel<br><br> <input style="border-radius: 12px;background-color:cyan;padding: 10px;" type="submit"
									value="Update"><br>
							</div>
						</form>
						<br> <b> <%
 	if (session.getAttribute("rows") != null) {
 		out.println(session.getAttribute("rows") + " rows affected");
 		session.removeAttribute("rows");
 	}
 %>
						</b><br> <br>


						<div class="table-responsive">

							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>bookingid</th>
										<th>totalcost</th>
										<th>bookdate</th>
										<th>status</th>
										<th>members</th>
										<th>transmode</th>
										<th>tourid</th>
										<th>regid</th>
									</tr>
								</thead>
								<tbody>
									<%
										//bookid,totalcost,bookdate,status,memebers,transmode
										//tourid,regid
										AdminDAO a = new AdminDAO();
										LinkedList<Bookd> l = a.getBookingInfo();
										if (l.size() != 0) {
											for (int i = 0; i < l.size(); i++) {
												out.println("<tr>" + "<td>" + l.get(i).bookingid + "</td>" + "<td>" + l.get(i).totalcost + "</td>"
														+ "<td>" + l.get(i).bookdate + "</td>" + "<td>" + l.get(i).status + "</td>" + "<td>" + "-"
														+ "</td>" + "<td>" + l.get(i).transmode + "</td>" + "<td>" + l.get(i).tourid + "</td>"
														+ "<td>" + l.get(i).regid + "</td>" + "</tr>");
											}
										} else {
											out.println("<tr>" + "<td>" + "-" + "</td>" + "<td>" + "-" + "</td>" + "<td>" + "-" + "</td>" + "<td>"
													+ "-" + "</td>" + "<td>" + "1" + "</td>" + "<td>" + "-" + "</td>" + "<td>" + "-" + "</td>"
													+ "<td>" + "-" + "</td>" + "</tr>");
										}
									%>
								</tbody>
							</table>
						</div>
					</div>


					<div class="card-body">
						<b><p>Cancellation reasons</p></b>

						<div class="table-responsive">

							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>cancelid</th>
										<th>reason</th>
										<th>refstatus</th>
										<th>regid</th>
										<th>tourid</th>
									</tr>
								</thead>
								<tbody>
									<%
										LinkedList<cancel> c = a.getReasons();
										if (l.size() != 0) {
											for (int i = 0; i < c.size(); i++) {
												out.println("<tr>" + "<td>" + c.get(i).cancelid + "</td>" + "<td>" + c.get(i).reason + "</td>"
														+ "<td>" + c.get(i).refstatus + "</td>" + "<td>" + c.get(i).regid3 + "</td>" + "<td>"
														+ c.get(i).tourid3 + "</td>" + "</tr>");
											}
										} else {
											out.println(
													"<tr>" + "<td>-</td>" + "<td>-</td>" + "<td>-</td>" + "<td>-</td>" + "<td>-</td>" + "</tr>");
										}
									%>
								</tbody>
							</table>
						</div>






						<br>
						<br> <b><p>Agency Record</p></b>
						
						
						<div class="table-responsive">

							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>recordid</th>
										<th>outcash</th>
										<th>turnover</th>
										<th>tourid</th>
									</tr>
								</thead>
								<tbody>
									<%
										//bookid,totalcost,bookdate,status,memebers,transmode
										//tourid,regid

										LinkedList<agency> b = a.getDataAgency();
										if (b.size() != 0) {
											for (int i = 0; i < b.size(); i++) {
												out.println("<tr>" + "<td>" + b.get(i).recordid + "</td>" + "<td>" + b.get(i).outcash + "</td>"
														+ "<td>" + b.get(i).turnover + "</td>" + "<td>" + b.get(i).tourid5 + "</tr>");
											}
										} else {
											out.println("<tr>" + "<td>" + "-" + "</td>" + "<td>" + "-" + "</td>" + "<td>" + "-" + "</td>" + "<td>"
													+ "-" + "</td>" + "<td>" + "1" + "</td>" + "<td>" + "-" + "</td>" + "<td>" + "-" + "</td>"
													+ "<td>" + "-" + "</td>" + "</tr>");
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2020</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/datatables-demo.js"></script>
</body>
</html>
