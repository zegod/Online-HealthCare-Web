<%@page import="java.sql.*"%>
<html>
<form>
<body bgcolor=powderblue style="margin:0">
<center>
<div style="background-color:skyblue;border:none;width:40%; height:95%;margin-top:10">
<font color=red size=6> <center> <br> ADMINISTRATOR </center> </font>
<img src=images/admin.jpg width=50% height=45%>
<br> <br>
<input type=text placeholder="NAME" name=t1 required style="width:280;height=60">
<br>
<br>
<input type=password placeholder="PASSWORD" name=t2 required style="width:280;height=40">
<br> <br> <center>
<input type=SUBMIT value=LOGIN name=b1 style="background-color:teal;color:yellow;width:57.5;height=50"> </center>
   <%  
        String r=request.getParameter("b1");
		if("LOGIN".equals(r))
		{
			String n,p;
			n=request.getParameter("t1");
			p=request.getParameter("t2");
			try
			{  
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","123");
				Statement state=con.createStatement();
				String q="select * from admin where name='"+n+"' and password='"+p+"'";
				ResultSet res=state.executeQuery(q);
				if(!res.next())
					out.write("<h2> Incorrect </h2>");
				else
				{
					response.sendRedirect("http://localhost:8088/ADITYA/project/authority.jsp");
				}
			}
			catch(Exception obj)
			{   
				out.write(obj.getMessage());
            }
		}
   %>
</div>
</form>
</center>
</body>
</html>