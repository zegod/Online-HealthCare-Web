<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<html>
<Body bgcolor=skyblue text=darkblue>
<form>
<h2 style="color:red"> REGISTRATION FORM </h2> 
<hr color=darkblue size=1>
<%
int n=0;
DateFormat df=new SimpleDateFormat("dd-MM-yyyy");
Date dateobj=new Date();
String dd=df.format(dateobj);

	try
	{ 
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","123");
		Statement state=con.createStatement();
		String q="select * from reg order by rno desc";
		ResultSet res=state.executeQuery(q);
		if(!res.next())
			n=0;
		else
			n=Integer.parseInt(res.getString("rno"));
		n++;
	}
	catch(Exception obj)
	{
		out.write(obj.getMessage());
	}
%>
<table cellspacing=15>
<tr>
<td>Reg. No. </td> <td> <input type=text name=txtrno readonly value=<%out.print(n);%> size=10 required> </td>
</tr>
 <tr> 
<td> Reg. Date </td> <td> <input type=text value=<%out.write(dd);%> readonly name=txtrdate size=10> </td>
<tr>
 <td> NAME </td> <td> <input type=text name=txtname size=20 required> </td>
 <tr>
 <td> Password </td> <td> <input type=password name=txtpassword size=30 required></td> 
 <tr>
 <td>Confirm Password</td> <td> <input type=password name=confirm size=30 required></td>
 <tr>

<td> Gender </td> <td> <input type=radio name=gender value="M" checked >Male
<input type=radio name=gender value="F" checked> Female </td>
 <tr>
 <td>Phone No.</td> <td> <input type=text name=txtphone size=20></td>
  <tr>
<td> Address </td> <td> <input type=text name=txtaddress size=40 style=background-color="red" required></td>
 <tr>
<td> Email Id </td> <td> <input type=text name=txtemail size=40 style=background-color="red" required></td>		
</table>
<hr color=darkblue size=1>
<input type=SUBMIT value=SUBMIT name=b1 style="width:100;height:25;background-color:teal;color:white">
<input type=RESET value=RESET style="width:100;height:25;background-color:teal;color:white">
   <%
        String r=request.getParameter("b1");
		   if("SUBMIT".equals(r))
		     {
			   int trno;
			     String tname,taddress,tphone,temail,tdate,tpassword,tgender,confirmpass;
				 trno=Integer.parseInt(request.getParameter("txtrno"));
		         tname=request.getParameter("txtname");
		         taddress=request.getParameter("txtaddress");
		         tdate=request.getParameter("txtrdate");
		         tphone=request.getParameter("txtphone");
				 temail=request.getParameter("txtemail");
				 tpassword=request.getParameter("txtpassword");
				 confirmpass=request.getParameter("confirm");
				 tgender=request.getParameter("gender");
				 if(!confirmpass.equals(tpassword))
				 {
					out.write("<h2>Password Not Match</h2>");
				 }
			else
			{
		    try
		        { 
			      Class.forName("oracle.jdbc.driver.OracleDriver");
				  Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","123");
				
				  Statement state=con.createStatement();
				  String q="insert into reg values("+trno+",'"+tdate+"','"+tname+"','"+tpassword+"','"+tgender+"','"+taddress+"','"+tphone+"','"+temail+"')";
				  state.executeUpdate(q);
				  out.write("<h2> Successfull Registered </h2>");
				}
				    catch(Exception obj)
					{   
					  out.write(obj.getMessage());
                      }
			}
		}
   %>
	</form>
</body>
</html>