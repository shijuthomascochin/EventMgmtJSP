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
	var a = document.getElementById('d1');
	var b = document.getElementById('d2');
	if(isEmpty(a,"Value missing"))
	{
		if(isEmpty(b,"Value missing"))
		{
			return true;	
		}
	}
	return false;
}

function isEmpty(elem, helperMsg)
{
	if(elem.value == "")
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
        <form name="form1" method="post" action="editeventresult.jsp" onSubmit='return formValidator()' >
          <table width="347" height="160" border="1">
            <tr bgcolor="#BF2B1F">
              <td height="28" colspan="2"><div align="center" class="style4">Add event result </div></td>
            </tr>
            <tr class="mm">
              <td width="155"><div align="center">Event </div></td>
              <td width="176">
			  <%
			  	String evnt="";
				String pt="";
				String pnt="";
			  	String btn = request.getParameter("btn");
				if(btn==null)
				{
					evnt=request.getParameter("evnt");
					pt=request.getParameter("pt");
					pnt=request.getParameter("pnt");
				}
			%>
			  <input type="text" value="<%=evnt%>" name="d1" readonly="true">
			
           </td>
            </tr>
            <tr class="mm">
              <td><div align="center">Participant</div></td>
              <td> 
				  <input type="text" value="<%=pt%>" name="d2" readonly="true">
		
			 </td>
            </tr>
            <tr class="mm">
              <td height="26"><p align="center">Point</p>                </td>
              <td><select name="d3" id="d3">
			 <%
			 	if(evnt!=null)
				{
				rs = obj.select("SELECT [event_point1],[event_point2],[event_point3] FROM [Events] WHERE [event_id]='"+evnt+"'");
					if(rs.next())
					{
						
					%>
						<option ><%=rs.getString(1)%></option>
						<option ><%=rs.getString(2)%></option>
						<option ><%=rs.getString(3)%></option>
						
					<%}
				}
			%>
                      </select></td>
            </tr>
            <tr class="mm">
              <td height="37" colspan="2"><div align="center">
                <input name="btn" type="submit" class="btn" id="btn" value="Enter">
              </div></td>
            </tr>
          </table>
                </form>
        <p class="smalltitle">
<%	
	if(btn!=null)
	{
		String evnt1=request.getParameter("d1");
		String pt1=request.getParameter("d2");
		String pnt1=request.getParameter("d3");
		try
		{	
			rs = obj.select("SELECT [event_id],[pt_no] FROM [EventResults] WHERE [event_id]='"+evnt1+"' AND [pt_no]="+pt1+" AND [point]='"+pnt1+"'");
            if(rs.next())
			{
				out.println("Result has already been entered for this event for this participant");
				out.println("<br><br>");
				out.println("Event id: "+evnt1);
				out.println("<br>");
				out.println("Participant id: "+pt1);
			}
			else
			{
				String tid="",totpoint="";
				rs=obj.select("select team_id from Participant where chest_no="+pt1+"");
				if(rs.next())
				{
					tid=rs.getString(1);
				}
				obj.idu("UPDATE [EventResults] SET [point]="+pnt1+",[pt_no]="+pt1+" WHERE event_id='"+evnt1+"'");
				obj.idu("DELETE MainResult where team_id='"+tid+"'");
				rs=obj.select("SELECT SUM(EventResults.point) AS TotPoint FROM EventResults INNER JOIN Participant ON EventResults.pt_no = Participant.chest_no WHERE (Participant.team_id = '"+tid+"')");
				if(rs.next())
				{
					totpoint = rs.getString(1);
				}	
				obj.idu("INSERT INTO MainResult Values('"+tid+"',"+totpoint+")");
				out.println("Result has been successfully updated");
				out.println("<br><br>");
				out.println("Event id: "+evnt1);
				out.println("<br>");
				out.println("Participant id: "+pt1);
			}
			
		}
		catch (Exception ex)
		{
			out.println("Error in updating result");
		}
	}
%>
		    </p>
        <p>
          <input name="Button2" type="button" class="btn" value="View event results" onClick='location.href="eventresults1.jsp"' >
          &nbsp;&nbsp;<input name="Button22" type="button" class="btn" value="View main results" onClick='location.href="results1.jsp"' >
        </p></td>
    </tr>
  </tbody>
</table>
</td>
</tr><tr><td valign="bottom">
</td></tr></tbody></table>
</body></html>

