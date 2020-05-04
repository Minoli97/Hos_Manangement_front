$(document).ready(function()
{
if ($("#alertSuccess").text().trim() == "")
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
			// Form validation-------------------
			var status = validateAppoinForm();
			if (status != true)
			 {
			 $("#alertError").text(status);
			 $("#alertError").show();
			 return;
			 } 
			// If valid------------------------
			 $("#appointForm").submit();

		});
//UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event)
{
 $("#hidAppoinIDSave").val($(this).closest("tr").find('#hidAppoinIDUpdate').val());
 $("#patientName").val($(this).closest("tr").find('td:eq(0)').text());
 $("#doctorName").val($(this).closest("tr").find('td:eq(1)').text());
 $("#hospitalName").val($(this).closest("tr").find('td:eq(2)').text());
 $("#description").val($(this).closest("tr").find('td:eq(3)').text());
});

//CLIENT-MODEL================================================================
function validateAppoinForm()
{
// CODE
if ($("#patientName").val().trim() == "")
 {
 return "Insert Patientt Name.";
 }
// NAME
if ($("#doctorName").val().trim() == "")
 {
 return "Insert Doctor Name.";
 }
// PRICE-------------------------------
if ($("#Hospital Name").val().trim() == "")
 {
 return "Insert Doctor Name.";
 }
// is numerical value
//var tmpPrice = $("#itemPrice").val().trim();
//if (!$.isNumeric(tmpPrice))
// {
// return "Insert a numerical value for Item Price.";
// }

// convert to decimal price
 //$("#itemPrice").val(parseFloat(tmpPrice).toFixed(2));

// DESCRIPTION------------------------
if ($("#description").val().trim() == "")
 {
 return "Insert Patient Description.";
 }
return true;
}
