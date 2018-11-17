<%

String session_username=session.getAttribute( "username")+"";
out.println("username="+session_username);

%>
<header id="header">
				<div id="header-inner">	
					<div id="logo">
						<h1><img src="../img/pclogo.png"></span></a></h1>
					</div>
					<div id="top-nav">
						<ul>
						<li><a href="/about">About</a></li>
						<li><a href="/contact">Contact</a></li>
						<li><a href="/login">Login</a></li>
						<li><a href="/signup">Sign Up</a></li>
						<li><a href="/donate">Donate</a></li>
						<li><a href="/help">Help</a></li>
						</ul>
					</div>
					<div class="clr"></div>
				</div>
			</header>