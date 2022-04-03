<%@ page import="java.sql.*"*%>
<html>
<Body bgcolor=skyblue text=darkblue>
<form>
<h2 style="color:red"> REGISTRATION FORM </h2> 
<hr color=darkblue size=1>	
<table cellspacing=15>
<tr>
<td>Reg. No. </td> <td> <input type=text size=10 name=txtrno> </td>
</tr>
 <tr> 
<td> Reg. Date </td> <td> <input type=text size=10 name=txt> </td>
<tr>
 <td> Name </td> <td> <input type=text size=20 required> </td>
 <tr>
 <td> Password </td> <td> <input type=password size=30 required></td> 
 <tr>
 <td>Confirm Password</td> <td> <input type=password size=30 required></td>
 <tr>

<td> Gender </td> <td><input type=radio name=gender value="M" checked >Male
<input type=radio name=gender value="F" checked>Female</td>
 <tr>
 <td>Phone No.</td> <td> <input type=text size=20></td>
  <tr>
<td> Address </td> <td> <input type=text size=40 style=background-color="red" required></td>
 <tr>
<td> Email Id </td> <td> <input type=text size=40 style=background-color="red" required></td>		
</table>
<hr color=darkblue size=1>
<input type=SUBMIT value=SUBMIT style="width:100;height:25;background-color:teal;color:white">
<input type=RESET value=RESET style="width:100;height:25;background-color:teal;color:white">
  <%
    String r=request.getParameter("b1");
        if("SUBMIT".equals(r))
      {
	    int trno,tage,tdate;
		String tname,tcourse,tphone,temail,taddress;
		trno=Integer.parseInt(request.getParameter("t1"));
		tdate=Integer.parseInt(request.getParameter("t6");
		tname=request.getParameter("t2");
		tcourse=request.getParameter("t3");
		tage=Integer.parseInt(request.getParameter("t4"));
		tphone=request.getParameter("t5");
		temail=request.getParameter("t7");
		taddress=request.getParameter("t8")
		try
		      { 
			    Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","123");
				
				Statement state=con.createStatement();
				String q="insert into student values("+trno+",'"+tname+"','"+tcourse+"',"+tage+",'"+tphone+"',"+tdate+",'"+email_id"','"+address+"')";
				State.executeUpdate(q);
				out.write("<h2> Successfully Registered </h2>");
				}
				    catch(Exception obj)
					{   
					  out.write(obj.getMessage());
					  }
			        }
					%>

</body>
</html>