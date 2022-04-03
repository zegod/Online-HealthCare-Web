<%@page import="java.sql.*"%>
<html>
<form>
<body bgcolor=skyblue text=darkblue>
<h2 style="color:red">  TREATMENT </h2>
<hr color=darkblue size=1>
<h2 style="color:blue"> Enter Name    <input type=text size=25 name=t1> </h2>
<h2 style="color:blue"> Enter Password <input type=password size=25 name=t2> </h2>
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
            	 
				  Disease <select name=dis>
				   <%  
				  		
					Statement state=con.createStatement();
				    q="select * from disease";
				    res=state.executeQuery(q);
				    while(res.next())
				    {
				      %>
				     <option> <% res.getString("disease");%>
				     </option>
				    <%
				     }
				  }
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