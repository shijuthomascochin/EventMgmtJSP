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
.style7 {font-size: 10px}
.style8 {color: #C1331F; font-family: Verdana, Arial, Helvetica, sans-serif;}
-->
</style>
</head>
<script type='text/javascript'>

function formValidator()
{
	var p0 = document.getElementById('t1');
	var p1 = document.getElementById('t2');
	var p2 = document.getElementById('t3');
	if(isEmpty(p0,"Please enter old password"))
	{
		if(isEmpty(p1,"Please enter new password"))
		{
			if(isEmpty(p2,"Please retype new password"))
			{
				if(p1.value!=p2.value)
				{
					alert("Password do not match");
					p1.focus();
					return false;
				}	
				return true;
			}
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
       <form name="form1" method="post" action="changepassword.jsp" onSubmit='return formValidator()' >
          <table width="402" height="162" border="1">
            <tr bgcolor="#BF2B1F">
              <td height="27" colspan="2"><div align="center" class="style4">Change Password </div></td>
            </tr>
            <tr class="mm">
              <td width="185" height="28"><div align="center" class="style7">
                  <div align="center"><span class="style6">Old password</span></div>
              </div></td>
              <td width="201"><div align="left">
                  <input name="t1" type="password" id="t1" size="20" >
              </div></td>
            </tr>
            <tr class="mm">
              <td height="28"><div align="center"><span class="style6">New password  </span></div></td>
              <td>
                <div align="left">
                  <input name="t2" type="password" id="t2" size="20" >  
                </div>                </td>
            </tr>
            <tr class="mm">
              <td height="28"><div align="center">Retype password </div></td>
              <td><div align="left">
                <input name="t3" type="password" id="t3" size="20" >
              </div>                </td>
            </tr>
            <tr class="mm">
              <td height="28" colspan="2"><div align="center">
                  <input name="Submit" type="submit" class="btn" value="Change" >
                &nbsp;&nbsp;
                  <input name="Submit2" type="button" class="btn" value="Back" onClick='location.href="settings.jsp"'>
              </div></td>
            </tr>
          </table>
          <p>
            <label></label>
          </p>
        </form>
		 <p>
		 <%	
		String p1=request.getParameter("t1");
		String p2=request.getParameter("t2");
		String p3=request.getParameter("t3");
		int i=0;
		if(p1!=null)
		{
			try
			{
				rs = obj.select("select pass from Admin where admin='admin'");
				if(rs.next())
				{
					if(p1.equals(rs.getString(1)))
					{
						i=1;
					}
				}
				if(i==1)
				{
					obj.idu("UPDATE Admin set pass='"+p2+"' WHERE admin='admin'");
					out.println("New settings have been successfully added");
					out.println("<br><br>");
				}
				else
				{
					out.println("Invalid old password");
				}
			}
			catch (Exception ex)
			{
				out.println(ex);
			}
		}
%>		 <p>&nbsp;</p></td>
    </tr>
  </tbody>
</table>
</td>
</tr><tr><td valign="bottom">
</td></tr></tbody></table>
</body></html>