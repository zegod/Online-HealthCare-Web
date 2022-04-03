<%@page import="java.sql.*"%>
<html>
<body bgcolor=darkblue text=white>
<form> 
<table>
<br>
<tr>
<td> <font color=white size=5 > Disease No. </td> <td><input type=text size=20 name=txtdisno> </td> 
<tr>
<td> <font color=white size=5> Disease type </td> <td> <input type=text size=20 name=txtrdisname></td>
<tr>
<td> <font color=white size=5> Treatment </td> <td> <input type=text size=20 name=txttreatment> </td>
<tr>
<td> <font color=white size=5> Precaution </td> <td> <input type=text size=20 name=txtprecaution> </td>
</table>
<hr>
<br>
<input type=submit value=SUBMIT name=b1 style="width:80;height:40;background-color:teal;color:white"> 
<input type=reset value=RESET name=b2 style="width:80;height:40;background-color:teal;color:White">
<%
        String r=request.getParameter("b1");
		   if("SUBMIT".equals(r))
		     {
			     int tdisno;
			     String trdisname,ttreatment,tprecaution;
				 tdisno=Integer.parseInt(request.getParameter("txtdisno"));
		         trdisname=request.getParameter("txtrdisname");
		         ttreatment=request.getParameter("txttreatment");
				 tprecaution=request.getParameter("txtprecaution");
		    try
		        { 
			      Class.forName("oracle.jdbc.driver.OracleDriver");
				  Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","123");
				
				  Statement state=con.createStatement();
				  String q="insert into disease values("+tdisno+",'"+trdisname+"','"+ttreatment+"','"+tprecaution+"')";
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