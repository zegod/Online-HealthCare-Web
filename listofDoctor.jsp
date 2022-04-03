<%@page import="java.sql.*"%>
<html>
<body bgcolor=lightblue text=darkblue size=10 >
<center>
<h2 style=color:red> LIST OF DISEASE </h2>
<table cellspacing=1 border=1 width=1200> 
<tr>
<td style=color:crimson> Disease Id. </td>
<td style=color:crimson> Name </td>
<td style=color:crimson>  Gender  </td>
<td style=color:crimson>  Address </td>
<td style=color:crimson> Phone </td>
<td style=color:crimson> Speciality </td>
</tr>

      <%
           try
		   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
		   Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","123");
		   Statement state=con.createStatement();
		   String q="select * from doctor";
		   ResultSet res=state.executeQuery(q);
		   while(res.next())
		   {
		   
	       %>
			  <tr>
			  <td> <% out.write(res.getString("docid")); %></td>
           <td> <% out.write(res.getString("docname")); %> </td>
		     <td> <% out.write(res.getString("address")); %> </td>
			  <td> <% out.write(res.getString("gender")); %> </td> 
			 <td> <% out.write(res.getString("phone")); %> </td>
			 <td> <% out.write(res.getString("speciality")); %> </td>
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
