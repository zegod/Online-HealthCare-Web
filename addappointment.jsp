<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<html>
<form>
<body bgcolor=skyblue text=darkblue>
<h2 style="color:red">  APPOINTMENT </h2>
<hr color=darkblue size=1>
<div style="background-color:skyblue;border:none;width:100%; height:70%;float:left;border:none">
<%
int n=0;
	try
	{ 
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","123");
		Statement state=con.createStatement();
		String q="select * from appointment order by appointno desc";
		ResultSet res=state.executeQuery(q);
		if(!res.next())
			n=0;
		else
			n=Integer.parseInt(res.getString("appointno"));
		n++;
	}
	catch(Exception obj)
	{
		out.write(obj.getMessage());
	}
%>
<table cellspacing=25 > 
<tr>
<td> Appointment Number </td> <td> <input type=text readonly value=<%out.print(n);%> size=20 name=tappointno> </td> </tr>
<tr> 
<td> Doctor Name </td> <td> <input type=text size=20 name=adoctor required> </td> </tr>
<tr> 
<td> Patient Name </td> <td> <input type=text size=20 name=apatient > </td></tr> 
<tr>
<td> Disease </td> <td> <input type=text size=20 name=adisease > </td> </tr>
<tr>
<td> Date </td> <td> <input type=date size=10 name=adate> </td></tr>
<tr>
<td> Time </td> <td> <input type=time size=6 name=atime> </td> </tr>
  <%
        String r=request.getParameter("b1");
		   if("SUBMIT".equals(r))
		     {
			     int appointno;
			     String atime,adoctor,apatient,adisease,adate;
				 appointno=Integer.parseInt(request.getParameter("tappointno"));
		         adoctor=request.getParameter("adoctor");
		         apatient=request.getParameter("apatient");
		         adisease=request.getParameter("adisease");
				 adate=request.getParameter("adate");
		         atime=request.getParameter("atime");
		    try
		        { 
			      Class.forName("oracle.jdbc.driver.OracleDriver");
				  Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","123");
				
				  Statement state=con.createStatement();
				  String q="insert into appointment values("+appointno+",'"+adoctor+"','"+apatient+"','"+adisease+"','"+adate+"','"+atime+"')";
				  state.executeUpdate(q);
				  out.write("<h2> Successfully Registered </h2>");
				}
				    catch(Exception obj)
					{   
					  out.write(obj.getMessage());
                      }
			}
   %>
</table>
</div>
<hr color=darkblue size=1>
<input type=SUBMIT value="SUBMIT" name=b1 style="width:80;height:30;background-color:teal;color:white"> 
<input type=SUBMIT value="RESET" name=b2 style="width:80;height:30;background-color:teal;color:white"> 

</form>
</body>
</html>
