<%@page import="java.sql.*"%>
<html>
<body bgcolor=darkblue text=white>
<form>
<h2> <center> DELETE / EDIT DISEASE </h2> </center>
<hr>
<table cellspacing=25>
<tr>
<td> Disease No. </td> <td><input type=text size=20 name=txtdisno> </td> 
<tr>
<td> Disease Type </td><td><input type=text size=20 name=txtdistype> </td> 
<tr>
<td> Treatment </td> <td><input type=text size=20 name=txttreatment> </td> 
<tr>
<td> Precaution </td> <td><input type=text size=20 name=txtprecaution> </td> 
</table>
<hr>
<input type=submit value=DELETE name=b1 style="width:80;height:45;background-color:teal;color:white">
<input type=submit value=RESET name=b2 style="width:80;height:45;background-color:teal;color:white">
<%
String r=request.getParameter("b1");
   if("SUBMIT".equals(r))
      {
	    int tdisno;
		String tdistype,ttreatment,tprecaution;
		tdisno=Integer.parseInt(request.getParameter("txtdisno"));
		tdistype=request.getParameter("txtdistype");
		ttreatment=request.getParameter("txttreatment");
		tprecaution=request.getParameter("txtprecaution");
		
		    try
		      { 
			    Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:x","system","123");
				
				Statement state=con.createStatement();
				String q="insert into disease values("+tdisno+",'"+tdistype+"','"+ttreatment+"','"+tprecaution+"')";
				state.executeUpdate(q);
				out.write("<h2> Successfully Registered </h2>");
				}
				    catch(Exception obj)
					{   
					  out.write(obj.getMessage());
					  }
			        }
					%>
</form>
</body>
</html>