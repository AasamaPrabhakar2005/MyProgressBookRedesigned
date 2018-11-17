<%@ page import="java.sql.ResultSet" import=" java.sql.DriverManager"
	import="java.sql.Connection" import="java.sql.Statement"
	import="java.sql.PreparedStatement" import="com.sb.web.redesigned.HelloWorldSB.DBManager"
	import="com.sb.web.redesigned.HelloWorldSB.SendMailSSL" import="com.sb.web.redesigned.HelloWorldSB.Base64Crypto"
	import="org.apache.log4j.Logger" %>
	<%@ page import="com.sb.web.redesigned.HelloWorldSB.ibatis.dao.Dao"%>
<%@ page import="com.sb.web.redesigned.HelloWorldSB.ibatis.dao.IbatisDao"  %>
<%@ page import="com.ibatis.common.resources.Resources"%>
<%@ page import="java.io.Reader"  %>
<%@ page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page import="com.ibatis.sqlmap.client.SqlMapClientBuilder"  %>
<%@ page import="com.sb.web.redesigned.HelloWorldSB.ibatis.bean.ParentBean"  %>
<%!
final Logger logger = Logger.getLogger("SignUp1_jsp"); 
public boolean add2IbatisParent(String login, String username, String password, String email, String question,String answer) {
	int num=0;
	 Dao manager = new IbatisDao();
	 ParentBean user=new ParentBean();
     //Create the SQLMapClient
     try{
     Reader reader = Resources.getResourceAsReader("sql-maps-config.xml");
     SqlMapClient sqlmapClient = SqlMapClientBuilder.buildSqlMapClient (reader);
     user=   manager.add2IbatisParent(user, username, password, email, question, answer, sqlmapClient);
	num=1;
     }catch(Exception e){
     	e.printStackTrace();
		} finally {
			try {
				if (num == 1) {
					System.out.println("Parent added");
					logger.info(username+" : Parent has been Successfully Added");
					String token=Base64Crypto.caesarCipherEncrypt(username);
					SendMailSSL.generateAndSendEmail(email,token);
				} else {
					System.out.println("Parent not added");
					logger.error(username+" : Parent has Failed to be Added");
				}

			} catch (Exception e1) {
				logger.error(e1.toString());
				e1.setStackTrace(null);
			}
		return true;
		}
	}%>
	<%/*public boolean add2IbatisParent(String login, String username, String password, String email, String question,
			String answer) {
		PreparedStatement preparedStatement = null;
		Connection connect = null;
		int result = 0;
		try {
			connect = DBManager.getConnection();
			String insertSQL = "INSERT INTO parent (Username,Password,Email,Question,Answer,verify) VALUES (?, ?, ?, ?, ?, ?)";
			preparedStatement = connect.prepareStatement(insertSQL);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			preparedStatement.setString(3, email);
			preparedStatement.setString(4, question);
			preparedStatement.setString(5, answer);
			preparedStatement.setString(6, "false");
			result = preparedStatement.executeUpdate();
		} catch (Exception e1) {
			logger.error(e1.toString());			
			// TODO Auto-generated catch block
			e1.printStackTrace();

		} finally {
			try {
				preparedStatement.close();
				connect.close();
				if (result == 1) {
					System.out.println("Parent added");
					logger.info(username+" : Parent has been Successfully Added");
					String token=Base64Crypto.caesarCipherEncrypt(username);
					SendMailSSL.generateAndSendEmail(email,token);
				} else {
					System.out.println("Parent not added");
					logger.error(username+" : Parent has Failed to be Added");
				}

			} catch (Exception e1) {
				logger.error(e1.toString());
				e1.setStackTrace(null);
			}
		}

		return true;
	}*/%>
<%
 	String loginAs = request.getParameter("LoginAs");
	String username = request.getParameter("Username");
	String password = request.getParameter("Password");
	String email = request.getParameter("Email");
	String question = request.getParameter("Question");
	String answer = request.getParameter("Answer");
	String class1 = request.getParameter("Class1");
	if (loginAs != null && username != null && password != null && email != null && question != null
			&& answer != null && loginAs.equals("Parent")) {
		add2IbatisParent(loginAs, username, password, email, question, answer);
	}

%>

<!DOCTYPE html>
<!-- Template by html.am -->
<html>
<head>
<!-- Global Site Tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-106957826-1"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments)
	};
	gtag('js', new Date());

	gtag('config', 'UA-106957826-1');
