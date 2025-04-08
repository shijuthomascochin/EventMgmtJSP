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
	var a = document.getElementById('t1');
	var b = document.getElementById('t2');
	if(isEmpty(a,"Please enter team name"))
	{
		if(isNumeric(b,"Please enter college name"))
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
	String usr=(String)session.getAttribute("arts");
	if(usr == null)
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
        <p align="left" class="title">&nbsp;</p>
        <form name="form1" method="post" action="addnewteam.jsp" onSubmit='return formValidator()' >
          <table width="360" height="128" border="1">
            <tr bgcolor="#BF2B1F">
              <td height="28" colspan="2"><div align="center" class="style4">Add new Team</div></td>
            </tr>
            <tr class="mm">
              <td width="106">Team name </td>
              <td width="248"><input name="t1" type="text" id="t1" size="30"></td>
            </tr>
            <tr class="mm">
              <td>College name </td>
              <td><input name="t2" type="text" id="t2" size="30"></td>
            </tr>
            <tr class="mm">
              <td height="29" colspan="2"><div align="center">
                <input name="Submit" type="submit" class="btn" value="Add">&nbsp;&nbsp;
                <input name="Submit2" type="reset" class="btn" value="Reset">
              </div></td>
            </tr>
          </table>
                </form>
        <p class="smalltitle">
		 <%	
		String t=request.getParameter("t1");
		String c=request.getParameter("t2");
		String tid="";
		if(t!=null)
		{
        	try
        	{
                	rs = obj.select("SELECT 'Team'+CONVERT(varchar, ISNULL(MAX(CONVERT(int, SUBSTRING(team_id, 5, LEN(team_id))) + 1), 1)) AS Head FROM Teams WHERE (SUBSTRING(team_id, 1, 4) = 'Team')");
                	if(rs.next())
                	{
						tid=rs.getString(1);
               		}
					obj.idu("INSERT INTO Teams VALUES('"+tid+"','"+t+"','"+c+"')");
					obj.idu("INSERT INTO [MainResult] VALUES('"+tid+"',0)");
					out.println("New team has been successfully added");
					out.println("<br><br>");
					out.println("Team id: "+tid);
        	}
        	catch (Exception ex)
        	{
           		out.println(ex);
        	}
		}
%>
		    </p>
        <p>
          <input name="Button2" type="button" class="btn" value="View teams" onClick='location.href="teams1.jsp"' >
        </p></td>
    </tr>
  </tbody>
</table>
</td>
</tr><tr><td valign="bottom">
</td></tr></tbody></table>
</body></html>
