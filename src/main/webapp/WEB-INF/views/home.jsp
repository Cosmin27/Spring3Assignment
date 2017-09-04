<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page session="true"%>
<html>
<head>
<title>Home</title>
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
						<a href="/assignment3spring/logout">Log out</a>
					</c:when>

					<c:otherwise>
						<a href="/assignment3spring/login">Login</a>
					</c:otherwise>
				</c:choose>
				<a href="/assignment3spring/about">About</a>
			</div>
		</div>
	</div>
	<div class="info_header_wrapper"></div>

	<div class="content_wrapper">
		<div class="content">
			<div>
				<div class="content-holder">
					<div class="padding_container">
						<c:choose>
							<c:when test="${sessionScope.logged == true}">
								<sf:form action="/assignment3spring/" method="POST"
									modelAttribute="message">
									<input type="hidden" name="_method" value="POST" />
									<input type="hidden" name="usernameHidden"
										value="${user.username}" />
									<input type="hidden" name="messageHidden" value="${message}" />
									<div class="padding_container">
										<c:forEach var="messagesList" items="${messages}">
											<p><span class="bold_font">${messagesList.messageAuthor.username}:</span> ${messagesList.messageText}</p>
										</c:forEach>
										<table>
											<tr>
												<td><label for="messageText" class="artist_form_label">Message:
												</label></td>
												<td><sf:input path="messageText" size="90"
														id="messageText" class="vertical_middle" /> <sf:errors
														path="messageText" cssClass="error" /></td>
												<td>
													<div class="button_holder">
														<input name="submitMessage" type="submit"
															value="Send Message" class="btn" />
													</div>
												</td>
											</tr>
										</table>

									</div>
								</sf:form>
							</c:when>
							<c:otherwise>
								<p>Log in to be able to see messages.</p>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="info_footer_wrapper"></div>
	<div class="footer_wrapper">
		<div class="footer">
			<div class="copyright">Spring Session Breakout</div>
		</div>
	</div>

</body>
</html>
