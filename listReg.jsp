<%@page import="java.sql.*"%>
<html>
<body bgcolor=lightblue text=darkblue size=10>
<center>
<h2 style=color:red> LIST OF REGISTRATION </h2>
<table border=1 width=1200> 
<tr>
<td style=color:red> Reg. No. </td> 
<td style=color:red> Name </td> 
<td style=color:red> Address </td> 
<td style=color:red> Date </td> 
<td style=color:red> Phone </td> 
<td style=color:red> Email Id  </td> 
<td style=color:red> Password </td>
<td style=color:red> Gender </td>
</tr>		  
		  <%
           try
		   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
		   Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","123");
		   Statement state=con.createStatement();
		   String q="select * from reg order by rno asc";
		   ResultSet res=state.executeQuery(q);
		   while(res.next())
		   {
		   
	       %>
			  <tr>
			  <td> <% out.write(res.getString("rno")); %></td>
           <td> <% out.write(res.getString("name")); %> </td>
		     <td> <% out.write(res.getString("address")); %> </td>
			  <td> <% out.write(res.getString("rdate")); %> </td> 
			  <td> <% out.write(res.getString("phone")); %> </td> 
			  <td> <% out.write(res.getString("email")); %> </td>
           <td> <% out.write(res.getString("password")); %> </td> 	
		    <td> <% out.write(res.getString("gender")); %> </td> 
			</tr>
		<%
            }
			}
			  catch(Exception obj)
			    {
				out.write(obj.getMessage());
				}
			%>
</table> 
</body>
</html>
