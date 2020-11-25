<%@page
	import="com.atma.database.LoginDAO,com.atma.database.BookingDAO,com.atma.database.BookingDAO.UserDash"%>
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
<title>User Dashboard ATMA</title>
<link href="css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/flaticon.css">
<link rel="stylesheet" href="assets/css/slicknav.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/slick.css">
<link rel="stylesheet" href="assets/css/nice-select.css">
<!--<link rel="stylesheet" href="assets/css/style.css">-->
<!--<link rel="stylesheet" href="assets/css/style_login2.css">-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<%
		if (session.getAttribute("regid") == null) {
			response.sendRedirect("Login_v19/index.html");
		}
	%>
	<!-- Preloader Start -->
	<div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
				<div class="preloader-img pere-text">
					<img src="images/atma.png" alt="">
					<p></p>
					<h6>So much of who we are is where we have been</h6>
				</div>
			</div>
		</div>
	</div>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<div class="col-xl-2 col-lg-2 col-md-1">
			<div class="logo">
				<a href="./index2.jsp"><img src="images/rsz_atma.jpg" alt=""></a>
			</div>
		</div>
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
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="index2.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Home
						</a>
						<form action="logOut" method="get">
							<div>
								<a class="nav-link" href="logOut">
									<div class="sb-nav-link-icon">
										<i class="fas fa-tachometer-alt"></i>
									</div> Log Out
								</a>
							</div>
						</form>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in</div>
					<p>as User</p>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
			<div class="container-fluid">
				<h1 class="mt-4">User Dashboard</h1>


				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table mr-1"></i> Your Tours
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>Destination</th>
										<th>Date of travel</th>
										<th>Total Cost</th>
										<th>Cancel link</th>
										<th>Status</th>
										<th>Give Reviews</th>

									</tr>
								</thead>

								<tbody>
									<%
										//bookinid(Flight.Bangalore.BengaluruPalace),bookdate,status,count
										System.out.println("11");
										if (session.getAttribute("regid") != null) {
											
											BookingDAO b = new BookingDAO();
											
											UserDash[] u = b.getData((String) session.getAttribute("regid"));
											
											if (u[0].getCount() != 0) {
												for (int i = 0; i < u[0].getCount(); i++) {
													
													String s = u[i].getBookingid();
													//System.out.println(s.indexOf('.',(s.indexOf('.') + 1)) + 1);
													String temp = s.substring(s.indexOf(".",(s.indexOf(".") + 1)) + 1);
													String temp2 = null;
													if (u[i].getStatus() == 1) {
														temp2 = "Confirmed";
													} else if (u[i].getStatus() == 2) {
														temp2 = "Cancelled";
													} else {
														temp2 = "Processing(It may take time)";
													}
													if (temp2.compareTo("Processing(It may take time)") == 0) {
														out.println("<tr>" + "<td>" + temp.substring(0,temp.indexOf(".")) + "</td>" + "<td>" + u[i].getBookdate() + "</td>"
																+ "<td>" + u[i].getCost() + "</td>" + "<td><a href=" + "\"cancel.jsp?id="
																+ u[i].getBookingid() + "\"" + ">Cancel</a></td>" +

																"<td>" + temp2 + "</td>" + "<td>-</td> </tr>");

													} else {
														out.println("<tr>" + "<td>" + temp.substring(0,temp.indexOf(".")) + "</td>" + "<td>" + u[i].getBookdate() + "</td>" +

																"<td>" + u[i].getCost() + "</td>" + "<td>Cancel</td>" +

																"<td>" + temp2 + "</td>" + "<td><a href=" + "\"takeReview.jsp?id="
																+ u[i].getBookingid() + "\"" + ">U make us Better</a></td>" + "</tr>");
													}
												}
											} else {
												out.println("<tr>" + "<td>-</td>-<td>-</td><td>-</td>" +

														"<td>Cancel</td>" +

														"<td>-</td><td>-</td>" + " </tr>");
											}
										} else {
											out.println("<tr><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>");
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
						<p>
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
						</p>
						<p>All rights reserved | Made by Pranav, Sachin, Sahana, Vikas
							and Raunak</p>
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
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/datatables-demo.js"></script>
	<!-- All JS Custom Plugins Link Here here -->
	<script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>

	<!-- Jquery, Popper, Bootstrap -->
	<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="./assets/js/popper.min.js"></script>
	<script src="./assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script src="./assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="./assets/js/owl.carousel.min.js"></script>
	<script src="./assets/js/slick.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
	<script src="./assets/js/wow.min.js"></script>
	<script src="./assets/js/animated.headline.js"></script>
	<script src="./assets/js/jquery.magnific-popup.js"></script>

	<!-- Scrollup, nice-select, sticky -->
	<script src="./assets/js/jquery.scrollUp.min.js"></script>
	<script src="./assets/js/jquery.nice-select.min.js"></script>
	<script src="./assets/js/jquery.sticky.js"></script>

	<!-- contact js -->
	<script src="./assets/js/contact.js"></script>
	<script src="./assets/js/jquery.form.js"></script>
	<script src="./assets/js/jquery.validate.min.js"></script>
	<script src="./assets/js/mail-script.js"></script>
	<script src="./assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="./assets/js/plugins.js"></script>
	<script src="./assets/js/main.js"></script>
</body>
</html>
