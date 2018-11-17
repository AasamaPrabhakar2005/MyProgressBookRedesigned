<%@ page import="java.net.URL" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.sb.web.redesigned.HelloWorldSB.Grade" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Hashtable" %>
<%@ page import="com.sb.web.redesigned.HelloWorldSB.DBManager" %>
<%@ page import="com.sb.web.redesigned.HelloWorldSB.ibatis.dao.Dao"%>
<%@ page import="com.sb.web.redesigned.HelloWorldSB.ibatis.dao.IbatisDao"  %>
<%@ page import="com.ibatis.common.resources.Resources"%>
<%@ page import="java.io.Reader"  %>
<%@ page import="org.apache.log4j.Logger"  %>
<%@ page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page import="com.ibatis.sqlmap.client.SqlMapClientBuilder"  %>
<%@ page import="com.sb.web.redesigned.HelloWorldSB.ibatis.bean.GradeBean"  %>
<%@ page import="com.sb.web.redesigned.HelloWorldSB.ibatis.bean.ParentBean"  %>
<%!
private Vector getAllStudentOfParent(String guardian) {
	 Hashtable student= new Hashtable();
 Integer id =0;
String username="";
Vector students=new Vector();
				//	System.out.println("1");
					try {
						 Dao manager = new IbatisDao();						 	 
						 Reader reader = Resources.getResourceAsReader("sql-maps-config.xml");
						 SqlMapClient sqlmapClient = SqlMapClientBuilder.buildSqlMapClient (reader);
						 student=   manager.getStudent(guardian,sqlmapClient);
						students.add(student);

					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} 
					return students;
	}
private Integer getStudentId(String username) {			
	 Integer id =0;
Dao manager = new IbatisDao();
//Create the SQLMapClient
try{
	
	 
Reader reader = Resources.getResourceAsReader("sql-maps-config.xml");
SqlMapClient sqlmapClient = SqlMapClientBuilder.buildSqlMapClient (reader);
id=   manager.getStudentId(username,sqlmapClient);
	return id;
}catch(Exception e){
	e.printStackTrace();
}
return id;
	}
public String getParentPasswordFromDB (String username) {
			String password = "";
				System.out.println("1");
				try {
					 Dao manager = new IbatisDao();
					 Reader reader = Resources.getResourceAsReader("sql-maps-config.xml");
					 SqlMapClient sqlmapClient = SqlMapClientBuilder.buildSqlMapClient (reader);
					 password=   manager.getParentPasswordFromDB(username,sqlmapClient);

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("2");
				}
				return password;
				
			}

public String getParentEmailFromDB (String username) {
	String password = "";
String email = "";
	//	System.out.println("1");
		try {
			 Dao manager = new IbatisDao();
			 Reader reader = Resources.getResourceAsReader("sql-maps-config.xml");
			 SqlMapClient sqlmapClient = SqlMapClientBuilder.buildSqlMapClient (reader);
			 email=   manager.getParentEmailFromDB(username,sqlmapClient);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return email;
	}

%>
<% 

String username=request.getParameter("Username");
String password=request.getParameter("Password");
String loginAs=request.getParameter("LoginAs");
//System.out.println(username +","+ password+ ","+loginAs);
String passwordFromDB="";
Hashtable parentData=null;
Vector students= null;
if(loginAs!=null && loginAs.equals("Parent")){
 String password1=getParentPasswordFromDB(username);
 String email=getParentEmailFromDB(username);
 parentData.put("password", password1);
 parentData.put("email", email);
session.setAttribute("parentData", parentData);
System.out.println(parentData);
passwordFromDB=parentData.get("password").toString();
}
final Logger logger = Logger.getLogger("Parent_jsp"); 
//System.out.println("passwordFromDB="+passwordFromDB );

if(loginAs!=null && !passwordFromDB.equals(password)){
out.println("Invalid Login");
logger.error(username+" : Parent Failed to Login");
return;
}
logger.info(username+" : Parent Successfully Logged In");
Integer id=-1;
String susername="";
if(loginAs!=null && loginAs.equals("Parent")){
 students=getAllStudentOfParent(parentData.get("email").toString());
}else{
parentData=(Hashtable)session.getAttribute("parentData");
 students=getAllStudentOfParent(parentData.get("email").toString());
System.out.println(request.getParameter("Students"));
String id_username=request.getParameter("Students");
System.out.println("id_username="+id_username);
String array[]=id_username.split("~");
//System.out.println(array.length);
if(array!=null && array.length==2){
id=Integer.parseInt(array[0]);
susername=array[1];
//System.out.println(id);
//System.out.println(susername);
}
}
List<GradeBean> list = new ArrayList<GradeBean>();
//out.println("Welcome to jsp!");
try {
	 Dao manager = new IbatisDao();
	 Reader reader = Resources.getResourceAsReader("sql-maps-config.xml");
	 SqlMapClient sqlmapClient = SqlMapClientBuilder.buildSqlMapClient (reader);
	 list=   manager.getStudentGrade(id, sqlmapClient);
//System.out.println(list);
logger.info(id+" : Fetch Grade SuccessFully");
		} catch (Exception e) {
			logger.error(e.toString());
			e.printStackTrace();
		} 

%>
<!DOCTYPE html>
<!-- Template by html.am -->
<html>
	<head>
		<!-- Global Site Tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-106957826-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments)};
  gtag('js', new Date());

  gtag('config', 'UA-106957826-1');
