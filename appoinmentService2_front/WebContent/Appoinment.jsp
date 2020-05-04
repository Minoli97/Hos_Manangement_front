<%@ page import = "model.Appoinment" %>
<%
	//Intailize
/* session.setAttribute("statusMsg", "");
System.out.println("Trying to  Process......"); */

//Save---------------------------------

if (request.getParameter("patientName") != null) {
	
	Appoinment app = new Appoinment();
	String stsMsg = "";
	
	//Insert--------------------------
	if (request.getParameter("hidPatientIDSave") == "") {
		stsMsg = app.insertAppoinment(request.getParameter("patientName"), request.getParameter("doctorName"),
		request.getParameter("hospitalPrice"), request.getParameter("description"));
	} else
	
		//Update----------------------
	{
		stsMsg = app.updateAppoinment(request.getParameter("hidItemIDSave"), request.getParameter("patientName"),
		request.getParameter("doctorName"), request.getParameter("hospitalPrice"), request.getParameter("description"));
	}
	session.setAttribute("statusMsg", stsMsg);
}
//Delete-----------------------------
if (request.getParameter("hidItemIDDelete") != null) {
	Appoinment app = new Appoinment();
	String stsMsg = app.deleteAppoinment(request.getParameter("hidAppoinIDDelete"));
	session.setAttribute("statusMsg", stsMsg);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class ="container">
<div class = "row">
<div class = "col-14">
	<form id="appointForm" name="appointmentForm" method="post"
		action="appointment.jsp">
		Appointment ID: <input id="appinmentId" name="appinmentId" type="text"
			class="form-control form-control-sm"> <br> 
		Patient Name:<input id="patientName" name="patientName" type="text"
			class="form-control form-control-sm"> <br> 
		Doctor Name:<input id="doctorName" name="doctorName" type="text"
			class="form-control form-control-sm"> <br> 
		Hospital Name: <input id="hospitalName" name="hospitalName" type="text"
			class="form-control form-control-sm"> <br> 
		Description:<input id="description" name="description" type="text"
			class="form-control form-control-sm"> <br> 
			<input id="btnSave" name="btnSave" type="button" value="Save"
			class="btn btn-primary"> 
			<input type="hidden"
			id="hidAppoinIDSave" name="hidItemIDSave" value="">
	</form>
	<div id="alertSuccess" class="alert alert-success">
		<%
			out.print(session.getAttribute("statusMsg"));
		%>
	</div>
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