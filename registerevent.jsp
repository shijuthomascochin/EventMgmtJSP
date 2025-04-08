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
	font-size: 36px;
	color: #990000;
}
.style2 {font-size: 14px}
.style4 {font-size: 13px}
.style12 {color: #FFFF00}
-->
</style>
</head>
<%
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

<script language="javascript">
function formValidator(){
	var name = document.getElementById('tt');
	var evnt = document.getElementById('c1');
	var tot = document.getElementById('tt2');
	var j=0;
	for(var i=0; i <reg.length; i++)
	{
		if(reg.elements[i].type == 'checkbox' && reg.elements[i].checked)
		{
			j++;
		}
	}	

	if(isAlphabet(name, "Please enter only letters for your name"))
	{
		if(isOk(j,tot.value))
		{
			return true;
		}
	}
	
	return false;
}

function isAlphabet(elem, helperMsg)
{
	var alphaExp = /^[a-z A-Z]+$/;
	if(elem.value.match(alphaExp))
	{
		return true;
	}
	else
	{
		alert(helperMsg);
		elem.focus();
		return false;
	}
}


function isOk(a,b)
{
	if(a==0)
	{
		alert("Please select an evnets");
		return false;
	}
	if(a>b)
	{
		alert("You cannot register for more than "+b+" evnets");
		return false;
	}
	else
	{
		return true;
	}
	
}
</script>

<body leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0" background="Files/background.jpg" bgcolor="#d12428" marginheight="0" marginwidth="0" text="#ffffff"><div class="divstyle" id="info" style="display: none; ">
<div id="imagetitle" class="pstyletitle" align="center"></div></div>
<table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%"><tbody><tr><td align="left" valign="top">
<table bgcolor="#d12428" border="0" cellpadding="0" cellspacing="0" width="100%"><tbody><tr>
  <td align="left"><div align="center" class="style1">
  <%
  		rs=obj.select("SELECT [head] FROM [SiteSettings]");
		if(rs.next())
		{
			out.print(rs.getString(1));
		}
  %>
   </div></td>
</tr></tbody></table>

<table border="0" cellpadding="0" cellspacing="0" width="90%">
  <tbody>
    <tr>
      <td class="printhide" align="left" valign="top" width="160"><p>&nbsp;</p>
      <table  cellpadding="0" cellspacing="0" width="154">
        <tbody>
          <tr>
            <td onClick="location.href='index.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Home<br></td>
          </tr>
          <tr>
            <td onClick="location.href='registerevent.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Register<br></td>
          </tr>
          <tr>
            <td onClick="location.href='viewevent.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Events &amp; Rules <br></td>
          </tr>
          <tr>
            <td onClick="location.href='viewparticipants.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Participants<br></td>
          </tr>
          <tr>
            <td onClick="location.href='viewschedule.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Schedule<br></td>
          </tr>
          <tr>
            <td onClick="location.href='viewresult.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Results<br></td>
          </tr>
          <tr>
            <td onClick="location.href='contact.jsp';" onMouseOver="this.className='menuon'" onMouseOut="this.className='menu'" class="menu">Contact Us <br></td>
          </tr>
          <tr>
            <td class="menu">&nbsp;</td>
          </tr>
        </tbody>
      </table>
          <form name="form1" method="post" action="index.jsp" >
            <table width="143" bgcolor="#BD291D">
              <tr bordercolor="#D12428">
                <td colspan="2" bgcolor="#990000"><div align="center"><span class="style2">Login</span></div></td>
              </tr>
              <tr bordercolor="#D12428">
                <td>User ID
                  <label></label></td>
                <td><input name="t1" type="text" id="t1" size="10"></td>
              </tr>
              <tr bordercolor="#D12428">
                <td>Password
                  <label></label></td>
                <td><input name="t2" type="password" id="t2" size="10"></td>
              </tr>
              <tr bordercolor="#D12428">
                <td colspan="2"><div align="center">
                    <input name="Submit" type="submit" class="btn" value="Enter">
                </div></td>
              </tr>
            </table>
            <div align="center">
            </div>
          </form>
          </td>
      <td class="printhide" align="center" valign="top"><br>      </td>
      <td align="center" valign="top"><table border="0" cellpadding="0" cellspacing="15" width="726">
        <tbody>
          <tr>
            <td align="left" valign="top" class="smalltitle"><p><br>
                      <span class="title"> Welcome to  
					  <%
					  		rs = obj.select("SELECT [subhead] FROM [SiteSettings]");
							if(rs.next())
							{
								out.print(rs.getString(1));
							}
					  %></span><br>
            </p>
              <p>&nbsp;</p>
              <form name="reg" method="get" action="registerevent.jsp" onSubmit="return formValidator()" >
                    <table width="348" height="191" border="1" align="center">
                      <tr bgcolor="#BF2B1F">
                        <td height="27" colspan="2"><div align="center" class="style4">Register for Arts </div></td>
                      </tr>
                      <%
		 int i=0;
		  rs=obj.select("SELECT MainResult.team_id, Teams.team_college_name, MainResult.point FROM MainResult INNER JOIN Teams ON MainResult.team_id = Teams.team_id ORDER BY MainResult.point DESC");
		  while(rs.next())
		  {		i++;
		  %>
                      <tr class="mm">
                        <td width="100" height="22" class="smalltitle">Name</td>
                        <td width="232" height="22" class="smalltitle"><input name="tt" type="text" id="tt"></td>
                      </tr>
                      <tr class="mm">
                        <td height="22" class="smalltitle">Team</td>
                        <td height="22" class="smalltitle">
						<select name="d1" id="d1">
						<%
							rs = obj.select("select team_id,team_name from Teams");
							while(rs.next())
							{
							%>
								<option value="<%=rs.getString(1)%>" ><%=rs.getString(2)%></option> 
						<%	}
						%>
                          </select>                        </td>
                      </tr>
                      <tr class="mm">
                        <td height="26" class="smalltitle">Sex</td>
                        <td height="26" class="smalltitle"><select name="d2" id="d2">
                          <option>Male</option>
                          <option>Female</option>
                        </select></td>
                      </tr>
                      <tr class="mm">
                        <td height="25" class="smalltitle">Select Events </td>
                        <td height="25" valign="middle" class="smalltitle">
						<%
							rs=obj.select("select event_id,event_name from Events");
							while(rs.next())
							{ %>
							
								<input name="c1" type="checkbox" id="c1" value="<%=rs.getString(1)%>" ><%=rs.getString(2)%>
							<%}%>					   </td>
                      </tr>
                      <tr class="mm">
                        <td height="25" class="smalltitle">Max no. of events that can be registered </td>
                       	<td height="25" valign="middle" class="smalltitle">
						<%
							rs = obj.select("SELECT [no_events] FROM [ArtsSettings]");
							if(rs.next())
							{ %>
									<input name="tt2" type="text" id="tt2" size="2" readonly="true" value="<%=rs.getString(1)%>">
							<%}
						%>
						</td>
				     </tr>
                      <tr class="mm">
                        <td height="26" colspan="2" class="smalltitle"><div align="center">
                          <input name="Submit2" type="submit" class="btn" value="Submit">&nbsp;&nbsp;
                          <input name="Submit3" type="reset" class="btn" value="Reset">
                        </div></td>
                      </tr>
                      <%}%>
                    </table>
                        </form>
			<%
				String nam=request.getParameter("tt");
				String tm=request.getParameter("d1");
				String sx=request.getParameter("d2");
				String evt[] = request.getParameterValues("c1");
				String evnt="";
				if(nam!=null)
				{
					try
					{
						int stid=1000;	
						for(int k=0;k<evt.length;k++)
						{
							evnt = evnt+evt[k]+"~";
						}		
						evnt=evnt.substring(0,evnt.lastIndexOf("~"));
						rs = obj.select("select max(sid) as maxm from Register");
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
						obj.idu("INSERT INTO [Register] VALUES("+stid+",'"+nam+"','"+tm+"','"+sx+"','"+evnt+"')");
						out.print("You have been successfully registered");
						out.print("<br>");
						out.print("Participant ID: "+stid);
					}
					catch (Exception ex)
					{
						out.println(ex);
					}
				}
			%>
                  <p>&nbsp;</p>
                  <span class="style12">Registration is a one time process.<br>
              Any changes in registration can only be done through arts co-ordinator.</span></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
</td>
</tr><tr><td valign="bottom">
</td></tr></tbody></table>
</body></html>