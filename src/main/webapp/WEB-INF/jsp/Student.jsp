<%@ page import="java.net.URL" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.sb.web.redesigned.HelloWorldSB.Grade" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Hashtable" %>
<%@ page import="com.sb.web.redesigned.HelloWorldSB.DBManager"%>
<%@ page import="org.apache.log4j.Logger"  %>
<%@ page import="com.sb.web.redesigned.HelloWorldSB.ibatis.dao.Dao"%>
<%@ page import="com.sb.web.redesigned.HelloWorldSB.ibatis.dao.IbatisDao"  %>
<%@ page import="com.ibatis.common.resources.Resources"%>
<%@ page import="java.io.Reader"  %>
<%@ page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page import="com.ibatis.sqlmap.client.SqlMapClientBuilder"  %>
<%@ page import="com.sb.web.redesigned.HelloWorldSB.ibatis.bean.GradeBean"  %>
<%!
private Integer getStudentIdIbatis(String username) {
Connection connect = null;
	 Statement statement = null;
	 ResultSet resultSet = null;			
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
 public String getPasswordFromDBIbatis (String username) {
  Connection connect = null;
	  Statement statement = null;
	  ResultSet resultSet = null;
			String password = "";
			 Dao manager = new IbatisDao();
			 
		        //Create the SQLMapClient
		        try{
		        	
		        	 
		        Reader reader = Resources.getResourceAsReader("sql-maps-config.xml");
		        SqlMapClient sqlmapClient = SqlMapClientBuilder.buildSqlMapClient (reader);
		        password=   manager.getPasswordFromDB(username,sqlmapClient);
				return password;
		        }catch(Exception e){
		        	e.printStackTrace();
		        }
		        return password;
			}
%>
<% 
final Logger logger = Logger.getLogger("Student_jsp"); 
 Connection connect = null;
	 Statement statement = null;
	 ResultSet resultSet = null;
String username=request.getParameter("Username");
String password=request.getParameter("Password");
String loginAs=request.getParameter("LoginAs");
String passwordFromDB=getPasswordFromDBIbatis(username);
if(!passwordFromDB.equals(password)){
out.println("Invalid Login");
logger.error(username+" : Student failed to login");
return;
}
logger.info(username+" : Student Successfully Logged In");
int id=getStudentIdIbatis(username);
//int id=getStudentId(username);
session.setAttribute( "username", username );
List<GradeBean> userGrades=null;
	 Dao manager = new IbatisDao();
	 
    //Create the SQLMapClient
    try{
    	
    	 
    Reader reader = Resources.getResourceAsReader("sql-maps-config.xml");
    SqlMapClient sqlmapClient = SqlMapClientBuilder.buildSqlMapClient (reader);
    System.out.println("id="+id);
    userGrades=manager.getStudentGrade(id,sqlmapClient);
    }catch(Exception e){
    	e.printStackTrace();
				}

%>
//out.println("Welcome to jsp!");
<!DOCTYPE html>
<!-- Template by html.am -->
<html>
	<!-- Global Site Tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-106957826-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments)};
  gtag('js', new Date());

  gtag('config', 'UA-106957826-1');
</script>
	<head>
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
<%=username%>
</h2>
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
  <%for(int i=0;i<userGrades.size();i++){ %>
  <tr>
    <td><%=userGrades.get(i).getQuarter() %></td>
    <td><%=userGrades.get(i).getScience() %></td> 
    <td><%=userGrades.get(i).getMath() %></td>
    <td><%=userGrades.get(i).getSocial_studies() %></td>
    <td><%=userGrades.get(i).getEla() %></td>
    <td><%=userGrades.get(i).getHindi() %></td>
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


