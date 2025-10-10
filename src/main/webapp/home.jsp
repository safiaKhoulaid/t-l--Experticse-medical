<% response.sendRedirect("home"); %>

<h1>Bienvenue ${sessionScope.user.email}</h1>
<a href="logout">Se déconnecter</a>
