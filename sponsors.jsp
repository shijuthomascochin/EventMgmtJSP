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
.style9 {font-size: 12px}
.style10 {
	color: #FFFF00;
	font-weight: bold;
}
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
		<table width="661" border="1">
          <tr bgcolor="#BF2B1F">
            <td height="27" colspan="6"><div align="center" class="style4">Sponsors Details </div></td>
          </tr>
          <tr bgcolor="#BF2B1F">
            <td width="81" height="16"><div align="center"><span class="style6">Sponsor ID </span></div></td>
            <td width="149"><div align="center"><span class="style6">Sponsor Name </span></div></td>
            <td width="77"><div align="center"><span class="style6">Amount</span></div></td>
            <td width="214"><div align="center"><span class="style6">Description </span></div></td>
            <td width="57">&nbsp;</td>
			<td width="43">&nbsp;</td>
          </tr>
          <%
		 
		  String sp = request.getParameter("sp");
		  if(sp!=null)
		  {
		  		obj.idu("delete from Sponsors where sp_id='"+sp+"'");
		  }
		  rs=obj.select("SELECT [sp_id],[sp_name],[amount],[description] FROM [Sponsors]");
		  while(rs.next())
		  {
		  		String str = rs.getString(1);
		
		  %>
          <tr class="mm">
            <td height="24"><div align="center" class="style7"><%=str%></div></td>
            <td><div align="center" class="style7"><%=rs.getString(2)%></div></td>
            <td><div align="center" class="style7"><%=rs.getString(3)%></div></td>
            <td><div align="center" class="style7"><%=rs.getString(4)%></div></td>
            <td><div align="center" class="style7">
        <input name="Button" type="button" class="btn1" onClick='var s = confirm("Are you sure?"); if(s) location.href="sponsors.jsp?sp=<%=str%>" ' value="Delete"> 
            </div></td>
			<td><div align="center" class="style7">
		<input name="Button" type="button" class="btn1" onClick="location.href='edit_sponsor.jsp?sp=<%=str%>' " value="Edit">
			 </div></td>
          </tr>
          <%}%>
        </table>		
		  <p align="center" class="style9">Total Amount: <span class="style10">
		  <%
		  	rs = obj.select("SELECT sum(amount) from Sponsors");
			if(rs.next())
			{
				out.print(rs.getString(1));
			}
		  %>/-</span></p>
		  <p>
		    <label>
		      <input name="Submit" type="button" class="btn" value="Add new sponsor" onClick='document.location.href="addsponsor.jsp"' >
		      </label>
		    </p></td>
    </tr>
  </tbody>
</table>
</td>
</tr><tr><td valign="bottom">
</td></tr></tbody></table>
</body></html>>
