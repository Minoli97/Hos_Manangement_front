$(document).ready(function()
{
	if($("#alertSuccess").text().trim()=="")
	{
	$("#alertSuccess").hide();
	}
    $("#alertError").hide();
});

$(document).on("click", "#btnSave", function(event)
		{
			$("#alertSuccess").text("");
			$("#alertSuccess").hide();
			$("#alertError").text("");
			$("#alertError").hide();
			
			var status = validateAppoinForm();
			if (status != true)
			 {
			 $("#alertError").text(status);
			 $("#alertError").show();
			 return;
			 }
			
			
			// If valid------------------------
			var type = ($("#hidAppoinIDSave").val() == "") ? "POST" : "PUT"; 
			$.ajax( {  
				url : "AppoinmentAPI",  
				type : type,  
				data : $("#appointmentForm").serialize(),  
				dataType : "text",  
				complete : function(response, status)  
				{   
					onAppoinSaveComplete(response.responseText, status);  
				} 
			}); 

		});

function onAppoinSaveComplete(response, status) {  
	 if (status == "success")  {  
		 var resultSet = JSON.parse(response); 
	 
	  if (resultSet.status.trim() == "success")   { 
		  $("#alertSuccess").text("Successfully saved.");   
		  $("#alertSuccess").show(); 
		  $("#divItemsGrid").html(resultSet.data);  
	   } else if (resultSet.status.trim() == "error")   {   
		   $("#alertError").text(resultSet.data);   
		   $("#alertError").show();  
	   } 
	 
	 } else if (status == "error")  {  
		 $("#alertError").text("Error while saving.");  
		 $("#alertError").show();  
		 } else  {  
			 $("#alertError").text("Unknown error while saving..");  
			 $("#alertError").show(); 
		 } 
	 
	 
	 $("#hidAppoinIDSave").val("");  
	 $("#appointmentForm")[0].reset(); 
	
	
	} 

//UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event)
{
 $("#hidAppoinIDSave").val($(this).closest("tr").find('#hidAppoinIDUpdate').val());
 $("#patientName").val($(this).closest("tr").find('td:eq(0)').text());
 $("#doctorName").val($(this).closest("tr").find('td:eq(1)').text());
 $("#hospitalName").val($(this).closest("tr").find('td:eq(2)').text());
 $("#description").val($(this).closest("tr").find('td:eq(3)').text());
});

$(document).on("click", ".btnRemove", function(event)
{  
	$.ajax(  {   
		url : "AppoinmentAPI",   
		type : "DELETE",  
		data : "appinmentId=" + $(this).data("appoid"),   
		dataType : "text",   
		complete : function(response, status)  
		{    
			onAppoinDeleteComplete(response.responseText, status);  
			} 
	}); 
	}); 

function onAppoinDeleteComplete(response, status) { 
	if (status == "success")  {   
		var resultSet = JSON.parse(response); 

		if (resultSet.status.trim() == "success")  
		{    
			$("#alertSuccess").text("Successfully deleted.");   
			$("#alertSuccess").show(); 

			$("#divItemsGrid").html(resultSet.data); 
		} else if (resultSet.status.trim() == "error")   {   
			$("#alertError").text(resultSet.data);    
			$("#alertError").show();  
		} 

	} else if (status == "error")  {  
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();  
		} else  {  
			$("#alertError").text("Unknown error while deleting..");  
			$("#alertError").show();  
			} 
	} 

//CLIENT-MODEL================================================================
function validateAppoinForm()
{
// PATIENT
if ($("#patientName").val().trim() == "")
 {
 return "Insert Patientt Name.";
 }
// NAME
//if ($("#doctorName").val().trim() == "")
// {
// return "Insert Doctor Name.";
// }



//DOCTOR
if ($("#doctorName").val() == "0") 
{  
	return "Select year.";  
} 


// HOSPITAL-------------------------------
if ($("#hospitalName").val().trim() == "")
 {
 return "Insert Doctor Name.";
 }


//PHONE NUMBER
if ($("#description").val().trim() == "")
 {
 return "Insert phone number.";
 }
//  PHONE NUMBER NUMERICAL VALUE
var description = $("#description").val().trim();
if (!$.isNumeric(description))
	{
		return "Insert a numerical value for phone number.";
	}
return true;
}























