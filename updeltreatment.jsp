<%@page import="java.sql.*"%>
<html>
<body bgcolor=darkblue text=white size=10>
<form>
<center>
<h2 style="color:yellow"> EDIT / DELETE TREATMENT </h2></center>
<hr>
 Enter Treatment No. <input type=text name=tt1 size=20 required> <br> <p>
<input type=submit value=VERIFY name=b1 style="width:120;height:30;background-color:gold;color:darkblue">
<hr>
   <%
      String r=request.getParameter("b1");
	   if("VERIFY".equals(r))
	      {
		    int treatno;
			treatno=Integer.parseInt(request.getParameter("tt1"));
			  try
			      {
				   Class.forName("oracle.jdbc.driver.OracleDriver");
				   Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","123");
				   Statement State=con.createStatement();
				   String q="select * from treatment where treatno="+treatno;
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
<td> Treat No.</td> <td> <input type=text name=t1  readonly value=<%out.write(res.getString("treatno"));%> </td>
</tr>
<tr>
<td>Disease Name </td> <td> <input type=text name=t2 readonly value=<%out.write(res.getString("disname"));%> </td>
</tr>
<tr>
<td> Medicine Name </td> <td> <input type=text name=t3 readonly value=<%out.write(res.getString("mediname"));%> </td>
</tr>
<tr>
<td> Precaution </td> <td> <input type=text name=t4 readonly value=<%out.write(res.getString("precaution"));%> </td>
</tr>
<tr>
<td> Exercise </td> <td> <input type=text name=t5 readonly value=<%out.write(res.getString("exercise"));%> </td>
</tr>
</table>
<hr>
<input type=submit value=DELETE style="width:120;height:30;background-color:gold;color:darkblue" name=b2>

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
					  int treatno=Integer.parseInt(request.getParameter("t1"));
					    try
						   {
						     Class.forName("oracle.jdbc.driver.OracleDriver");
							 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","123");
							 Statement state=con.createStatement();
							 String q2="delete from treatment where treatno="+treatno;
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

