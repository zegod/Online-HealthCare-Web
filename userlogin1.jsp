<%@page import="java.sql.*"%>
<%
String r=request.getParameter("b1");
	
	if("SUBMIT".equals(r))
	{
	String tname,pass;
	uname=request.getParameter("t1");
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
			<html>
			<body>
			<jsp:forward page="admin.jsp",/>
			</body>
			</html>
			<%
			}
			}
			catch(Exception obj)
				{
					out.write(obj.getMessage());
				}
	}
	
	
%>
