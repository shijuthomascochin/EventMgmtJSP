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
	var p1 = document.getElementById('t2');
	var p2 = document.getElementById('t3');
	var p3 = document.getElementById('t4');
	var ppl = document.getElementById('t5');
	var d = document.getElementById('d1');
	if(isEmpty(nam,"Please enter event name"))
	{
		if(isNumeric(p1,"Please enter a valid point"))
		{
			if(isNumeric(p2,"Please enter a valid point"))
			{
				if(isNumeric(p3,"Please enter a valid point"))
				{
					if(isNumeric(ppl,"Please enter a valid number"))
					{
						if(d.value=="Single" && ppl.value!=1)
						{
							alert("No ppl should be 1");
							return false;
						}
						return true;
					}
				}
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
function isNumeric(elem, helperMsg){
	var numericExpression = /^[0-9]+$/;
	if(elem.value.match(numericExpression)){
		return true;
	}else{
		alert(helperMsg);
		elem.focus();
		return false;
	}
}

function f()
{
	var d = document.getElementById('d1');
	var ppl = document.getElementById('t5');
	if(d.value=="Single")
	{
		ppl.value=1;
	}
	else
	{
		ppl.value="";
	}
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
		<%
			String evt = request.getParameter("evt");
			rs = obj.select("SELECT [event_name],[event_point1],[event_point2],[event_point3],[max_ppl] FROM [Event].[dbo].[Events]");
			if(rs.next())
			{
		%>
        <form name="form1" method="post" action="edit_events.jsp" onSubmit='return formValidator()' >
          <table width="310" height="303" border="1">
            <tr bgcolor="#BF2B1F">
              <td height="27" colspan="2"><div align="center" class="style4">Edit new events</div></td>
            </tr>
            <tr class="mm">
              <td height="28"><div align="center"><span class="style6">Event ID </span></div></td>
              <td>
                <div align="left">
                  <input name="t10" type="text" id="t10" size="20"  readonly="true" value="<%=evt%>">
                  </div></td>
            </tr>
            <tr class="mm">
              <td width="142" height="28"><div align="center" class="style7">
                  <div align="center"><span class="style6">Event Name </span></div>
              </div></td>
              <td width="252"><div align="left">
                  <input name="t1" type="text" id="t1" size="20"  value="<%=rs.getString(1)%>" >
              </div></td>
            </tr>
            <tr class="mm">
              <td height="28"><div align="center"><span class="style6">Type </span></div></td>
              <td>
                <div align="left">
                    <select name="d1" id="d1" onChange="f();" >
                      <option>Group</option>
                      <option>Single</option>
                    </select>
                  </div>
				</td>
            </tr>
            <tr class="mm">
              <td height="28"><div align="center"><span class="style6">Category </span></div></td>
              <td><div align="left">
                    <select name="d2" id="d2" >
                      <option>Dance</option>
                      <option>Fine Arts</option>
                      <option>Music</option>
                      <option>Literature</option>
                      <option>Theatre</option>
                    </select>
                  </div>                </td>
            </tr>
            <tr class="mm">
              <td height="28"><div align="center"><span class="style6">Point 1 </span></div></td>
              <td><div align="left">
                  <input name="t2" type="text" id="t2" size="4" value="<%=rs.getString(2)%>" >
              </div></td>
            </tr>
            <tr class="mm">
              <td height="28"><div align="center"><span class="style6">Point 2 </span></div></td>
              <td><div align="left">
                  <input name="t3" type="text" id="t3" size="4" value="<%=rs.getString(3)%>" >
              </div></td>
            </tr>
            <tr class="mm">
              <td height="28"><div align="center"><span class="style6">Point 3 </span></div></td>
              <td><div align="left">
                  <input name="t4" type="text" id="t4" size="4" value="<%=rs.getString(4)%>" >
              </div></td>
            </tr>
            <tr class="mm">
              <td height="28"><div align="center"><span class="style6">Max ppl </span></div></td>
              <td><div align="left">
                  <input name="t5" type="text" id="t5" size="4" value="<%=rs.getString(5)%>" >
              </div></td>
            </tr>
            <tr class="mm">
              <td height="28" colspan="2"><div align="center">
                  <input name="Submit" type="submit" class="btn" value="Update" >
                &nbsp;&nbsp;
                  <input name="Submit2" type="reset" class="btn" value="Reset" >
              </div></td>
            </tr>
          </table>
          <p>
            <label></label>
          </p>
        </form>
		<%}%>
		 <p>
		 <%	
			String evnt=request.getParameter("t1");
			String ty=request.getParameter("d1");
			String cat=request.getParameter("d2");
			String p1=request.getParameter("t2");
			String p2=request.getParameter("t3");
			String p3=request.getParameter("t4");
			String ppl=request.getParameter("t5");
			String evntid=request.getParameter("t10");
			if(evntid!=null)
			{
				try
				{
					obj.idu("UPDATE [Events] SET [event_name] = '"+evnt+"',[event_type] = '"+ty+"',[event_cat] = '"+cat+"', [event_point1] = "+p1+",[event_point2] = "+p2+",[event_point3] = "+p3+",[max_ppl] = "+ppl+" WHERE [event_id]='"+evntid+"'");
					out.println("Event has been successfully updated");
					out.println("<br><br>");
					out.println("Event id: "+evntid);
				}
				catch (Exception ex)
				{
					out.println(ex);
				}
			}
%>
</p>
		 <p>
		   <input name="Submit3" type="button" class="btn" value="View events" onClick='location.href="events_rules.jsp"'>
		 </p></td>
    </tr>
  </tbody>
</table>
</td>
</tr><tr><td valign="bottom">
</td></tr></tbody></table>
</body></html>