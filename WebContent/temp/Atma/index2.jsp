<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.atma.database.Cancel_ReviewDAO,java.util.LinkedList" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>ATMA</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">

<!-- CSS here -->
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
<link rel="stylesheet" href="assets/css/style.css">
<!--<link rel="stylesheet" href="assets/css/style_login2.css">-->

<style>
* {
	box-sizing: border-box;
}

.heading {
	font-size: 25px;
	margin-right: 25px;
}

.fa {
	font-size: 25px;
}

.checked {
	color: orange;
}

/* Three column layout */
.side {
	float: left;
	width: 15%;
	margin-top: 10px;
}

.middle {
	margin-top: 10px;
	float: left;
	width: 70%;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* The bar container */
.bar-container {
	width: 100%;
	background-color: #f1f1f1;
	text-align: center;
	color: white;
}

/* Individual bars */

/* Responsive layout - make the columns stack on top of each other instead of next to each other */
@media ( max-width : 400px) {
	.side, .middle {
		width: 100%;
	}
	.right {
		display: none;
	}
}
</style>

<style>
.scroll {
	margin: 0;
	font-size: 20px;
	font-family: Arial, Helvetica, sans-serif;
}

.comments {
	position: fixed;
	top: 0;
	z-index: 1;
	width: 100%;
	background-color: #f1f1f1;
}

.comments h2 {
	text-align: center;
}

.progress-container {
	width: 100%;
	height: 8px;
	background: #ccc;
}

.progress-bar {
	height: 8px;
	background: #4caf50;
	width: 0%;
}

.content {
	padding: 100px 0;
	margin: 50px auto 0 auto;
	width: 80%;
}
</style>
</head>

<body>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
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
				</div>
			</div>
		</div>
	</div>
	<!-- Preloader Start -->
	<header>
		<!-- Header Start -->
		<div class="header-area">
			<div class="main-header ">
				<div class="header-top top-bg d-none d-lg-block">
					<div class="container"></div>
				</div>
				<div class="header-bottom  header-sticky">
					<div class="container">
						<div class="row align-items-center">
							<!-- Logo -->
							<div class="col-xl-2 col-lg-2 col-md-1">
								<div class="logo">
									<a href="index2.jsp"><img src="images/atma.png" alt=""></a>
								</div>
							</div>
							<div class="col-xl-10 col-lg-10 col-md-10">
								<!-- Main-menu -->
								<div class="main-menu f-right d-none d-lg-block">
									<nav>
										<ul id="navigation">
											<li><a href="index2.jsp">Home</a></li>
											<li><a href="Filters.jsp">Filters</a></li>
											<li><a href="UserDashIndex.jsp"><img
													src="images/icons/user-icon.png" alt=""></a></li>
										</ul>
									</nav>
								</div>
							</div>
							<!-- Mobile Menu -->
							<div class="col-12">
								<div class="mobile_menu d-block d-lg-none"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Header End -->
	</header>

	<main> <!-- slider Area Start-->
	<div class="slider-area ">
		<!-- Mobile Menu -->
		<div class="slider-active">
			<div
				class="single-slider hero-overly  slider-height d-flex align-items-center"
				data-background="assets/img/hero/vav1.jpg">
				<div class="container">
					<div class="row">
						<div class="col-xl-9 col-lg-9 col-md-9">
							<div class="hero__caption">
								<h1>
									Explore <span>Incredible India !</span>
								</h1>
								<p>Where would you like to go?</p>
							</div>
						</div>
					</div>
					<!-- Search Box -->
					<div class="row">
						<div class="col-xl-12">
							<!-- form -->

							<form action="choose" method="get" class="search-box">
								<div class="input-form mb-30">
									<input type="text" name="search"
										placeholder="Enter your Destination">
								</div>

								<div class="search-form mb-30">
									<a href="choose">Search</a>
								</div>
							</form>


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Favourite Places Start -->
	<div class="favourite-place place-padding">
		<div class="container">
			<!-- Section Title -->
			<div class="row">
				<div class="col-lg-12">
					<div class="section-tittle text-center">
						<h3>FEATURED TOURS Packages</h3>
						<h2>Favourite Places</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-4 col-lg-4 col-md-6">
					<div class="single-place mb-30">
						<div class="place-img">
							<a href="blr2.jsp"><img src="images/blr-palace.jpg" alt=""></a>
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<h3>
									<a href="blr2.jsp">Bengaluru</a>
								</h3>
							</div>
						</div>

						<div>




							<div class="content"
								style="height: 160px; width: 100%; border: 1px solid #ccc; font: 16px/26px Georgia, Garamond, Serif; overflow: auto; padding: 10px">
								<%
								Cancel_ReviewDAO c=new Cancel_ReviewDAO();
								LinkedList<String> f1=c.getComment("%Bangalore%");
								if(f1.size()>0)
								{
									for(String i:f1)
									{
										out.println("<p>"+i+"</p>"+"<hr style=\"border: 3px solid #000000\">");
									}
								}
								else{
									out.println("No Comments");
								}
								
								%>
							</div>

						</div>




						<div>
							<hr style="border: 3px solid #f1f1f1">
							<span class="heading">User Rating</span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span class="fa fa-star"></span>

							<hr style="border: 3px solid #f1f1f1">

							<div class="row">
								<div class="side">
									<div>5 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-5"
											style="width: 60%; height: 18px; background-color: #4CAF50;"></div>
									</div>
								</div>
								<div class="side">
									<div>150</div>
								</div>
								<div class="side">
									<div>4 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-4"
											style="width: 30%; height: 18px; background-color: #2196F3;"></div>
									</div>
								</div>
								<div class="side">
									<div>63</div>
								</div>
								<div class="side">
									<div>3 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-3"
											style="width: 10%; height: 18px; background-color: #00bcd4;"></div>
									</div>
								</div>
								<div class="side">
									<div>15</div>
								</div>
								<div class="side">
									<div>2 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-2"
											style="width: 4%; height: 18px; background-color: #ff9800;"></div>
									</div>
								</div>
								<div class="side">
									<div>6</div>
								</div>
								<div class="side">
									<div>1 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-1"
											style="width: 15%; height: 18px; background-color: #f44336;"></div>
									</div>
								</div>
								<div class="side">
									<div>20</div>
								</div>
							</div>
							<hr style="border: 3px solid #f1f1f1">
						</div>

					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6">
					<div class="single-place mb-30">
						<div class="place-img">
							<a href="Chennai2.jsp"><img src="images/Chennai.jpg" alt=""></a>
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<h3>
									<a href="Chennai2.jsp">Chennai</a>
								</h3>
							</div>
						</div>


						<div>




							<div class="content"
								style="height: 160px; width: 100%; border: 1px solid #ccc; font: 16px/26px Georgia, Garamond, Serif; overflow: auto; padding: 10px">
								<%
								
								LinkedList<String> f2=c.getComment("%Chennai%");
								if(f2.size()>0)
								{
									for(String i:f2)
									{
										out.println("<p>"+i+"</p>"+"<hr style=\"border: 3px solid #000000\">");
									}
								}
								else{
									out.println("No Comments");
								}
								
								%>
							</div>


						</div>






						<div>
							<hr style="border: 3px solid #f1f1f1">
							<span class="heading">User Rating</span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star"></span> <span class="fa fa-star"></span>

							<hr style="border: 3px solid #f1f1f1">

							<div class="row">
								<div class="side">
									<div>5 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-5"
											style="width: 40%; height: 18px; background-color: #4CAF50;"></div>
									</div>
								</div>
								<div class="side">
									<div>150</div>
								</div>
								<div class="side">
									<div>4 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-4"
											style="width: 20%; height: 18px; background-color: #2196F3;"></div>
									</div>
								</div>
								<div class="side">
									<div>63</div>
								</div>
								<div class="side">
									<div>3 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-3"
											style="width: 15%; height: 18px; background-color: #00bcd4;"></div>
									</div>
								</div>
								<div class="side">
									<div>15</div>
								</div>
								<div class="side">
									<div>2 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-2"
											style="width: 4%; height: 18px; background-color: #ff9800;"></div>
									</div>
								</div>
								<div class="side">
									<div>6</div>
								</div>
								<div class="side">
									<div>1 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-1"
											style="width: 15%; height: 18px; background-color: #f44336;"></div>
									</div>
								</div>
								<div class="side">
									<div>20</div>
								</div>
							</div>
							<hr style="border: 3px solid #f1f1f1">
						</div>

					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6">
					<div class="single-place mb-30">
						<div class="place-img">
							<a href="Mysore2.jsp"><img src="images/Mysore-palace.png"
								alt=""></a>
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<h3>
									<a href="Mysore2.jsp">Mysore</a>
								</h3>
							</div>
						</div>







						<div>




							<div class="content"
								style="height: 160px; width: 100%; border: 1px solid #ccc; font: 16px/26px Georgia, Garamond, Serif; overflow: auto; padding: 10px">
								<%
								
								LinkedList<String> f3=c.getComment("%Mysore%");
								if(f3.size()>0)
								{
									for(String i:f3)
									{
										out.println("<p>"+i+"</p>"+"<hr style=\"border: 3px solid #000000\">");
									}
								}
								else{
									out.println("No Comments");
								}
								
								%>
							</div>


						</div>










						<div>
							<hr style="border: 3px solid #f1f1f1">
							<span class="heading">User Rating</span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star "></span> <span class="fa fa-star"></span>

							<hr style="border: 3px solid #f1f1f1">

							<div class="row">
								<div class="side">
									<div>5 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-5"
											style="width: 50%; height: 18px; background-color: #4CAF50;"></div>
									</div>
								</div>
								<div class="side">
									<div>150</div>
								</div>
								<div class="side">
									<div>4 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-4"
											style="width: 30%; height: 18px; background-color: #2196F3;"></div>
									</div>
								</div>
								<div class="side">
									<div>63</div>
								</div>
								<div class="side">
									<div>3 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-3"
											style="width: 10%; height: 18px; background-color: #00bcd4;"></div>
									</div>
								</div>
								<div class="side">
									<div>15</div>
								</div>
								<div class="side">
									<div>2 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-2"
											style="width: 19%; height: 18px; background-color: #ff9800;"></div>
									</div>
								</div>
								<div class="side">
									<div>6</div>
								</div>
								<div class="side">
									<div>1 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-1"
											style="width: 15%; height: 18px; background-color: #f44336;"></div>
									</div>
								</div>
								<div class="side">
									<div>20</div>
								</div>
							</div>
							<hr style="border: 3px solid #f1f1f1">
						</div>

					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6">
					<div class="single-place mb-30">
						<div class="place-img">
							<a href="Mumbai2.jsp"><img src="images/Mumbai.jpg" alt=""></a>
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<h3>
									<a href="Mumbai2.jsp">Mumbai</a>
								</h3>
							</div>
						</div>


						<div>




							<div class="content"
								style="height: 160px; width: 100%; border: 1px solid #ccc; font: 16px/26px Georgia, Garamond, Serif; overflow: auto; padding: 10px">
								<%
								
								LinkedList<String> f4=c.getComment("%Mumbai%");
								if(f4.size()>0)
								{
									for(String i:f4)
									{
										out.println("<p>"+i+"</p>"+"<hr style=\"border: 3px solid #000000\">");
									}
								}
								else{
									out.println("No Comments");
								}
								
								%>
								
								
							</div>


						</div>







						<div>
							<hr style="border: 3px solid #f1f1f1">
							<span class="heading">User Rating</span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span class="fa fa-star"></span>

							<hr style="border: 3px solid #f1f1f1">

							<div class="row">
								<div class="side">
									<div>5 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-5"
											style="width: 60%; height: 18px; background-color: #4CAF50;"></div>
									</div>
								</div>
								<div class="side">
									<div>150</div>
								</div>
								<div class="side">
									<div>4 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-4"
											style="width: 30%; height: 18px; background-color: #2196F3;"></div>
									</div>
								</div>
								<div class="side">
									<div>63</div>
								</div>
								<div class="side">
									<div>3 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-3"
											style="width: 10%; height: 18px; background-color: #00bcd4;"></div>
									</div>
								</div>
								<div class="side">
									<div>15</div>
								</div>
								<div class="side">
									<div>2 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-2"
											style="width: 4%; height: 18px; background-color: #ff9800;"></div>
									</div>
								</div>
								<div class="side">
									<div>6</div>
								</div>
								<div class="side">
									<div>1 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-1"
											style="width: 15%; height: 18px; background-color: #f44336;"></div>
									</div>
								</div>
								<div class="side">
									<div>20</div>
								</div>
							</div>
							<hr style="border: 3px solid #f1f1f1">
						</div>

					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6">
					<div class="single-place mb-30">
						<div class="place-img">
							<a href="Delhi2.jsp"><img src="images/Delhi.jpg" alt=""></a>
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<h3>
									<a href="Delhi2.jsp">Delhi</a>
								</h3>
							</div>
						</div>





						<div>




							<div class="content"
								style="height: 160px; width: 100%; border: 1px solid #ccc; font: 16px/26px Georgia, Garamond, Serif; overflow: auto; padding: 10px">
								<%
								
								LinkedList<String> f5=c.getComment("%Delhi%");
								if(f5.size()>0)
								{
									for(String i:f5)
									{
										out.println("<p>"+i+"</p>"+"<hr style=\"border: 3px solid #000000\">");
									}
								}
								else{
									out.println("No Comments");
								}
								
								%>
								
							</div>


						</div>








						<div>
							<hr style="border: 3px solid #f1f1f1">
							<span class="heading">User Rating</span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span class="fa fa-star"></span>

							<hr style="border: 3px solid #f1f1f1">

							<div class="row">
								<div class="side">
									<div>5 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-5"
											style="width: 60%; height: 18px; background-color: #4CAF50;"></div>
									</div>
								</div>
								<div class="side">
									<div>150</div>
								</div>
								<div class="side">
									<div>4 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-4"
											style="width: 30%; height: 18px; background-color: #2196F3;"></div>
									</div>
								</div>
								<div class="side">
									<div>63</div>
								</div>
								<div class="side">
									<div>3 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-3"
											style="width: 10%; height: 18px; background-color: #00bcd4;"></div>
									</div>
								</div>
								<div class="side">
									<div>15</div>
								</div>
								<div class="side">
									<div>2 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-2"
											style="width: 4%; height: 18px; background-color: #ff9800;"></div>
									</div>
								</div>
								<div class="side">
									<div>6</div>
								</div>
								<div class="side">
									<div>1 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-1"
											style="width: 15%; height: 18px; background-color: #f44336;"></div>
									</div>
								</div>
								<div class="side">
									<div>20</div>
								</div>
							</div>
							<hr style="border: 3px solid #f1f1f1">
						</div>

					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6">
					<div class="single-place mb-30">
						<div class="place-img">
							<a href="Kolkata2.jsp"><img src="images/Kolkata.png" alt=""></a>
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<h3>
									<a href="Kolkata2.jsp">Kolkata</a>
								</h3>
							</div>
						</div>





						<div>




							<div class="content"
								style="height: 160px; width: 100%; border: 1px solid #ccc; font: 16px/26px Georgia, Garamond, Serif; overflow: auto; padding: 10px">
								<%
								
								LinkedList<String> f6=c.getComment("%Kolkata%");
								if(f6.size()>0)
								{
									for(String i:f6)
									{
										out.println("<p>"+i+"</p>"+"<hr style=\"border: 3px solid #000000\">");
									}
								}
								else{
									out.println("No Comments");
								}
								
								%>
								
							</div>

						</div>







						<div>
							<hr style="border: 3px solid #f1f1f1">
							<span class="heading">User Rating</span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span class="fa fa-star"></span>

							<hr style="border: 3px solid #f1f1f1">

							<div class="row">
								<div class="side">
									<div>5 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-5"
											style="width: 60%; height: 18px; background-color: #4CAF50;"></div>
									</div>
								</div>
								<div class="side">
									<div>150</div>
								</div>
								<div class="side">
									<div>4 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-4"
											style="width: 30%; height: 18px; background-color: #2196F3;"></div>
									</div>
								</div>
								<div class="side">
									<div>63</div>
								</div>
								<div class="side">
									<div>3 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-3"
											style="width: 10%; height: 18px; background-color: #00bcd4;"></div>
									</div>
								</div>
								<div class="side">
									<div>15</div>
								</div>
								<div class="side">
									<div>2 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-2"
											style="width: 4%; height: 18px; background-color: #ff9800;"></div>
									</div>
								</div>
								<div class="side">
									<div>6</div>
								</div>
								<div class="side">
									<div>1 star</div>
								</div>
								<div class="middle">
									<div class="bar-container">
										<div class="bar-1"
											style="width: 15%; height: 18px; background-color: #f44336;"></div>
									</div>
								</div>
								<div class="side">
									<div>20</div>
								</div>
							</div>
							<hr style="border: 3px solid #f1f1f1">
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Favourite Places End --> <!-- Testimonial Start --> <!-- Testimonial Start -->
	<div class="testimonial-area testimonial-padding"
		data-background="assets/img/testmonial/testimonial_bg.jpg">
		<div class="container ">
			<div class="row d-flex justify-content-center">
				<div class="col-xl-11 col-lg-11 col-md-9">
					<div class="h1-testimonial-active">
						<!-- Single Testimonial -->
						<div class="single-testimonial text-center">
							<!-- Testimonial Content -->
							<div class="testimonial-caption ">
								<div class="testimonial-top-cap">
									<img src="assets/img/icon/testimonial.png" alt="">
									<h2>
										Your <strong>Journey</strong> is our priority<br>
									</h2>
									
								</div>
							</div>
						</div>
						<!-- Single Testimonial -->
						<div class="single-testimonial text-center">
							<!-- Testimonial Content -->
							<div class="testimonial-caption ">
								<div class="testimonial-top-cap">
									<img src="assets/img/icon/testimonial.png" alt="">
									<p>
										Your <strong>Journey</strong> is our priority
									</p>
									
								</div>
								<!-- founder -->
								<div
									class="testimonial-founder d-flex align-items-center justify-content-center">
									<div class="founder-img">
										<img src="assets/img/testmonial/Homepage_testi.png" alt="">
									</div>
									<div class="founder-text">
										<span>Jessya Inn</span>
										<p>Co Founder</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Testimonial End --> </main>
	<footer>
		<!-- Footer Start-->
		<div class="footer-area footer-padding footer-bg"
			data-background="assets/img/service/footer_bg.jpg">
			<div class="container">
				<div class="row d-flex justify-content-between">
					<div class="col-xl-3 col-lg-3 col-md-5 col-sm-6">
						<div class="single-footer-caption mb-50">
							<div class="single-footer-caption mb-30">
								<!-- logo -->
								<div class="footer-logo">
									<a href="index2.jsp"><img src="images/rsz_atma.jpg" alt=""></a>
								</div>
								<div class="footer-tittle">
									<div class="footer-pera">
										<p>Amrita Tourism Management Application</p>
										<p>Group 18</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Footer bottom -->
					<div class="row pt-padding">
						<div class="col-xl-7 col-lg-7 col-md-7">
							<div class="footer-copy-right">
								<p>
									<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
									Copyright &copy;
									<script>
										document
												.write(new Date().getFullYear());
									</script>
								</p>
								<p>All rights reserved | Made by Pranav, Sachin, Sahana,
									Vikas and Raunak</p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Footer End-->
	</footer>

	<!-- JS here -->

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