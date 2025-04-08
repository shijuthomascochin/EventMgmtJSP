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
        <table width="605" border="1">
          <tr bgcolor="#BF2B1F">
            <td height="20" colspan="6"><div align="center" class="style4">Event Registration </div></td>
          </tr>
          <tr bgcolor="#BF2B1F">
            <td width="34" height="16"><div align="center" class="style8">
              <div align="center">P ID: </div>
            </div></td>
            <td width="113"><div align="center" class="style8">
              <div align="center">Name</div>
            </div></td>
            <td width="110"><div align="center" class="style8">
              <div align="center">Team</div>
            </div></td>
            <td width="213"><div align="center" class="style8">Events</div></td>
            <td width="64">&nbsp;</td>
            <td width="58"><div align="center"><span class="style7"><span class="style8"><span class="style9"><span class="style9"><span class="style8"><span class="style8"></span></span></span></span></span></span></div></td>
          </tr>
          <%
		  String chn = request.getParameter("tm");
		  String ty = request.getParameter("ty");
		  try
		  {
			  if(ty!=null && ty.equals("delete"))
			  {
					obj.idu("delete from Register where sid="+chn+"");
			  }
			  else if(ty!=null && ty.equals("approve"))
			  {
					int stid=0;
					String strevnt="";
					rs = obj.select("select max(chest_no) as maxm from Participant");
					if(rs.next())
					{
						String str1=rs.getString(1);
						if(str1==null)
						{
							stid=1000;	
						}
						else
						{
							stid=Integer.parseInt(str1)+1;
						}
					}
					CDB obj1 = new CDB();
					rs = obj.select("SELECT * FROM [Register] WHERE sid="+chn+"");
					if(rs.next())
					{
						String nam=rs.getString(2);
						String ptnam=rs.getString(3);
						String psex=rs.getString(4);
						strevnt=rs.getString(5);
						obj1.idu("INSERT INTO Participant VALUES("+stid+",'"+ptnam+"','"+nam+"','"+psex+"')");
					}
					String event[] = strevnt.split("~");
					for(int q=0;q<event.length;q++)
					{
						rs=obj.select("SELECT * FROM [EventParticipants] WHERE chest_no="+stid+" AND event_id='"+event[q]+"'");
						if(rs.next())
						{
							
						} 
						else
						{
							obj.idu("INSERT INTO [EventParticipants] VALUES ("+stid+",'"+event[q]+"')");
						}
					}
					obj.idu("DELETE FROM [Register] WHERE sid="+chn+"");
					out.print("Successfully approved");
			  }
		  }
		  catch(Exception ex)
		  {
		  		out.print(ex);
		  }
		  rs=obj.select("SELECT Register.sid, Register.name, Teams.team_name, Register.event FROM Register INNER JOIN              Teams ON Register.team_id = Teams.team_id");
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
				String strpt[]=rs.getString(4).split("~");
				CDB obj1 = new CDB();
				for(int k=0;k<strpt.length;k++)
				{
					ResultSet rs1=obj1.select("Select event_name from Events where event_id='"+strpt[k]+"'");
					if(rs1.next())
					{
						out.print(rs1.getString(1));
						out.print("<br>");
					}
				}
			%>
			</div></td>
            <td><span class="style7">
              <input name="Button2" type="button" class="btn1" onClick="location.href='eventsregistration.jsp?tm=<%=str%>&ty=approve'" value="Approve" >
            </span></td>
            <td>
                
                      <div align="center" class="style7">
                        <input name="Button" type="button" class="btn1" onClick='var s = confirm("Are you sure?"); if(s) location.href="eventsregistration.jsp?tm=<%=str%>&ty=delete" ' value="Delete">
                    </div></td>
          </tr>
          <%}%>
        </table>		
		  <p>&nbsp;</p>
		  <p>
		    <input name="Button22" type="button" class="btn" value="Participants and Events" onClick='location.href="part_events.jsp"' >
		  </p></td>
    </tr>
  </tbody>
</table>
</td>
</tr><tr><td valign="bottom">
</td></tr></tbody></table>
</body></html>