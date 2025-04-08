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
.style7 {font-size: 10px; }
.style8 {font-size: 11px; }
.style9 {font-size: 12px; }
.style10 {color: #C1331F; font-family: Verdana, Arial, Helvetica, sans-serif;}
-->
</style>
</head>
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
        <table width="515" border="1">
          <tr bgcolor="#BF2B1F">
            <td height="20" colspan="4"><div align="center" class="style4">Participants and events </div></td>
          </tr>
          <tr bgcolor="#BF2B1F">
            <td width="74" height="16"><div align="center" class="style8">
              <div align="center">Chest No: </div>
            </div></td>
            <td width="140"><div align="center" class="style8">
              <div align="center">Name</div>
            </div></td>
            <td width="140"><div align="center" class="style8">
              <div align="center">Team</div>
            </div></td>
            <td width="133"><div align="center" class="style8">Events</div></td>
            </tr>
          <%
		  String chn = request.getParameter("tm");
		  if(chn!=null)
		  {
		  		obj.idu("delete from Participant where chest_no="+chn+"");
		  }
		  rs=obj.select("SELECT DISTINCT EventParticipants.chest_no, Participant.pt_name, Teams.team_name FROM         EventParticipants INNER JOIN Participant ON EventParticipants.chest_no = Participant.chest_no INNER JOIN Events ON EventParticipants.event_id = Events.event_id INNER JOIN Teams ON Participant.team_id = Teams.team_id");
		  while(rs.next())
		  {
		  		String str = rs.getString(1);
		  %>
          <tr class="mm">
            <td height="24"><div align="center" class="style7"><%=str%></div></td>
            <td><div align="center" class="style7"><%=rs.getString(2)%></div></td>
            <td><div align="center" class="style7"><%=rs.getString(3)%></div></td>
            <td><div align="left" class="ssss">
			<%
				CDB obj1 = new CDB();
				ResultSet rs1 = obj1.select("SELECT DISTINCT Events.event_name FROM EventParticipants INNER JOIN Events ON EventParticipants.event_id = Events.event_id WHERE(EventParticipants.chest_no = "+str+")");
				while(rs1.next())
				{
					out.print(rs1.getString(1));
					out.print("<br>");
				}
				%>
			</div></td>
            </tr>
          <%}%>
        </table>		
		  <p>&nbsp;</p>
		  <p>
		    <input name="Button2" type="button" class="btn" value="Event Reagistration" onClick='location.href="eventsregistration.jsp"' >
		    &nbsp;&nbsp;
		    <input name="Button22" type="button" class="btn" value="Participants" onClick='location.href="participats1.jsp"' >
		  </p></td>
    </tr>
  </tbody>
</table>
</td>
</tr><tr><td valign="bottom">
</td></tr></tbody></table>
</body></html>