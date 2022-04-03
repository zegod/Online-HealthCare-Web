<%@page import="java.sql.*"%>
<html>
<body bgcolor=teal text=darkblue>
<form>
<hr style="color:red">
<h2> Student Registration </h2>
<hr color=blue>
  <table cellspacing=20>
    <tr>
     <td> Roll no. </td> <td> <input type=text name=t1 size=10> </td>
    <tr>
     <td> Name </td> <td> <input type=text name=t2 size=10> </td>
    <tr>
     <td> Course </td> <td> <input type=text name=t3 size=10> </td>
    <tr>
     <td> Age </td> <td> <input type=text name=t4 size=10> </td>
    <tr>
     <td>Phone No. </td> <td> <input type=text name=t5 size=10> </td>
    </tr>
  </table>
<hr>
   <input type=submit value=SUBMIT name=b1>
    <input type=submit value=RESET>
<%
String r=request.getParameter("b1");
   if("SUBMIT".equals(r))
      {
	    int trno,tage;
		String tname,tcourse,tphone;
		trno=Integer.parseInt(request.getParameter("t1"));
		tname=request.getParameter("t2");
		tcourse=request.getParameter("t3");
		tage=Integer.parseInt(request.getParameter("t4"));
		tphone=request.getParameter("t5");
		    try
		      { 
			    Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:x","system","123");
				
				Statement state=con.createStatement();
				String q="insert into student values("+trno+",'"+tname+"','"+tcourse"',"+tage+",'"+tphone+"')";
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
					
		     




