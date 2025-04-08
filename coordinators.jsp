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
	font-size: 10px;
	color: #990000;
}
.style4 {font-size: 13px}
.style5 {	font-size: 36px;
	color: #990000;
}
.style6 {font-size: 11px}
-->
</style>
</head>
<script type='text/javascript'>

function formValidator()
{
	var nam = document.getElementById('t1');
	var pw = document.getElementById('t2');
	if(isEmpty(nam,"Please enter user id"))
	{
		if(isEmpty(pw,"Please enter password"))
		{
			return true;
		}
	}
	return false;
}

function isEmpty(elem, helperMsg)
{
	if(elem.value.length == 0)
	{
		alert(helperMsg);
		elem.focus(); 
		return false;
	}
	return true;
}

</script>


<%
	String usr1=(String)session.getAttribute("admin");
	if(usr1 == null)
	{
	%>
		<jsp:forward page="index.jsp" />
	<%}
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
  <td align="left"><div align="center" class="style1"><span class="style5">Arts Festival </span></div></td>
</tr></tbody></table>

<table border="0" cellpadding="0" cellspacing="0" width="90%">
  <tbody>
    <tr>
      <td class="printhide" align="left" valign="top" width="160"><p>&nbsp;</p>
        <table  cellpadding="0" cellspacing="0" width="154">
          <tbody>
            <tr>
              <td onClick="location.href='adminpage.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Home<br></td>
            </tr>
            <tr>
              <td onClick="location.href='coordinators.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Co-ordinators</td>
            </tr>
            <tr>
              <td onClick="location.href='teams.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Teams<br></td>
            </tr>
            <tr>
              <td onClick="location.href='events_rules.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Events &amp; Rules <br></td>
            </tr>
            <tr>
              <td onClick="location.href='artsrules.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Rules<br></td>
            </tr>
            <tr>
              <td onClick="location.href='artsschedule.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Schedule<br></td>
            </tr>
            <tr>
              <td onClick="location.href='participats.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Participants<br></td>
            </tr>
            <tr>
              <td onClick="location.href='results.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Result<br></td>
            </tr>
			 <tr>
              <td onClick="location.href='sponsors.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Sponsors<br></td>
            </tr>
            <tr>
              <td onClick="location.href='settings.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Settings<br></td>
            </tr>
            <tr>
              <td onClick="location.href='adminlogout.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Logout<br></td>
            </tr>
            <tr>
              <td class="menu">&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
      <td class="printhide" align="center" valign="top"><br>      </td>
      <td align="center" valign="top" class="subtitle"><p class="title">&nbsp;</p>
        <p align="left" class="title">Welcome Administrator!</p>
        <form name="form1" method="post" action="coordinators.jsp" onSubmit='return formValidator()' >
          <table width="330" height="111" border="1" bgcolor="#BE2C1D">
            <tr>
              <td height="21" colspan="2"><div align="center" class="smalltitle style4">Add new co-ordinator</div></td>
            </tr>
            <tr>
              <td width="134" height="20">User name </td>
              <td width="220" height="20"><label>
                <input name="t1" type="text" id="t1">
              </label></td>
            </tr>
            <tr>
              <td height="20">Password</td>
              <td height="20"><input name="t2" type="password" id="t2"></td>
            </tr>
            <tr>
              <td height="26" colspan="2">
                <div align="center">
                    <input name="Submit" type="submit" class="btn" value="Submit">
                </div>                </td>
            </tr>
          </table>
          <%	
		String unam=request.getParameter("t1");
		String pw=request.getParameter("t2");
		if(unam!=null)
		{
        	try
        	{
           		if (unam.equals("admin"))
          	 	{
					out.println("Invalid user");
				}
				else
				{
                	rs = obj.select("select admin from Admin where admin= '" + unam + "'");
                	if(rs.next())
                	{
						out.println("User id already exists");
                	}
					else
					{
						obj.idu("insert into Admin values('"+unam+"','"+pw+"')");
						out.println("Co-ordinator has been successfully added");
					}
            	}
        	}
        	catch (Exception ex)
        	{
           		out.println(ex);
        	}
		}
%>
		</form>
		<table width="330" border="1">
          <tr bgcolor="#BF2B1F">
            <td height="20" colspan="3"><div align="center" class="style4">Co-ordinators</div></td>
          </tr>
          <tr bgcolor="#BF2B1F">
            <td width="117" height="16"><div align="center" class="style6">Coordinator</div></td>
            <td width="126"><div align="center" class="style6">Password</div></td>
            <td width="51"><span class="style6"></span></td>
          </tr>
          <%
		  String ty = request.getParameter("ty");
		  String usr = request.getParameter("usr");
		  if(ty!=null)
		  {
		  		obj.idu("delete from Admin where admin='"+usr+"'");
		  }
		  rs=obj.select("select * from Admin");
		  while(rs.next())
		  {
		  		String str = rs.getString(1);
				if(str.equals("admin")) continue;
		  %>
          <tr class="mm">
            <td><div align="center"><%=str%></div></td>
            <td><div align="center"><%=rs.getString(2)%></div></td>
            <td><div align="center">
                <input name="Button" type="button" class="btn1" onClick='var s = confirm("Are you sure?"); if(s) location.href="coordinators.jsp?ty=delete&usr=<%=str%>" ' value="Delete">
            </div></td>
          </tr>
          <%}%>
        </table>		
		  <p>&nbsp;</p>
		  <p>
		    <input name="Button2" type="button" class="btn" value="Home" onClick='location.href="adminpage.jsp"' >
		    </p></td>
    </tr>
  </tbody>
</table>
</td>
</tr><tr><td valign="bottom">
</td></tr></tbody></table>
</body></html>