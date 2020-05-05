<%@ page import="model.Appoinment"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/appoin.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-14">
				<h1>Appointment Form</h1>
				<form id="appointmentForm" name="appointmentForm" method="post"
					action="appointment.jsp" style="width:250px;">
					<!-- Appointment ID:
		 <input id="appinmentId" name="appinmentId" type="text"
			class="form-control form-control-sm"> <br>  -->

					
					<!-- PATIENT NAME -->
					 <div class="input-group input-group-sm mb-3">
					 <div class="input-group-prepend">
					 <span class="input-group-text" id="lblName">Patient Name: </span>
					 </div>
					 <input type="text" id="patientName" name="patientName">
					 </div>
					 
					 
					 
					 <!-- DOCTOR --> 
					 <div class="input-group input-group-sm mb-3">  
					 <div class="input-group-prepend">   
					 <span class="input-group-text" id="lblName">Doctor Name: </span>  
					 </div>  
					 <select id="doctorName" name="doctorName">   
					 <option value="0">--Select a doctor--</option>   
					 <option value="Ms.Sanju">Ms.Sanju</option>   
					 <option value="Ms.Anolie">Ms.Anolie</option>   
					 <option value="Mr.Pasan">Mr.Pasan</option>   
					 <option value="Ms.Maleesha</">Ms.Maleesha</option>  
					 </select> 
					 </div> 
					 
					 <!-- HOSPITAL --> 
					 <div class="input-group input-group-sm mb-3">  
					 <div class="input-group-prepend">   
					 <span class="input-group-text" id="lblName">Hospital Name: </span>  
					 </div>  
					 <select id="hospitalName" name="hospitalName">   
					 <option value="0">--Select a Hospital--</option>   
					 <option value="Colombo">Colombo</option>   
					 <option value="Gampaha">Gampaha</option>   
					 <option value="Kandy">Kandy</option>   
					 <option value="Galle">Galle</option>  
					 </select> 
					 </div> 
					 
					 <!-- description -->
					 <div class="input-group input-group-sm mb-3">
					 <div class="input-group-prepend">
					 <span class="input-group-text" id="lblName">Phone number: </span>
					 </div>
					 <input type="text" id="description" name="description">
					 </div>
					 <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary"> 
					<input type="hidden" id="hidAppoinIDSave" name="hidAppoinIDSave" value="">
					 
					 
				</form>
				
				</div>
		</div>
	</div>

				<div id="alertSuccess" class="alert alert-success"></div>

				<div id="alertError" class="alert alert-danger"></div>

				<br>
				<div id="divItemsGrid">
					<%
						Appoinment app = new Appoinment();
					out.print(app.readAppoinment());
					%>
				</div>
			


</body>
</html>