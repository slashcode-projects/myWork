<%@ include file="header.jsp" %>

<div class="container">
<table class="table table-hover">
<thead>
<tr class="table-primary"><th scope="col">Employee ID</th><th scope="col">Name</th>
<th>Yes</th>
<th>No</th>
<th>Remarks</th>
<th scope="col">Department</th></tr>
</thead>
<% int i=0; %>
<c:forEach items="${employeeList}" var="employee">
<tbody>
    <tr>
        <td> <c:out value="${employee.empId}"/></td>
        <td> <c:out value="${employee.empName}"/></td>
        <td> <input type="radio" name="<%= i%>check" id="<%= i%>y" onClick="checkThis(this)"> </td>
        <td> <input type="radio" name="<%= i%>check" id="<%= i%>n" onClick="checkThis(this)"> </td>
        <td> <input type="text" name="<%= i%>name" id="<%= i%>name"> </td>  
        <td> <c:out value="${employee.deptName}"/> </td>
   
    <% i++; %>
    </tr>
</tbody>

</c:forEach>

</table>

<br/>

<a href="addNewEmployee" type="button" class="btn btn-primary" >Add New Employee</a>

<br/>


<form action="employee">


<div class="form-group">
<label for="empId">Enter Employee Id :</label> 
<input class="form-control" id="empId" type="text" name="empId"/>
</div>


<input type="submit" value="Find Employee By Id" class="btn btn-primary"/>
</form>

</div>

<br/>
<hr/>
<br/>

<%@ include file="footer.jsp" %>