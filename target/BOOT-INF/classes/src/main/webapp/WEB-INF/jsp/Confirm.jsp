<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" import=" java.sql.DriverManager"
	import="java.sql.Connection" import="java.sql.Statement"
	import="java.sql.PreparedStatement" import="application.DBManager"
	import="application.SendMailSSL" 
	import="org.apache.log4j.Logger"%>
	<%@ page  import="com.sb.web.redesigned.HelloWorldSB.Base64Crypto" %>
	<%@ page  import="com.sb.web.redesigned.HelloWorldSB.ibatis.bean.ParentBean" %>
	<%@ page  import="com.sb.web.redesigned.HelloWorldSB.ibatis.dao.Dao" %>
	<%@ page  import="com.sb.web.redesigned.HelloWorldSB.ibatis.dao.IbatisDao" %>
	<%@ page import="com.ibatis.common.resources.Resources"%>
<%@ page import="java.io.Reader"  %>
<%@ page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page import="com.ibatis.sqlmap.client.SqlMapClientBuilder"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Parent Confirmation</title>
<%!
final Logger logger = Logger.getLogger("Confirm_jsp"); 
public boolean ConfirmEmail(String username) {
		int result = 0;
		ParentBean user=new ParentBean();
			 try{	
					Dao manager = new IbatisDao();
			 Reader reader = Resources.getResourceAsReader("sql-maps-config.xml");
			 SqlMapClient sqlmapClient = SqlMapClientBuilder.buildSqlMapClient (reader);
			 user=   manager.ConfirmEmail(user,username,sqlmapClient);
		} catch (Exception e1) {
			logger.error(e1.toString());
			e1.printStackTrace();

		} finally {
			try {
			
				if (result == 1) {
					System.out.println("Parent confirmed");
					logger.info(username+" : Parent has been confirmed");
				} else {
					System.out.println("Parent not confirmed");
					logger.error(username+" : Parent has Failed to be confirmed");
				}

			} catch (Exception e1) {
				logger.error(e1.toString());
				e1.setStackTrace(null);
			}
		return true;
		
	}
	}%>
</head>
<body>
	<%
	
		boolean isConfirmed = false;
		String token = request.getParameter("token");
		String username = Base64Crypto.caesarCipherDecrypte(token);
		isConfirmed = ConfirmEmail(username);
		if (isConfirmed == true) {
			
			out.println("<br><font color='green' size='12px'>Congratulations,Parent email has been confirmed!</font>");
		} else {
			out.println("<br><font color='red' size='12px'>Parent not confirmed.</font>");
		}
	%>
	
</body>
</html>