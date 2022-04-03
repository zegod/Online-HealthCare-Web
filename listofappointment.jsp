<%@page import="java.sql.*"%>
<html>
<body bgcolor=lightblue text=darkblue size=10 >
<center>
<h2 style=color:red> LIST OF APPOINTMENT </h2>
<table cellspacing=1 border=1 width=1200> 
<hr>
<tr>
<td style=color:crimson> Appointment No. </td>
<td style=color:crimson> Doctor name </td>
<td style=color:crimson> Patient</td>
<td style=color:crimson> Disease </td>
<td style=color:crimson> Date </td>
<td style=color:crimson> Time </td>
</tr>

      <%
           try
		   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
		   Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","123");
		   Statement state=con.createStatement();
		   String q="select * from appointment order by appointno asc";
		   ResultSet res=state.executeQuery(q);
		   while(res.next())
		   {
		   
	       %>
			  <tr>
			  <td> <% out.write(res.getString("appointno")); %></td>
           <td> <% out.write(res.getString("docname")); %> </td>
		     <td> <% out.write(res.getString("patient")); %> </td>
			  <td> <% out.write(res.getString("disease")); %> </td> 
			 <td> <% out.write(res.getString("adate")); %> </td>
			 <td> <% out.write(res.getString("atime")); %> </td>
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
