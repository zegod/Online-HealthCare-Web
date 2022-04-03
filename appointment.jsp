<%@page import="java.sql.*"%>
<html>
<form>
<body bgcolor=skyblue text=darkblue>
<h2 style="color:red">  APPOINTMENT </h2>
<hr color=darkblue size=1>
<h2 style="color:yellow"> Enter Name  <input type=text size=30 name=t1>
<h2 style="color:yellow"> Enter Password <input type=password size=25 name=t2>
<div style="background-color:skyblue;border:none;width:100%; height:70%;float:left;border:none">
<input type=submit value=VERIFY name=b1 style="width:120;height:30;background-color:gold;color:darkblue">
<%
String r=request.getParameter("b1");
   if ("VERIFY".equals(r))
   {
     String n=request.getParameter("t1");
	 String p=request.getParameter("t2");
	 try
				 {
   				   Class.forName("oracle.jdbc.driver.OracleDriver");
				   Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","123");
				   Statement State=con.createStatement();
				   String q="select * from reg where name='"+n+"' and password='"+p+"'";
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

					<table cellspacing=25 > 
					<tr>
					<td> Name </td> <td> <input type=text readonly value=<%out.print(n);%> size=20 name=tappointno> </td> </tr>
					<tr>
					<td> Date </td> <td> <input type=date size=10 name=adate> </td></tr>
					<tr> 
					<td> Patient Name </td> <td> <input type=text size=20 name=apatient > </td></tr> 
					<tr> 
					<td> Doctor Name </td> <td> <input type=text size=20 name=adoctor required> </td> </tr>
					<tr>
					<td> Disease </td> <td> <input type=text size=20 name=adisease > </td> </tr>
					</table>
					<hr>
					<input type=submit value=SUBMIT name=b2 style="width:120;height:30;background-color:gold;color:darkblue">

					<%	
				}
			    } 
	 catch(Exception obj)
		{   
		  out.write(obj.getMessage());
        }
	}
        String r1=request.getParameter("b2");
		   if("SUBMIT".equals(r))
		     {
			     int appointno;
			     String adoctor,apatient,adisease,adate;
				 appointno=Integer.parseInt(request.getParameter("tappointno"));
		         adate=request.getParameter("adate"); 
		         apatient=request.getParameter("apatient");
		         adoctor=request.getParameter("adoctor");
				 adisease=request.getParameter("adisease");
				 
	
		    try
		        { 
			      Class.forName("oracle.jdbc.driver.OracleDriver");
				  Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","123");
				  Statement state=con.createStatement();
				  String q1="insert into appointment values("+appointno+",'"+adate+"','"+apatient+"','"+adoctor+"','"+adisease+"')";
				  state.executeUpdate(q1);
				  out.write("<h2> Successfully Registered </h2>");
				}
				    catch(Exception obj)
					{   
					  out.write(obj.getMessage());
                      }
			}
   %>
</div>
</form>
</body>
</html>
