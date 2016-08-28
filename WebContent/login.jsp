<%@page import="br.edu.devmedia.insta.MeuServletInsta"%>
<%@page import="org.jinstagram.auth.InstagramAuthService"%>
<%@page import="org.jinstagram.auth.oauth.InstagramService"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Instagram</title>
<style type="text/css">
	
</style>
</head>
<body>

	<%
		InstagramService servico = new InstagramAuthService()
										.apiKey("7ed06ddbd6f24c438a3d1c6d64dab0ff")
										.apiSecret("a516289a29f742069cc5b10571fb364c")
										.callback("http://localhost:8080/devmedia-instagram-oauth/token").build();
		
			String autorizacao = servico.getAuthorizationUrl(null);
			
			session.setAttribute(MeuServletInsta.SERVICO_INSTA, servico);
	%>

	<div>
		<form action="">
			<a href="<%=autorizacao%>">Clique aqui para logar com o Instagram</a>
		</form>
	</div>

</body>
</html>