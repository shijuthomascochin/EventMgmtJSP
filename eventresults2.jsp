<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//w3c//dtd html 4.0 transitional//en">
<html><head><title>Event Management System</title>
<meta name="Description" content="Place your website description in this area. This is read by some search engines.">
<meta name="KeyWords" content="add, your, keywords and phrases in this area, seperated, by, commas, this, is read by only a, few search, engines">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="Copyright" content="Copyright 2006 AllWebCo Design http://allwebcodesign.com/">
<meta http-equiv="Content-Language" content="en">
<meta name="revisit-after" content="15 days">
<meta name="robots" content="index, follow">
<meta name="rating" content="General">
<meta name="robots" content="All">
<link rel="StyleSheet" href="Files/corporatestyle.css" type="text/css">
<style type="text/css">
<!--
.style1 {
	font-size: 36px;
	color: #990000;
}
.style2 {font-size: 14px}
.style4 {font-size: 13px}
.style6 {font-size: 11px}
.style7 {font-size: 10px}
-->
</style>
</head>
<%
	class CDB
	{
		Connection con;
		Statement st;
		public CDB() throws SQLException,ClassNotFoundException
		{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con = DriverManager.getConnection("jdbc:odbc:EVENT","","");
			st = con.createStatement();
		}
		public void idu(String str) throws SQLException
		{
			st.executeUpdate(str);
		}
		public ResultSet select(String str) throws SQLException
		{
			ResultSet rs = null;
			rs = st.executeQuery(str);
			return rs;
		}
	}
	 ResultSet rs=null;
	 CDB obj = new CDB();
%>

<body leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0" background="Files/background.jpg" bgcolor="#d12428" marginheight="0" marginwidth="0" text="#ffffff"><div class="divstyle" id="info" style="display: none; ">
<div id="imagetitle" class="pstyletitle" align="center"></div></div>
<table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%"><tbody><tr><td align="left" valign="top">
<table bgcolor="#d12428" border="0" cellpadding="0" cellspacing="0" width="100%"><tbody><tr>
  <td align="left"><div align="center" class="style1">
  <%
  		rs=obj.select("SELECT [head] FROM [SiteSettings]");
		if(rs.next())
		{
			out.print(rs.getString(1));
		}
  %>
   </div></td>
</tr></tbody></table>

