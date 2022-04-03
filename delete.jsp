<%@page import="java.sql.*"%>
<html>
<body bgcolor=darkblue text=white size=10>
<form>
<center>
<h2 style="color:yellow"> DELETE REGISTRATION </h2></center>
<hr>
 Enter Reg. No. <input type=text name=tt1 size=20> <br> <p>
<input type=submit value=VERIFY name=b1 style="width:120;height:30;background-color:gold;color:white">
<hr>
   <%
      String r=request.getParameter("b1");
	   if("VERIFY".equals(r))
	      {
		    int trno;
			trno=Integer.parseInt(request.getParameter("tt1"));
			  try
			      {
				   Class.forName("oracle.jdbc.driver.OracleDriver");
				   Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","123");
				   Statement State=con.createStatement();
				   String q="select * from reg where rno="+trno;
				   ResultSet res=State.executeQuery(q);
				     if(!res.next())
					   {
					     out.write("<h2> NOT FOUND </h2>");
						 }
						 else 
						 {
						 %>
<table cellspacing=25>
<tr>
<td>Registration no</td> <td> <input type=text name=t1 value=<%out.write(res.getString("rno"));%> </td>
</tr>
<tr>
<td>name </td> <td> <input type=text name=t2 value=<%out.write(res.getString("Name"));%> </td>
</tr>
<tr>
<td>gender </td> <td> <input type=text name=t3 value=<%out.write(res.getString("Gender"));%> </td>
</tr>
<tr>
<td>address </td> <td> <input type=text name=t4 value=<%out.write(res.getString("Address"));%> </td>
</tr>
<tr>
<td>Phone </td> <td> <input type=text name=t5 value=<%out.write(res.getString("Phone"));%> </td>
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
					  int trno2=Integer.parseInt(request.getParameter("t1"));
					    try
						   {
						     Class.forName("oracle.jdbc.driver.OracleDriver");
							 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","123");
							 Statement state=con.createStatement();
							 String q2="delete from reg where rno="+trno2;
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

