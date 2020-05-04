<%@ page import = "model.Appoinment" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/appoin.js"></script>
</head>
<body>
<div class ="container">
<div class = "row">
<div class = "col-14">
	<form id="appointmentForm" name="appointmentForm" method="post"
		action="appointment.jsp">
		<!-- Appointment ID:
		 <input id="appinmentId" name="appinmentId" type="text"
			class="form-control form-control-sm"> <br>  -->
			
		Patient Name:
		<input id="patientName" name="patientName" type="text"class="form-control form-control-sm"> 
		<br> 
		Doctor Name:
		<input id="doctorName" name="doctorName" type="text" class="form-control form-control-sm"> 
		<br> 
		Hospital Name: 
		<input id="hospitalName" name="hospitalName" type="text" class="form-control form-control-sm"> 
		<br> 
		Description:
		<input id="description" name="description" type="text"class="form-control form-control-sm">
		<br> 
		<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary"> 
		<input type="hidden" id="hidAppoinIDSave" name="hidAppoinIDSave" value="">
	</form>
	
	<div id="alertSuccess" class="alert alert-success"></div>
		
	<div id="alertError" class="alert alert-danger"></div>
	
	<br>
<div id="divItemsGrid">
 <%
 	Appoinment app = new Appoinment();
 	out.print(app.readAppoinment());
 %>
</div>
</div>
 </div>
</div>



</body>
</html>