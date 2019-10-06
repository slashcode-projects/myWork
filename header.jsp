<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="views/styles/bootstrap.min.css">
<title>Employee Management System</title>
</head>
<% 
Object mainList = request.getAttribute("employeeList");
ObjectMapper mapper=  new ObjectMapper();
String jsonInString = mapper.writeValueAsString(mainList);
%>
<script>
var str = '<%=jsonInString%>';

function checkThis(control) {
	var colId = control.id;
	var checkId = colId.charAt(0);
	console.log('Checked Id '+checkId);
	var obj = JSON.parse(str);
	var emp = getEmployeeById(checkId);
	console.log('Checked Emp :: '+emp.empName);
	if(emp.deptName == null || emp.deptName ==''){
	for(var i=0; i<obj.length; i++)
		{
		var empData = obj[i];
			if(emp.empId == empData.deptName){
				console.log('Making this disable :: '+empData.empId);
				document.getElementById(i+'y').disabled = true;
				document.getElementById(i+'n').disabled = true;
				document.getElementById(i+'name').disabled = true;
			}
		}
	}
	else{
		alert('Please select above checkList first..');
		document.getElementById(colId).checked = false;
	}
}

function getEmployeeById(checkId){
	var emp;
	var obj = JSON.parse(str);
	for(var i=0; i<obj.length; i++){
		if(i == checkId){
		emp = obj[i];
		}
		}
	return emp;
}

</script>



<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Features</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Pricing</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">About</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="Search">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

<br/>