<table border="0" cellpadding="0" cellspacing="0" width="90%">
  <tbody>
    <tr>
      <td class="printhide" align="left" valign="top" width="160"><p>&nbsp;</p>
      <table  cellpadding="0" cellspacing="0" width="154">
        <tbody>
          <tr>
            <td onClick="location.href='index.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Home<br></td>
          </tr>
          <tr>
            <td onClick="location.href='registerevent.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Register<br></td>
          </tr>
          <tr>
            <td onClick="location.href='viewevent.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Events &amp; Rules <br></td>
          </tr>
          <tr>
            <td onClick="location.href='viewparticipants.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Participants<br></td>
          </tr>
          <tr>
            <td onClick="location.href='viewschedule.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Schedule<br></td>
          </tr>
          <tr>
            <td onClick="location.href='viewresult.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Results<br></td>
          </tr>
          <tr>
            <td onClick="location.href='contact.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Contact Us <br></td>
          </tr>
          <tr>
            <td class="menu">&nbsp;</td>
          </tr>
        </tbody>
      </table>
          <form name="form1" method="post" action="index.jsp" onSubmit='return formValidator()' >
            <table width="143" bgcolor="#BD291D">
              <tr bordercolor="#D12428">
                <td colspan="2" bgcolor="#990000"><div align="center"><span class="style2">Login</span></div></td>
              </tr>
              <tr bordercolor="#D12428">
                <td>User ID
                  <label></label></td>
                <td><input name="t1" type="text" id="t1" size="10"></td>
              </tr>
              <tr bordercolor="#D12428">
                <td>Password
                  <label></label></td>
                <td><input name="t2" type="password" id="t2" size="10"></td>
              </tr>
              <tr bordercolor="#D12428">
                <td colspan="2"><div align="center">
                    <input name="Submit" type="submit" class="btn" value="Enter">
                </div></td>
              </tr>
            </table>
            <div align="center">
              <%
		String unam=request.getParameter("t1");
		String pw=request.getParameter("t2");
		if(unam!=null)
		{
        	try
        	{
           		if (unam.equals("admin"))
          	 	{
                	rs = obj.select("select pass from Admin where admin= '" + unam + "'");
                	while (rs.next())
                	{
						String pass=rs.getString(1);
                    	if (pass.equals(pw))
                    	{
                        	session.setAttribute("admin",unam);
                    		response.sendRedirect("adminpage.jsp");
							
                   		}
                    	else
                    	{
                        	out.println("Incorrect password");
                    	}
                	}
            	}
            	else
            	{
                	rs = obj.select("select pass from Admin where admin= '" + unam + "'");
            		if(rs.next())
                	{
						String pass=rs.getString(1);
                    	if (pass.equals(pw))
                   		{
                        	session.setAttribute("arts",unam);
                       		response.sendRedirect("artsadminpage.jsp");
                    	}
						else
                    	{
                      		out.println("Coordinator id or password do not match.");
							out.println("<br>");
							out.println("You have provided "+unam);
                    	}
                	}
					else
					{
						out.println("Coordinator id or password do not match.");
						out.println("<br>");
						out.println("You have provided "+unam);
					}
            	}
        	}
        	catch (Exception ex)
        	{
           		out.println(ex);
        	}
}
%>
            </div>
          </form>
          </td>
      <td class="printhide" align="center" valign="top"><br>      </td>
      <td align="center" valign="top"><table border="0" cellpadding="0" cellspacing="15" width="607">
        <tbody>
          <tr>
            <td align="left" valign="top"><p align="left"><br>
                      <span class="title" style="text-align:left"> Welcome to  
					  <%
					  		rs = obj.select("SELECT [subhead] FROM [SiteSettings]");
							if(rs.next())
							{
								out.print(rs.getString(1));
							}
					  %></span><br>
            </p>
              <p align="left">&nbsp;</p>
              <table width="461" height="76" border="1" align="center">
                    <tr bgcolor="#BF2B1F">
                      <td height="27" colspan="5"><div align="center" class="style4">Arts Festival event results </div></td>
                    </tr>
                    <tr bgcolor="#BF2B1F">
                      <td width="101" height="16"><div align="center" class="style6">Event</div></td>
                      <td width="64"><div align="center" class="style6">Chest No. </div></td>
                      <td width="127"><p align="center" class="style6">Name</p></td>
                      <td width="98"><div align="center" class="style6">Team</div></td>
                      <td width="37"><div align="center" class="style6">Point</div></td>
                    </tr>
                    <%
		 
		  rs=obj.select("SELECT Events.event_name, Participant.chest_no, Participant.pt_name, Teams.team_name, EventResults.point FROM Events INNER JOIN EventResults ON Events.event_id = EventResults.event_id INNER JOIN Teams INNER JOIN Participant ON Teams.team_id = Participant.team_id ON EventResults.pt_no = Participant.chest_no order by Events.event_name , EventResults.point DESC");
		  while(rs.next())
		  {		
		  %>
                    <tr class="mm">
                      <td height="22"><div align="center" class="style7">
                          <div align="center"><%=rs.getString(1)%></div>
                      </div></td>
                      <td height="22"><div align="center" class="style7">
                          <div align="center"><%=rs.getString(2)%></div>
                      </div></td>
                      <td height="22"><div align="center" class="mm style7">
                          <div align="center"><%=rs.getString(3)%></div>
                      </div></td>
                      <td><div align="center" class="style7"><%=rs.getString(4)%></div></td>
                      <td><div align="center" class="services"><%=rs.getString(5)%></div></td>
                    </tr>
                    <%}%>
                  </table>
                  <p align="center">
                    <input name="Button2" type="button" class="btn" value="Back" onClick='location.href="viewresult.jsp"' >
                  </p>
              <p align="justify">&nbsp;</p></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
</td>
</tr><tr><td valign="bottom">
</td></tr></tbody></table>
</body></html>