<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Kolkata </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

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
</head>

<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		if (session.getAttribute("regid") == null) {
			response.sendRedirect("Login_v19/index.html");
		}
	%>
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
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
                   <div class="container">

                   </div>
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
                                            <li><a href="UserDashIndex.jsp"><img src="images/icons/user-icon.png" alt=""></a></li>
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

     <!-- slider Area Start-->
     <div class="slider-area ">
        <!-- Mobile Menu -->
        <div class="single-slider slider-height2 d-flex align-items-center" data-background="assets/img/hero/about.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>Kolkata</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     </div>
     <!-- slider Area End-->
    <!--================Blog Area =================-->
    <section class="blog_area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
                        <article class="blog_item">
                            <div class="blog_item_img">
                                <a href="Tours2.jsp?id1=Kolkata.HowrahBridge"><img class="card-img rounded-0" src="images/Howrah-bridge.jpg" alt=""></a>
                            </div>

                            <div class="blog_details">
                                <a class="d-inline-block" href="Tours2.jsp?id1=Kolkata.HowrahBridge">
                                    <h2>Howrah Bridge</h2>
                                </a>
                                <ul class="blog-info-link">
                                  <li><a href="#" style="font-size:100%;"><b>Heritage</b></a></li>
                                  <li><a href="#" style="font-size:110%;"><b>Cost: 700</b></a></li>
                                  <li><a href="#" style="font-size:100%;"><b>Number of days: 6</b></a></li>
                                  <li><a href="#" style="font-size:100%;"><b>Rating: 4.5/5</b></a></li>
                                </ul>
                            </div>
                        </article>

                        <article class="blog_item">
                            <div class="blog_item_img">
                                <a href="Tours2.jsp?id1=Kolkata.VictoriaMemorial"><img class="card-img rounded-0" src="images/Victoria-memorial.jpg" alt=""></a>
                            </div>

                            <div class="blog_details">
                                <a class="d-inline-block" href="Tours2.jsp?id1=Kolkata.VictoriaMemorial">
                                    <h2>Victoria Memorial</h2>
                                </a>
                                <ul class="blog-info-link">
                                  <li><a href="#" style="font-size:100%;"><b>Heritage</b></a></li>
                                  <li><a href="#" style="font-size:110%;"><b>Cost: 750</b></a></li>
                                  <li><a href="#" style="font-size:100%;"><b>Number of days: 6</b></a></li>
                                  <li><a href="#" style="font-size:100%;"><b>Rating: 4/5</b></a></li>
                                </ul>
                            </div>
                        </article>

                       
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget">
                            <form action="#">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder='Search Keyword'
                                            onfocus="this.placeholder = ''"
                                            onblur="this.placeholder = 'Search Keyword'">
                                        <div class="input-group-append">
                                            <button class="btns" type="button"><i class="ti-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                    type="submit">Search</button>
                            </form>
                        </aside>

                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">Other Places</h4>
                            <ul class="list cat-list">
                                <li>
                                    <a href="blr2.jsp" class="d-flex">
                                        <p>Bengaluru</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="Chennai2.jsp" class="d-flex">
                                        <p>Chennai</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="Mysore2.jsp" class="d-flex">
                                        <p>Mysore</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="Mumbai2.jsp" class="d-flex">
                                        <p>Mumbai</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="Delhi2.jsp" class="d-flex">
                                        <p>Delhi</p>
                                    </a>
                                </li>
                            </ul>
                        </aside>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->
    <footer>
        <!-- Footer Start-->
        <div class="footer-area footer-padding footer-bg" data-background="assets/img/service/footer_bg.jpg">
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
                         <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script></p><p> All rights reserved | Made by Pranav, Sachin, Sahana, Papana Vikas and Raunak</p>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
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
    