</script>
<link rel="stylesheet" href="../CSS/LoginPageCSS.css" />
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
	var bodyText = [
			"The smaller your reality, the more convinced you are that you know everything.",
			"If the facts don't fit the theory, change the facts.",
			"The past has no power over the present moment.",
			"This, too, will pass.",
			"</p><p>You will not be punished for your anger, you will be punished by your anger.",
			"Peace comes from within. Do not seek it without.",
			"<h2>Heading</h2><p>The most important moment of your life is now. The most important person in your life is the one you are with now, and the most important activity in your life is the one you are involved with now." ]
	function generateText(sentenceCount) {
		for (var i = 0; i < sentenceCount; i++)
			document.write(bodyText[Math.floor(Math.random() * 7)] + " ")
	}
</script>
<script type="text/javascript">
	/* =============================
	This script generates sample text for the body content. 
	You can remove this script and any reference to it. 
	 ============================= */
	var bodyText = [
			"The smaller your reality, the more convinced you are that you know everything.",
			"If the facts don't fit the theory, change the facts.",
			"The past has no power over the present moment.",
			"This, too, will pass.",
			"</p><p>You will not be punished for your anger, you will be punished by your anger.",
			"Peace comes from within. Do not seek it without.",
			"<h2>Heading</h2><p>The most important moment of your life is now. The most important person in your life is the one you are with now, and the most important activity in your life is the one you are involved with now." ]
	function generateText(sentenceCount) {
		for (var i = 0; i < sentenceCount; i++)
			document.write(bodyText[Math.floor(Math.random() * 7)] + " ")
	}
</script>
<script type="text/javascript">
	function ValidateAdd() {
		var email = document.SignUpForm.Email.value;
		var question = document.SignUpForm.Question.value;
		var answer = document.SignUpForm.Answer.value;
		var username = document.SignUpForm.Username.value;
		var password = document.SignUpForm.Password.value;
		var passwordR = document.SignUpForm.PasswordR.value;
		var loginAs = document.SignUpForm.LoginAs.value;

		if (loginAs == "") {
			alert("Please Select Options");
			document.LoginForm.LoginAs.focus();
			return false;
		}
		if (username == "") {
			alert("Please Enter Username");
			document.LoginForm.Username.focus();
			return false;
		}
		if (password == "") {
			alert("Please Enter Password");
			document.LoginForm.Password.focus();
			return false;
		}
		if (passwordR == "") {
			alert("Please Enter Password Retry");
			document.LoginForm.PasswordR.focus();
			return false;
		}
		if (password != passwordR) {
			alert("Please Edit Password OR Enter Same Password IN Password Retry");
			document.LoginForm.PasswordR.focus();
			return false;
		}
		if (email == "") {
			alert("Please Enter Email");
			document.LoginForm.Email.focus();
			return false;
		}
		if (question == "") {
			alert("Please Select Question");
			document.LoginForm.Question.focus();
			return false;
		}
		if (answer == "") {
			alert("Please Enter Answer");
			document.LoginForm.Answer.focus();
			return false;
		}
		document.SignUpForm.submit();

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
				<center>
					<form action="/signup" method="post" name="SignUpForm">
						<label>Sign Up as :&nbsp;</label><select name="LoginAs">
							<option value="Parent">Parent</option>
						</select><br /> <br /> <label>*Username:</label><br /> <br /> <input
							type="text" name="Username" size="30" /><br /> <br /> <label>*Password:</label><br />
						<br /> <input type="password" name="Password" size="30" /><br />
						<br /> <label>*Password Retry:</label><br /> <br /> <input
							type="password" name="PasswordR" size="30" /><br /> <br /> <label>*Email:</label><br />
						<br /> <input type="text" name="Email" size="30" /><br /> <br />
						<label>*Question in case you forget your password:<label /><br />
							<br /> <select name="Question">
								<option value=" "></option>
								<option value="Pet">What is your favorite pet ?</option>
								<option value="Superhero">What is your favorite
									childhood superhero ?</option>
						</select><br /> <br /> <label>*Answer in case you forget your
								password:</label><br /> <br /> <input type="text" name="Answer"
							size="30" /><br /> <br /> <input type="Button" value="Sign Up"
							onclick="return ValidateAdd()"><br /> <label>*
								Fields are mandatory</label>
					</form>
				</center>

				<div class="clr"></div>
			</div>
		</div>

		<div class="clr"></div>
	</div>
	</div>
	<%@ include file="footer.jsp" %>
	</div>
</body>
</html>
