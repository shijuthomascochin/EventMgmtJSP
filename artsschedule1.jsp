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
.style8 {
	font-size: 9px;
	color: #999999;
}
.style9 {font-size: 10px}
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
<script type='text/javascript'>
	var dtCh= "/";
	var minYear=2007;
	var maxYear=2050;
function formValidator()
{
	var stage = document.getElementById('t1');
	var d = document.getElementById('t2');
	var t = document.getElementById('t3');
	var dd = document.getElementById('t4');
	
	if(isEmpty(stage,"Please enter the stage name"))
	{	
		if(isNum(dd,"Please enter valid ruration"))
		{
			if (isDate(d.value))
			{
				if(validatetime(t.value))
				{	
		   			return true;
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

function isNum(elem, helperMsg){
	var numericExpression = /^[0-9]+$/;
	if(elem.value.match(numericExpression)){
		return true;
	}else{
		alert(helperMsg);
		elem.focus();
		return false;
	}
}

function isInteger(s){
	var i;
    for (i = 0; i < s.length; i++){   
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}

function stripCharsInBag(s, bag){
	var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++){   
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function daysInFebruary (year){
	// February has 29 days in any year evenly divisible by four,
    // EXCEPT for centurial years which are not also divisible by 400.
    return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
}
function DaysArray(n) {
	for (var i = 1; i <= n; i++) {
		this[i] = 31
		if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
		if (i==2) {this[i] = 29}
   } 
   return this
}

function isDate(dtStr){
	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	var strMonth=dtStr.substring(0,pos1)
	var strDay=dtStr.substring(pos1+1,pos2)
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for (var i = 1; i <= 3; i++) {
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	month=parseInt(strMonth)
	day=parseInt(strDay)
	year=parseInt(strYr)
	if (pos1==-1 || pos2==-1){
		alert("The date format should be : mm/dd/yyyy")
		return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		alert("Please enter a valid month")
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		alert("Please enter a valid day")
		return false
	}
	if (strYear.length != 4 || year==0 || year<minYear || year>maxYear){
		alert("Please enter a valid 4 digit year between "+minYear+" and "+maxYear)
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		alert("Please enter a valid date")
		return false
	}
return true
}

function validatetime(strval)
	{
		
		var strval1;
				
		//minimum lenght is 6. example 1:2 AM
		if(strval.length < 6)
		{
			alert("Invalid time. Time format should be HH:MM AM/PM.");
			return false;
		}
		
		//Maximum length is 8. example 10:45 AM
		if(strval.lenght > 8)
		{
			alert("invalid time. Time format should be HH:MM AM/PM.");
			return false;
		}
		
		//Removing all space
		strval = trimAllSpace(strval);	
		
		//Checking AM/PM
		if(strval.charAt(strval.length - 1) != "M" && strval.charAt(strval.length - 1) != "m")
		{
			alert("Invalid time. Time shoule be end with AM or PM.");
			return false;
			
		}
		else if(strval.charAt(strval.length - 2) != 'A' && strval.charAt(strval.length - 2) != 'a' && strval.charAt(strval.length - 2) != 'p' && strval.charAt(strval.length - 2) != 'P')
		{
			alert("Invalid time. Time shoule be end with AM or PM.");
			return false;
			
		}
		
		//Give one space before AM/PM
		
		strval1 =  strval.substring(0,strval.length - 2);
		strval1 = strval1 + ' ' + strval.substring(strval.length - 2,strval.length)
		
		strval = strval1;
						
		var pos1 = strval.indexOf(':');
		document.Form1.TextBox1.value = strval;
		
		if(pos1 < 0 )
		{
			alert("invlalid time. A color(:) is missing between hour and minute.");
			return false;
		}
		else if(pos1 > 2 || pos1 < 1)
		{
			alert("invalid time. Time format should be HH:MM AM/PM.");
			return false;
		}
		
		//Checking hours
		var horval =  trimString(strval.substring(0,pos1));
			
		if(horval == -100)
		{
			alert("Invalid time. Hour should contain only integer value (0-11).");
			return false;
		}
						
		if(horval > 12)
		{
			alert("invalid time. Hour can not be greater that 12.");
			return false;
		}
		else if(horval < 0)
		{
			alert("Invalid time. Hour can not be hours less than 0.");
			return false;
		}
		//Completes checking hours.
		
		//Checking minutes.
		var minval =  trimString(strval.substring(pos1+1,pos1 + 3));
		
		if(minval == -100)
		{
			alert("Invalid time. Minute should have only integer value (0-59).");
			return false;
		}
				
		if(minval > 59)
		{
		   alert("Invalid time. Minute can not be more than 59.");
		   return false;
		}   
		else if(minval < 0)
		{
			alert("Invalid time. Minute can not be less than 0.");
			return false;
		}
			
		//Checking minutes completed.		
		
		//Checking one space after the mintues	
		minpos = pos1 + minval.length + 1;
		if(strval.charAt(minpos) != ' ')
		{
			alert("Invalid time. Space missing after minute. Time should have HH:MM AM/PM format.");
			return false;
		}
	
				
		return true;
		
		
	}
	
	function trimAllSpace(str)
	{
		 var str1 = '';
	    var i = 0;
	    
		while(i != str.length)
		{
			if(str.charAt(i) != ' ')
			  str1 = str1 + str.charAt(i);
			
			  
			  i ++;
		}
				
		return str1;	
	}
	
	 function trimString(str)
	{
		var str1 = '';
		var i = 0;
		while ( i != str.length)
		{
			if(str.charAt(i) != ' ')
				str1 = str1 + str.charAt(i);
				
			i++;	
		}	
		
		var retval = IsNumeric(str1);
		
		if(retval == false)
			return -100;
		else
			return str1;
		
			
	}
	
	function IsNumeric(strString)
	{
		var strValidChars = "0123456789";
		var strChar;
		var blnResult = true;
		//var strSequence = document.frmQuestionDetail.txtSequence.value;
				
		//  test strString consists of valid characters listed above
		if (strString.length == 0) return false;
		for (i = 0; i < strString.length && blnResult == true; i++)
			{
			strChar = strString.charAt(i);
			if (strValidChars.indexOf(strChar) == -1)
				{
					blnResult = false;
				}
			}
		return blnResult;

			
	}
</script>
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
        <table width="390" border="1">
          <tr bgcolor="#BF2B1F">
            <td height="20" colspan="5"><div align="center" class="style4">Event Schedule </div></td>
          </tr>
          <tr bgcolor="#BF2B1F">
            <td width="95" height="16"><div align="center" class="style6">
                <div align="center">Event</div>
            </div></td>
            <td width="81"><div align="center" class="style6">
                <div align="center">Stage</div>
            </div></td>
            <td width="70"><div align="center" class="style6">
                <div align="center">Date</div>
            </div></td>
            <td width="56"><div align="center" class="style6">
              <div align="center">Time</div>
            </div></td>
            <td width="56"><div align="center" class="style6">
              <div align="center">Duration</div>
            </div></td>
            </tr>
          <%
		  rs=obj.select("SELECT Events.event_name, EventSchedule.stage_name, CONVERT (varchar,EventSchedule.event_date,101) as event_date,EventSchedule.event_stime, EventSchedule.event_duration FROM EventSchedule INNER JOIN Events ON EventSchedule.event_id = Events.event_id");
		  while(rs.next())
		  {
		  %>
          <tr class="mm">
            <td height="24"><div align="center" class="style9"><%=rs.getString(1)%></div></td>
            <td><div align="center" class="style9"><%=rs.getString(2)%></div></td>
            <td><div align="center" class="style9"><%=rs.getString(3)%></div></td>
            <td><div align="center" class="style9"><%=rs.getString(4)%></div></td>
            <td><div align="center" class="style9"><%=rs.getString(5)%></div></td>
            </tr>
          <%}%>
        </table>
		<br>
		<br>
        <form name="form1" method="get" action="artsschedule1.jsp">
          <table width="390" height="223" border="1">
            <tr bgcolor="#BF2B1F">
              <td height="26" colspan="2"><div align="center" class="style4">Edit Schedule </div></td>
            </tr>
            <tr bgcolor="#BF2B1F" class="style4">
              <td width="109" height="20" bgcolor="#D12428"><span class="style6">Event</span></td>
              <td width="219" bgcolor="#D12428"><span class="style6"></span><span class="style6">
                <select name="d1" id="d1" onChange="form.submit()">
                  <option >Select event</option>
                  <%
				   String evnt = request.getParameter("d1");
					rs = obj.select("select event_id,event_name from Events");
					while(rs.next())
					{ 	String s = rs.getString(1);
						String ss = rs.getString(2);
				%>
                  <option value="<%=s%>" <%if(evnt!=null && evnt.equals(s)) {%> selected="selected" <%}%> ><%=ss%></option>
                  <%} %>
                </select>
				<%
					String sg = "";
					String dt = "";
					String tm = "";
					String dr = "";
					String evt = request.getParameter("d1");
					String btn = request.getParameter("btn");
					if(btn==null)
					{
						rs = obj.select("SELECT [stage_name],CONVERT(varchar,[event_date],101) as [event_date],[event_stime], [event_duration] FROM [EventSchedule] WHERE [event_id]='"+evt+"'");
						while(rs.next())
						{ 	
							sg = rs.getString(1);
							dt = rs.getString(2);
							tm = rs.getString(3);
							dr = rs.getString(4);
						}
					}
					else
					{
						sg = request.getParameter("t1");
						dt = request.getParameter("t2");
						tm = request.getParameter("t3");
						dr = request.getParameter("t4");
						try
						{
							obj.idu("DELETE FROM [EventSchedule] WHERE [event_id]='"+evt+"'");
							obj.idu("INSERT INTO [EventSchedule] VALUES ('"+evt+"','"+sg+"','"+dt+"','"+tm+"',"+dr+")");
							out.print("<script>");
							out.print("alert(\"Event has been successfully scheduled..!!\")");
							out.print("</script>");
						}
						catch(Exception ex)
						{
							
						}
					}
				%>
              </span></td>
            </tr>
            <tr bgcolor="#BF2B1F" class="style4">
              <td height="20" bgcolor="#D12428"><span class="style6">Stage name </span></td>
              <td bgcolor="#D12428"><input name="t1" type="text" id="t1" size="20" value="<%=sg%>" ></td>
            </tr>
            <tr bgcolor="#BF2B1F" class="style4">
              <td height="20" bgcolor="#D12428"><span class="style6">Date</span></td>
              <td bgcolor="#D12428"><input name="t2" type="text" id="t2" size="20" value="<%=dt%>" > 
                <span class="style8">(mm/dd/yyyy) </span></td>
            </tr>
            <tr bgcolor="#BF2B1F" class="style4">
              <td height="20" bgcolor="#D12428"><span class="style6">Time</span></td>
              <td bgcolor="#D12428"><input name="t3" type="text" id="t3" size="10" value="<%=tm%>" > 
                <span class="style8">(eg: 10:30 PM) </span></td>
            </tr>
            <tr bgcolor="#BF2B1F" class="style4">
              <td height="20" bgcolor="#D12428"><span class="style6">Duration</span></td>
              <td bgcolor="#D12428"><input name="t4" type="text" id="t4" size="10" value="<%=dr%>" ></td>
            </tr>
            <tr bgcolor="#BF2B1F" class="style4">
              <td height="20" colspan="2" bgcolor="#D12428"><div align="center">
                  <input  name="btn" type="submit" class="btn" id="btn" value="Submit" <%if(evnt==null || evnt.equals("Select event")) {%>disabled="disabled"<%}%>  onClick='return formValidator()' >
                 &nbsp; &nbsp;<input name="Button" type="button" class="btn" value="Cancel" onClick='location.href="artsadminpage.jsp"' >
              </div></td>
            </tr>
          </table>
                </form></td>
    </tr>
  </tbody>
</table>
</td>
</tr><tr><td valign="bottom">
</td></tr></tbody></table>
</body></html>

