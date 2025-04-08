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
      <td align="center" valign="top"><table border="0" cellpadding="0" cellspacing="15" width="500">
        <tbody>
          <tr>
            <td align="left" valign="top"><p><br>
                      <span class="title"> Welcome to  
					  <%
					  		rs = obj.select("SELECT [subhead] FROM [SiteSettings]");
							if(rs.next())
							{
								out.print(rs.getString(1));
							}
					  %></span><br>
            </p>
                  <p><img src="Files/main.jpg" height="212" width="490"></p>
              <p align="justify" class="smalltitle"><u>Contact us 			  </u></p>
              <p align="justify">
                <%
			  		rs=obj.select("SELECT [contact] FROM [SiteSettings]");
					if(rs.next())
					{
						out.print(rs.getString(1));
					}
			  %>
              </p></td>
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