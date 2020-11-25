<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: black;
}

* {
  box-sizing: border-box;
}


.container {
  padding: 16px;
  background-color: white;
}


hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

.registerbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

</style>
</head>
<body>

<form action="confirmb" method="get">
  <div class="container">
    <h1>Confirm Booking!</h1>
    <hr>

    <label ><b>Date</b></label>
   	<p>Please fill in this form to create an account.</p>
    <br>
    
     <label ><b>TotalCost</b></label>
   	<p>Please fill in this form to create an account.</p>
    <br>
    
     <label ><b>Number of Members</b></label>
   	<p>Please fill in this form to create an account.</p>
    <br>
    
     <label ><b>TotalCost</b></label>
   	<p>Please fill in this form to create an account.</p>
    <br>
    
     <label ><b>Mode Of Transport</b></label>
   	<p>Please fill in this form to create an account.</p>
    <br>

    <hr>

    <input type="submit" name="Book" class="registerbtn" />
  </div>
  
</form>

</body>
</html>
