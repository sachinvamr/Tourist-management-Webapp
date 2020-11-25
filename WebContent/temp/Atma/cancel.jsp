<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<title>Cancel :( Tour</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
#rcorners4 {
	border-radius: 115px;
	background: cyan;
	padding: 20px;
	width: 90px;
	height: 50px;
}
</style>
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
	<form action="cancel" method="get">
		<p style="color: red; font-size: 250%">Confirm cancel!!</p>
		<br>
		<textarea name="reason" placeholder="Reason Please"
			style="width: 435px; height: 140px; font-size: 30px;">
</textarea>
		<br> <br>
		<button id="rcorners4">Submit</button>
		

	</form>

</body>
</html>
