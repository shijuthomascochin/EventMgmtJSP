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
.style8 {font-size: 12px}
-->
</style>
</head>

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
		<table width="413" height="76" border="1">
          <tr bgcolor="#BF2B1F">
            <td height="27" colspan="4"><div align="center" class="style4">Arts Festival main results </div></td>
          </tr>
          <tr bgcolor="#BF2B1F"> 
		  <td width="35" height="16"><div align="center"><span class="style6">&nbsp;</span></div></td>
		              <td width="147" height="16"><div align="center"><span class="style6">Team</span></div></td>
            <td width="151"><div align="center"><span class="style6">College</span></div></td>
            <td width="52"><div align="center"><span class="style6">Point</span></div></td>
            </tr>
          <%
		   int i=0;
		  rs=obj.select("SELECT MainResult.team_id, Teams.team_college_name, MainResult.point FROM MainResult INNER JOIN Teams ON MainResult.team_id = Teams.team_id ORDER BY MainResult.point DESC");
		  while(rs.next())
		  {		i++;
		  %>
          <tr class="mm">
		  	<td height="22"><div align="center" class="style7"><%=i%></div></td>
            <td height="22"><div align="center" class="style7"><%=rs.getString(1)%></div></td>
            <td height="22"><div align="center" class="style7"><%=rs.getString(2)%></div></td>
            <td height="22"><div align="center" class="services"><%=rs.getString(3)%></div></td>
            </tr>
          <%}%>
        </table>		
		  
		  <p>
		   
		    <input name="Submit" type="button" class="btn" value="Event results" onClick='document.location.href="eventresults1.jsp"'  >
		    &nbsp;&nbsp;&nbsp;
		    <input name="Submit2" type="button" class="btn" value="Add event results" onClick='document.location.href="addresult.jsp"'  >
		  </p>
		  <br><br>
		  <table width="413" height="52" border="1">
            <tr bgcolor="#BF2B1F">
              <td height="20" colspan="4" class="smalltitle"> <div align="left" class="style8">
                <div align="center">Kalathilakam</div>
             </td>
			 <%
				String cout="";
				int ii=0;
				rs=obj.select("SELECT  top 1  SUM(EventResults.point)as aa FROM EventResults INNER JOIN                    Participant ON EventResults.pt_no = Participant.chest_no WHERE (Participant.pt_sex = 'Female') GROUP BY EventResults.pt_no order by aa desc");
				if(rs.next())
				{	
					cout=rs.getString(1);
				}
				rs=obj.select("SELECT  SUM(EventResults.point)as aa FROM EventResults INNER JOIN Participant ON EventResults.pt_no = Participant.chest_no WHERE (Participant.pt_sex = 'Female') GROUP BY EventResults.pt_no order by aa desc");
				while(rs.next())
				{
					if(cout.equals(rs.getString(1)))
						 ii++;
				}
		  		rs = obj.select("SELECT TOP "+ii+" Participant.chest_no, Participant_1.pt_name, Teams.team_name, SUM(EventResults.point) AS maxpoint FROM Participant INNER JOIN EventResults ON Participant.chest_no = EventResults.pt_no INNER JOIN Participant AS Participant_1 ON Participant.chest_no = Participant_1.chest_no INNER JOIN Teams ON Participant.team_id = Teams.team_id WHERE (Participant.pt_sex = 'Female') GROUP BY Participant.chest_no, Participant_1.pt_name, Teams.team_name ORDER BY maxpoint DESC");
		while(rs.next())
		{
		  %>
              </tr>
            <tr bgcolor="#D12428">
              <td width="60" height="22" class="services">
                <div align="left"><%=rs.getString(1)%></div>
              </td>
              <td width="202" class="services">
                <div align="left"><%=rs.getString(2)%></div>
             </td>
			  <td width="202" class="services">
                <div align="left"><%=rs.getString(3)%></div>
             </td>
			 <td width="28" height="22" class="services">
                <div align="center"><%=rs.getString(4)%></div></td>
              </tr>
			  <%}%>
          </table>		
		   <br><br>
		   <table width="413" height="52" border="1">
            <tr bgcolor="#BF2B1F">
              <td height="20" colspan="4" class="smalltitle"> 
                <div align="center">Kalaprathibha</div>
             </td>
			 <%
			 	cout="";
				ii=0;
			 	rs=obj.select("SELECT  top 1  SUM(EventResults.point)as aa FROM EventResults INNER JOIN                    Participant ON EventResults.pt_no = Participant.chest_no WHERE (Participant.pt_sex = 'Male') GROUP BY EventResults.pt_no order by aa desc");
				if(rs.next())
				{	
					cout=rs.getString(1);
				}
				rs=obj.select("SELECT  SUM(EventResults.point)as aa FROM EventResults INNER JOIN Participant ON EventResults.pt_no = Participant.chest_no WHERE (Participant.pt_sex = 'Male') GROUP BY EventResults.pt_no order by aa desc");
				while(rs.next())
				{
					if(cout.equals(rs.getString(1)))
						 ii++;
				}
				rs = obj.select("SELECT TOP "+ii+" Participant.chest_no, Participant_1.pt_name, Teams.team_name, SUM(EventResults.point) AS maxpoint FROM Participant INNER JOIN EventResults ON Participant.chest_no = EventResults.pt_no INNER JOIN Participant AS Participant_1 ON Participant.chest_no = Participant_1.chest_no INNER JOIN Teams ON Participant.team_id = Teams.team_id WHERE (Participant.pt_sex = 'Male') GROUP BY Participant.chest_no, Participant_1.pt_name, Teams.team_name ORDER BY maxpoint DESC");
		while(rs.next())
		{
		  %>
              </tr>
            <tr bgcolor="#D12428">
              <td width="60" height="22" class="services">
                <div align="left"><%=rs.getString(1)%></div>
              </td>
              <td width="202" class="services">
                <div align="left"><%=rs.getString(2)%></div>
             </td>
			  <td width="202" class="services">
                <div align="left"><%=rs.getString(3)%></div>
             </td>
			 <td width="28" height="22" class="services">
                <div align="center"><%=rs.getString(4)%></div></td>
              </tr>
			  	  <%}%>
          </table>		  
		  </td>
    </tr>
  </tbody>
</table>
</td>
</tr><tr><td valign="bottom">
</td></tr></tbody></table>
</body></html>