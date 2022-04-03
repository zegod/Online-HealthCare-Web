<%@page import="java.sql.*"%>
<html>
<body style="margin:0">
<form>
<div style="background-color:grey;width:60%;height:100%;float:left">
	<img src=images/group.gif width=100% height=100%>
	</div>
	<fieldset style="background-color:powderblue;width:37.5%;height:96.3%;float:left">
	<center>
<font color=red size=5> <center> <br> USER LOGIN </center> </font><br>
<img src=images/admin1.jpg width=50% height=43%>
<br> <br>
<table cellspacing=20>
<tr>
<td>Name</td> <td><input type=text name=t1 style="width:240;height=60"></td>
</tr>
<tr>
<td> Password </td> <td><input type=password name=t2 style="width:240;height=40"></td> 
</tr>
</table>
<br> <br> <center>
<input type=submit value=LOGIN name=b1 style="width:100;height=60;background-color:teal;color:white"> </center>
</center>

<%
String r=request.getParameter("b1");
	
	if("SUBMIT".equals(r))
	{
	String tname,pass;
	tname=request.getParameter("t1");
	pass=request.getParameter("t2");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","123");
		Statement st=con.createStatement();
		String q="select * from reg where NAME='"+tname+"' and PASSWORD='"+pass+"'";
		ResultSet res=st.executeQuery(q);
		if(!res.next())
		out.write("incorrect");
		else	
			{	
			%>
			{
				response.sendRedirect("http://localhost:8088/ADITYA/project/listofappointment.jsp");
			}
			<%
			}
			}
			catch(Exception obj)
				{
					out.write(obj.getMessage());
				}
	}
	
	
%>
	</fieldset>
	</form>
	</body>
	</html>