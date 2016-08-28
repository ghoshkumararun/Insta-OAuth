<%@page import="org.jinstagram.entity.users.feed.MediaFeedData"%>
<%@page import="java.util.List"%>
<%@page import="org.jinstagram.entity.users.feed.MediaFeed"%>
<%@page import="org.jinstagram.entity.users.basicinfo.UserInfoData"%>
<%@page import="br.edu.devmedia.insta.MeuServletInsta"%>
<%@page import="org.jinstagram.Instagram"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pefil Insta</title>
</head>
<body>

	<%
		Instagram insta = (Instagram) session.getAttribute(MeuServletInsta.OBJETO_INSTA);
		
			UserInfoData usuario = insta.getCurrentUserInfo().getData();
			MediaFeed mediaFeed = insta.getRecentMediaFeed("54609412");
	%>
	
	<h1>Nome Usuário: <%= usuario.getFullName() %></h1>
	<%= usuario.getBio() %><br>
	<%= usuario.getFirst_name() %><br>
	<%= usuario.getId() %><br>
	<img src="<%= usuario.getProfile_picture() %>" /><br>
	<%= usuario.getUsername() %><br>
 	<%= usuario.getCounts().getFollows() %><br>
 	<%= usuario.getCounts().getFollwed_by() %><br>
 	<%= usuario.getCounts().getMedia() %><br>
 	
 	<hr/>
 	
 	<h1>Total Feed: <%=mediaFeed.getData().size() %> </h1>
 	<%
 		for (MediaFeedData feed : mediaFeed.getData()) {
 	%>
		<img height="100" alt="" src="<%=feed.getImages().getLowResolution().getImageUrl() %>"><br>
		<span>Caption: <%= feed.getCaption() != null ? feed.getCaption().getText() : "" %></span>
 	<%
 		}
 	%>

</body>
</html>