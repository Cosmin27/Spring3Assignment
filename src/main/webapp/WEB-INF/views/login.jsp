<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page session="true"%>
<html>
<head>
<title>Login</title>
<link href="/assignment3spring/resources/style.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<div class="header_wrapper">
		<div class="header">
			<div class="page_title">Assignment</div>
			<div class="main_menu">
				<a href="/assignment3spring/">Home</a>
				<c:choose>
					<c:when test="${sessionScope.logged == true}">
						<a href="/assignment3spring/friends">Friends</a>
						<a href="/assignment3spring/about">About</a>
						<a href="/assignment3spring/logout">Log out</a>
					</c:when>

					<c:otherwise>
						<a href="/assignment3spring/about">About</a>
						<a href="/assignment3spring/login">Login</a>
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
	</div>
	<div class="info_header_wrapper"></div>

	<div class="content_wrapper">
		<div class="content">
			<div>
				<div class="content-holder">
					<sf:form action="/assignment3spring/login" method="POST"
						modelAttribute="login">
						<input type="hidden" name="_method" value="POST" />
						<input type="hidden" name="usernameHidden" value="${user.username}" />
						<input type="hidden" name="passwordHidden" value="${user.password}" />
						<div class="padding_container">
							<table>
								<tr>
									<td><label for="username" class="artist_form_label">Username:
									</label></td>
									<td><sf:input path="username" size="15" id="username"
											class="vertical_middle" /> <sf:errors path="username"
											cssClass="error" /></td>
								</tr>
								<tr>
									<td><label for="password" class="artist_form_label">Password:
									</label></td>
									<td><sf:input path="password" size="15" id="password"
											type="password" class="vertical_middle" /> <sf:errors
											path="password" cssClass="error" /></td>
								</tr>
							</table>
						</div>

						<div class="button-wrapper">
							<div class="button_holder">
								<input name="tryToLogin" type="submit" value="Log in"
									class="btn" />
								<!-- using the actual application name in the URL -->
								<a href="/assignment3spring/"
									class="btn" class="left_spacing">Cancel/Back</a>
							</div>
						</div>
					</sf:form>
				</div>
			</div>
		</div>

		<div class="info_footer_wrapper"></div>
		<div class="footer_wrapper">
			<div class="footer">
				<div class="copyright">Spring Session Breakout</div>
			</div>
		</div>
	</div>
</body>
</html>
