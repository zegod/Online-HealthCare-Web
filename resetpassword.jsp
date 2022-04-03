<%@page import="java.sql.*"%>
<html>
<body bgcolor=darkblue text=white size=10>
<form>
<h2 style="color:yellow"> Enter Current Password <input type=password size=25 name=t1> </h2>
<hr>
<input type=submit value=VERIFY name=b1 style="width:120;height:30;background-color:gold;color:darkblue">
<% 
   String r=request.getParameter("b1");
   if ("VERIFY".equals(r))
   {
     String current=request.getParameter("t1");
	 try
				 {
   				   Class.forName("oracle.jdbc.driver.OracleDriver");
				   Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","123");
				   Statement State=con.createStatement();
				   String q="select * from admin where password='"+current+"'";
				   ResultSet res=State.executeQuery(q);
				     if(!res.next())
					   {
					     %>
						  <script>
						     alert("Incorrect");
							 </script>
							  <%
							  }
				else
                  {
                    %>
					<table>
					<tr>
              <td> Enter New Password </td> <td><input type=password name=t2 value=<%out.write(res.getString("password"));%>> </td>
					</tr>
					<tr>
					<td> Confirm Password </td> <td><input type=password name=t3 value=<%out.write(res.getString("password"));%>></td>
					</tr>
					</table>
					<hr>
					<input type=submit name=b2 value=UPDATE>
					<%
					}
					}
					catch(Exception ob2)
					  {
					     out.write(ob2.getMessage());
						 }
					  }					  
					String r2=request.getParameter("b2");
                    if("UPDATE".equals(r2))
                     {
                      String np,cp;
                      np=request.getParameter("t2");
                      cp=request.getParameter("t3");
                    if (!np.equals(cp))
                    { 
                     out.write("<h2> Not Match </h2>");
                    }
                   else
                 {
                    try 
					{
					 Class.forName("oracle.jdbc.driver.OracleDriver");
				   Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","123");
				   Statement State=con.createStatement();
				   String q2="update admin set password='"+np+"'";
                   State.executeUpdate(q2);
                   out.write("<h2> Successfully Updated </h2>");
					}
					   catch(Exception ob2)
							    {
								  out.write(ob2.getMessage());
								  }
							}
					}
%>
</form>
</body>
</html>					