</script>
		<link rel="stylesheet" href="../CSS/Parent.css"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Fixed Width 2 Orange</title>
		<style type="text/css">
		<%@ include file="Head.jsp" %>
		</style>
		<script type="text/javascript">
			/* =============================
			This script generates sample text for the body content. 
			You can remove this script and any reference to it. 
			 ============================= */
			var bodyText=["The smaller your reality, the more convinced you are that you know everything.", "If the facts don't fit the theory, change the facts.", "The past has no power over the present moment.", "This, too, will pass.", "</p><p>You will not be punished for your anger, you will be punished by your anger.", "Peace comes from within. Do not seek it without.", "<h2>Heading</h2><p>The most important moment of your life is now. The most important person in your life is the one you are with now, and the most important activity in your life is the one you are involved with now."]
			function generateText(sentenceCount){
				for (var i=0; i<sentenceCount; i++)
				document.write(bodyText[Math.floor(Math.random()*7)]+" ")
			}
			function loadNewStudentGrade(){
				document.ParentForm.action="/parent";
				//document.ParentForm.Students.value=5;
				document.ParentForm.submit();
				
			}
		</script>
	</head>
	<body>
		<div id="page">
		<%@ include file="Header.jsp" %>
			<div class="feature">
				<div class="feature-inner">
				<center>
				<h1>My Progressbook</h1>
				</center>
				</div>
			</div>
		
	
			<div id="content">
				<div id="content-inner">
				
				<h2>
Grades for student:
<%=susername%>
</h2>
<form name="ParentForm" action="/parent" method="">
<select name="Students" onchange="loadNewStudentGrade()">
<option value=""> </option>
<% 
for(int count=0;count<students.size();count++){
Hashtable student=(Hashtable)students.get(count);
%>
<option value="<%=student.get("id") %>~<%=student.get("username") %>"><%=student.get("username") %></option>
<%
}
%>
</select><br><br>

</form>
<body>
<table style="width:100%">
  <tr>
    <th>Quarter</th>
    <th>Science</th> 
    <th>Math</th>
    <th>Social Studies</th>
    <th>ELA</th>
    <th>Hindi</th>
  </tr>
  <% for(int i=0;i<list.size();i++){ %>
  <tr>
    <td><%=list.get(i).getQuarter() %></td>
    <td><%=list.get(i).getScience() %></td> 
    <td><%=list.get(i).getMath() %></td>
    <td><%=list.get(i).getSocial_studies() %></td>
    <td><%=list.get(i).getEla() %></td>
    <td><%=list.get(i).getHindi() %></td>
  </tr>
 <%}%>
</table>
					<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
					<div class="clr"></div>
				</div>
			</div>
					
					<div class="clr"></div>
				</div>
			</div>
			<%@ include file="footer.jsp" %>
		</div>
	</body>


