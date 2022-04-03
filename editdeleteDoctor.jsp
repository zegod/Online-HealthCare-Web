<%@page import="java.sql.*"%>
<html>
<body bgcolor=darkblue text=white size=10>
<form>
<center>
<h2 style="color:yellow"> EDIT / DELETE DOCTOR </h2></center>
<hr>
 Enter Doc. Id <input type=text name=tt1 size=20 required> <br> <p>
<input type=submit value=VERIFY name=b1 style="width:120;height:30;background-color:gold;color:white">
<hr>
   <%
      String r=request.getParameter("b1");
	   if("VERIFY".equals(r))
	      {
		    int docid;
			docid=Integer.parseInt(request.getParameter("tt1"));
			  try
			      {
				   Class.forName("oracle.jdbc.driver.OracleDriver");
				   Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","123");
				   Statement State=con.createStatement();
				   String q="select * from doctor where docid="+docid;
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
<td> Doctor Id </td> <td> <input type=text name=t1 value=<%out.write(res.getString("docid"));%> </td>
</tr>
<tr>
<td>Doc Name </td> <td> <input type=text name=t2 value=<%out.write(res.getString("docname"));%> </td>
</tr>
<tr>
<td> Gender </td> <td> <input type=text name=t3 value=<%out.write(res.getString("gender"));%> </td>
</tr>
<tr>
<td> Address </td> <td> <input type=text name=t4 value=<%out.write(res.getString("address"));%> </td>
</tr>
<tr>
<td>Phone </td> <td> <input type=text name=t5 value=<%out.write(res.getString("phone"));%> </td>
</tr>
<tr>
<td> Speciality </td> <td> <input type=text name=t6 value=<%out.write(res.getString("speciality"));%> </td>
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
					  int docid2=Integer.parseInt(request.getParameter("t1"));
					    try
						   {
						     Class.forName("oracle.jdbc.driver.OracleDriver");
							 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","123");
							 Statement state=con.createStatement();
							 String q2="delete from doctor where docid="+docid2;
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

