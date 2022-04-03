<%@page import="java.sql.*"%>
<html>
<body bgcolor=skyblue>
<form>
<h2 style="color:red">  ADD DOCTOR </h2> 
<hr color=darkblue size=1>
<table cellspacing=15>
<tr>
<td> Doctor Id </td> <td> <input type=text name=t1 size=10> </td> </tr>
<tr>
<td> Doctor Name </td> <td> <input type=text name=t2 size=30> </td> </tr>
<tr>
<td> Address </td> <td> <input type=text name=t3 size=50> </td> </tr>
<tr>
<td> Gender </td> <td> <input type=text name=t4 size=5> </td> </tr>
<tr>
<td> Phone </td> <td> <input type=text name=t5 size=10> </td> </tr>
<tr>
<td> Speciality </td> <td> <input type=text name=t6 size=40> </td> </tr>
</table>
<input type=SUBMIT value=SAVE name=b1 style="width:5%;height:5%;background-color:teal;color:white">
<input type=RESET value=RESET style="width:5%;height:5%;background-color:teal;color:white">
        <%
		       String r=request.getParameter("b1");
			   if("SAVE".equals(r))
			     {
				   int docid;
				   String docname,address,gender,phone,speciality;
				 docid=Integer.parseInt(request.getParameter("t1"));
		         docname=request.getParameter("t2");
		         address=request.getParameter("t3");
		         gender=request.getParameter("t4");
				 phone=request.getParameter("t5");
				 speciality=request.getParameter("t6");
				  try
		        { 
			      Class.forName("oracle.jdbc.driver.OracleDriver");
				  Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","123");
				
				  Statement state=con.createStatement();
				  String q="insert into doctor values("+docid+",'"+docname+"','"+address+"','"+gender+"','"+phone+"','"+speciality+"')";
				  state.executeUpdate(q);
				  out.write("<h2> Successfull Registered </h2>");
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

