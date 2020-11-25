<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<title>Insert title here</title>
<style >

#rcorners4 {
	border-radius: 115px;
	background: cyan;
	padding: 20px;
	width: 90px;
	height: 50px;
}
div.stars {
  width: 270px;
  display: inline-block;
}

input.star { display: none; }

label.star {
  float: right;
  padding: 10px;
  font-size: 36px;
  color: #444;
  transition: all .2s;
}

input.star:checked ~ label.star:before {
  content: '\f005';
  color: #FD4;
  transition: all .25s;
}

input.star-5:checked ~ label.star:before {
  color: #FE7;
  text-shadow: 0 0 20px #952;
}

input.star-1:checked ~ label.star:before { color: #F62; }

label.star:hover { transform: rotate(-15deg) scale(1.3); }

label.star:before {
  content: '\f006';
  font-family: FontAwesome;
}
</style>
</head>
<body>

<%
		if (session.getAttribute("regid") == null) {
			response.sendRedirect("Login_v19/index.html");
		}

 if(request.getParameter("id")!="")
	{
		session.setAttribute("tourid2",request.getParameter("id"));
	} 
	%>
<form action="review" method="get">
		<p style="color: red; font-size: 250%">U make us better !!</p>
		<br>
		<textarea name="r" placeholder="review"
			style="width: 435px; height: 140px; font-size: 30px;">
</textarea>

<br>
<div class="stars">
  
    <input class="star star-5" id="star-5" type="radio" name="star1" value="5" />
    <label class="star star-5" for="star-5"></label>
    <input class="star star-4" id="star-4" type="radio" name="star1" value="4" />
    <label class="star star-4" for="star-4"></label>
    <input class="star star-3" id="star-3" type="radio" name="star1" value="3" />
    <label class="star star-3" for="star-3"></label>
    <input class="star star-2" id="star-2" type="radio" name="star1" value="2" />
    <label class="star star-2" for="star-2"></label>
    <input class="star star-1" id="star-1" type="radio" name="star1" value="1" />
    <label class="star star-1" for="star-1"></label>
</div>
		<br> <br>
		<button id="rcorners4">Submit</button>
		

</form>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
$(':radio').change(function() {
	  console.log('New star rating: ' + this.value);
	});
</script>
</html>