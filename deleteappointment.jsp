<%@page import="java.sql.*"%>
<html>
<body bgcolor=darkblue text=white size=10>
<form>
<center>
<h2 style="color:yellow"> EDIT / DELETE APPOINTMENT </h2></center>
<hr>
 Enter Appointment No. <input type=text name=tt1 size=20 required> <br> <p>
<input type=submit value=VERIFY name=b1 style="width:120;height:30;background-color:gold;color:white">
<hr>
   <%
      String r=request.getParameter("b1");
	   if("VERIFY".equals(r))
	      {
		    int appointno;
			appointno=Integer.parseInt(request.getParameter("tt1"));
			  try
			      {
				   Class.forName("oracle.jdbc.driver.OracleDriver");
				   Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","123");
				   Statement State=con.createStatement();
				   String q="select * from appointment where appointno="+appointno;
				   ResultSet res=State.executeQuery(q);
				     if(!res.next())
					   {
					     out.write("<h2> Not Found! </h2>");
						 }
						 else 
						 {
						 %>
<table cellspacing=25>
<tr>
<td> Appointment No. </td> <td> <%out.write(res.getString("appointno"));%> </td>
</tr>
<tr>
<td>Doctor Name </td> <td> <%out.write(res.getString("docname"));%> </td>
</tr>
<tr>
<td> Patient </td> <td> <%out.write(res.getString("patient"));%> </td>
</tr>
<tr>
<td> Disease </td> <td> <%out.write(res.getString("disease"));%> </td>
</tr>
<tr>
<td> Date </td> <td> <%out.write(res.getString("adate"));%> </td>
</tr>
<tr>
<td> Time </td> <td> <%out.write(res.getString("atime"));%> </td>
</tr>
</table>
<hr>
<input type=submit value=DELETE style="width:120;height:30;background-color:gold;color:white" name=b2>

       <%
	   }
	   }
          catch(Exception obj)
            {
	           out.write(obj.getMessage());
                }
            }
               String r2=request.getParameter("b2");
			       if("DELETE".equals(r2))
				    {
					  int appointno2=Integer.parseInt(request.getParameter("t1"));
					    try
						   {
						     Class.forName("oracle.jdbc.driver.OracleDriver");
							 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","123");
							 Statement state=con.createStatement();
							 String q2="delete from appointment where appointno="+appointno2;
							 state.executeUpdate(q2);
							 out.write("<h2> Successfully Deleted </h2>");
							 }
							   catch(Exception ob2)
							    {
								  out.write(ob2.getMessage());
								  }
							}
								 
			%>			
</form>
</body>
</html>

