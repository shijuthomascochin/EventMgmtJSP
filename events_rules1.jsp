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
	String usr1=(String)session.getAttribute("arts");
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
            <td onClick="location.href='artsadminpage.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Home<br></td>
          </tr>
          <tr>
            <td onClick="location.href='teams1.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Teams<br></td>
          </tr>
          <tr>
            <td onClick="location.href='events_rules1.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Events &amp; Rules <br></td>
          </tr>
          <tr>
            <td onClick="location.href='artsrules1.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Rules<br></td>
          </tr>
          <tr>
            <td onClick="location.href='artsschedule1.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Schedule<br></td>
          </tr>
		   <tr>
            <td onClick="location.href='participats1.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Participants<br></td>
          </tr>
		   <tr>
            <td onClick="location.href='results1.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Result<br></td>
            </tr>
		   <tr>
            <td onClick="location.href='artsadminlogout.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Logout<br></td>
          </tr>
		   
          <tr>
            <td class="menu">&nbsp;</td>
          </tr>
        </tbody>
      </table></td>
      <td class="printhide" align="center" valign="top"><br>      </td>
      <td align="center" valign="top" class="subtitle"><p class="title">&nbsp;</p>
        <p align="left" class="title">Welcome Arts Co-ordinator!</p>
		<table width="700" height="76" border="1">
          <tr bgcolor="#BF2B1F">
            <td height="27" colspan="8"><div align="center" class="style4">Events Details </div></td>
          </tr>
          <tr bgcolor="#BF2B1F">
            <td width="78" height="16"><div align="center"><span class="style6">Event ID </span></div></td>
            <td width="113"><div align="center"><span class="style6">Event Name </span></div></td>
            <td width="58"><div align="center"><span class="style6">Type </span></div></td>
            <td width="89"><div align="center"><span class="style6">Category </span></div></td>
            <td width="78"><div align="center"><span class="style6">Point 1 </span></div></td>
            <td width="78"><div align="center"><span class="style6">Point 2 </span></div></td>
            <td width="81"><div align="center"><span class="style6">Point 3 </span></div></td>
            <td width="73"><div align="center"><span class="style6">Max ppl </span></div></td>
            </tr>
          <%
		  rs=obj.select("select * from Events");
		  while(rs.next())
		  {
		  		String str = rs.getString(1);
		  %>
          <tr class="mm">
            <td height="22"><div align="center" class="style7"><%=str%></div></td>
            <td height="22"><div align="center" class="style7"><%=rs.getString(2)%></div></td>
            <td height="22"><div align="center" class="style7"><%=rs.getString(3)%></div></td>
            <td height="22"><div align="center" class="style7"><%=rs.getString(4)%></div></td>
            <td height="22"><div align="center" class="style7"><%=rs.getString(5)%></div></td>
            <td height="22"><div align="center" class="style7"><%=rs.getString(6)%></div></td>
            <td height="22"><div align="center" class="style7"><%=rs.getString(7)%></div></td>
            <td height="22"><div align="center" class="style7"><%=rs.getString(8)%></div></td>
            </tr>
          <%}%>
        </table>		
		  <p>
		    <label></label>
		    <input name="Submit3" type="button" class="btn" value="Event rules" onClick='location.href="evnt_rules1.jsp"' >
		  </p>
		  </td>
    </tr>
  </tbody>
</table>
</td>
</tr><tr><td valign="bottom">
</td></tr></tbody></table>
</body></html>