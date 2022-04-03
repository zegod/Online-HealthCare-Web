<%@page import="java.sql.*"%>
<html>
<body bgcolor=lightblue text=darkblue size=10 >
<center>
<h2 style=color:red> LIST OF DISEASE </h2>
<table border=1 width=1200> 
<tr>
<td> Disease No. </td>
<td> Disease Type </td>
<td>  Treatment  </td>
<td>  Precautions  </td>
</tr>

      <%
           try
		   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
		   Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","123");
		   Statement state=con.createStatement();
		   String q="select * from disease";
		   ResultSet res=state.executeQuery(q);
		   while(res.next())
		   {
		   
	       %>
			  <tr>
			  <td> <% out.write(res.getString("disno")); %></td>
           <td> <% out.write(res.getString("rdisname")); %> </td>
		     <td> <% out.write(res.getString("treatment")); %> </td>
			  <td> <% out.write(res.getString("precaution")); %> </td> 
			<hr>  
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
