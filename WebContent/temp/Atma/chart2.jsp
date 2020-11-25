<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.atma.database.AdminDAO,java.util.LinkedList,com.atma.database.AdminDAO.Bookd"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%!// --- String Join Function converts from Java array to javascript string.  
	public String join(ArrayList<?> arr, String del) {

		StringBuilder output = new StringBuilder();

		for (int i = 0; i < arr.size(); i++) {

			if (i > 0)
				output.append(del);

			// --- Quote strings, only, for JS syntax  
			if (arr.get(i) instanceof String)
				output.append("\"");
			output.append(arr.get(i));
			if (arr.get(i) instanceof String)
				output.append("\"");
		}

		return output.toString();
	}%>
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
<script type="text/javascript"
	src="https://cdn.zingchart.com/zingchart.min.js"></script>
</head>
<body class="sb-nav-fixed">
	<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
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
		<!-- Navbar Search-->

		<!-- Navbar-->

	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Insights</div>
						<a class="nav-link" href="#top">
							Charts
						</a> <a class="nav-link" href="admin.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> <-GoBack
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
				<h1 class="mt-4">Table1 on Monthly/Yearly basis</h1>
				<form action="my" method="get">
				<div>
					Enter the year/month to get data <input type="text" name="month"><br>
					<br> <input style="border-radius: 12px;background-color:cyan;padding: 10px;"type="submit" value="Get Data"><br>
					Example: for monthly enter= "2020-11" and for yearly enter="2020" <br>
					<br> <br>
				</div>
				</form>

				<div class="card mb-4">

					<div class="card-body">
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
										if (session.getAttribute("monthly") != null) {
											AdminDAO a = new AdminDAO();
											LinkedList<Bookd> m=(LinkedList<Bookd>)session.getAttribute("monthly");
											if (m.size() != 0) {
												for (int i = 0; i < m.size(); i++) {
													out.println("<tr>" + "<td>" + m.get(i).bookingid + "</td>" + "<td>" + m.get(i).totalcost
															+ "</td>" + "<td>" + m.get(i).bookdate + "</td>" + "<td>" + m.get(i).status + "</td>"
															+ "<td>" + "-" + "</td>" + "<td>" + m.get(i).transmode + "</td>" + "<td>"
															+ m.get(i).tourid + "</td>" + "<td>" + m.get(i).regid + "</td>" + "</tr>");
												}
												session.removeAttribute("monthly");
											} else {
												out.println("<tr>" + "<td>" + "-" + "</td>" + "<td>" + "-" + "</td>" + "<td>" + "-" + "</td>"
														+ "<td>" + "-" + "</td>" + "<td>" + "1" + "</td>" + "<td>" + "-" + "</td>" + "<td>" + "-"
														+ "</td>" + "<td>" + "-" + "</td>" + "</tr>");
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

			<br>
			<b><hr style="border: 3px solid #000000"></b>
			<br>
			
			
			
			<!-- <div class="container-fluid">
				<h1 class="mt-4">Table2 on yearly basis</h1>
<form action="my" method="get">
				<div>
					Enter the year/month to get data <input type="text" name="year"><br>
					<br> <input type="submit" value="Get Data"><br>
					Example: for monthly enter= "2020-11" and for yearly enter="2020" <br>
					<br> <br>
				</div>
</form>

				<div class="card mb-4">

					<div class="card-body">

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
										if (session.getAttribute("yearly") != null) {
											AdminDAO a = new AdminDAO();
											LinkedList<Bookd> l = (LinkedList<Bookd>)session.getAttribute("yearly");
											if (l.size() != 0) {
												for (int i = 0; i < l.size(); i++) {
													out.println("<tr>" + "<td>" + l.get(i).bookingid + "</td>" + "<td>" + l.get(i).totalcost
															+ "</td>" + "<td>" + l.get(i).bookdate + "</td>" + "<td>" + l.get(i).status + "</td>"
															+ "<td>" + "-" + "</td>" + "<td>" + l.get(i).transmode + "</td>" + "<td>"
															+ l.get(i).tourid + "</td>" + "<td>" + l.get(i).regid + "</td>" + "</tr>");
												}
												session.removeAttribute("yearly");
											} else {
												out.println("<tr>" + "<td>" + "-" + "</td>" + "<td>" + "-" + "</td>" + "<td>" + "-" + "</td>"
														+ "<td>" + "-" + "</td>" + "<td>" + "1" + "</td>" + "<td>" + "-" + "</td>" + "<td>" + "-"
														+ "</td>" + "<td>" + "-" + "</td>" + "</tr>");
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
			</div> -->
			
			
			
			
			
			<div>
			<a name="top"></a>
				<script>
					
				<%// --- Create two Java Arrays  
			String s[] = {"Chennai", "Delhi", "Kolkata", "Mysore", "Mumbai", "Bangalore"};
			ArrayList<String> months = new ArrayList<String>();
			ArrayList<Integer> users = new ArrayList<Integer>();
			AdminDAO a = new AdminDAO();
			// LinkedList<Bookd> l=a.getBookdMonthly("2020%");
			int b[] = a.getChartData();

			// --- Loop 10 times and create 10 string dates and 10 users  
			int counter = 0;
			while (counter < 6) {
				months.add(s[counter]);
				users.add(b[counter++]);
			}%>
					// --- add a comma after each value in the array and convert to javascript string representing an array  
					var monthData = [
				<%=join(months, ",")%>
					];
					var userData = [
				<%=join(users, ",")%>
					];
				</script>
				<script>
					window.onload = function() {
						zingchart.render({
							id : "myChart",
							width : "100%",
							height : 400,
							data : {
								"type" : "bar",
								"title" : {
									"text" : "Cities"
								},
								"scale-x" : {
									"labels" : monthData
								},
								"plot" : {
									"line-width" : 1
								},
								"series" : [ {
									"values" : userData
								} ]
							}
						});
					};
				</script>
				<h1 class="mt-4">Price by different category Bar Chart</h1>
				<div id="myChart"></div>
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
