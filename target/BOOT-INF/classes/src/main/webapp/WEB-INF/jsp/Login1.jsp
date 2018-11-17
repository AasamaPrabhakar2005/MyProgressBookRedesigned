<%@ page import="org.apache.log4j.Logger" %>
<%

//String session_username=session.getAttribute( "username")+"";
//out.println("username="+session_username);

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
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Fixed Width 2 Orange</title>
		<link rel="stylesheet" href="../CSS/LoginPageCSS.css"/>
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
		<script type="text/javascript">
	function ValidateForm(){
	var username=document.LoginForm.Username.value;
	var password=document.LoginForm.Password.value;
	var loginAs=document.LoginForm.LoginAs.value;
	if(loginAs==""){
		alert("Please Select Options");
		document.LoginForm.LoginAs.focus();
		return false;
		}
	if(username==""){
		alert("Please Enter Username");
		document.LoginForm.Username.focus();
		return false;
		}
	if(password==""){
		alert("Please Enter Password");
		document.LoginForm.Password.focus();
		return false;
		}
	if(document.LoginForm.LoginAs.value=="Parent"){
	document.LoginForm.action="/parent";
		}else{
			document.LoginForm.action="/student";
			}
	


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
					<form name="LoginForm" action="" method="">
<label >Login as :&nbsp;</label>
<select name="LoginAs">
<option value=""> </option>
  <option value="Parent">Parent</option>
  <option value="Student">Student</option>
</select><br><br>

<label >*Username:</label><br><br><input type="text" name="Username" size="30"><br><br>
<label >*Password:</label><br><br><input type="password" name="Password" size="30"><br><br>
<input type="Submit" value="Login" onclick="return ValidateForm()"/><br>
<label>* Fields are mandatory</label>
</form>
					<br/><br/>
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
