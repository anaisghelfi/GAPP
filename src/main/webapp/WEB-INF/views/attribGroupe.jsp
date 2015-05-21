<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Page d'accueil</title>
	<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" type="text/css" media="screen" />
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" media="screen" />
    <link href="<c:url value="/resources/css/animate.css" />" rel="stylesheet" type="text/css" media="screen" />
    <link href="<c:url value="/resources/fonts/css/font-awesome.css" />" rel="stylesheet" type="text/css" media="screen" />
   
</head>

<body>
	
	
	<form action="addGroupe" method="post" style="border: 1px solid black;">
	ajouter un groupe<br>
		nom du groupe <input name="nom" type="text">
<!-- 		nom du tuteur <input name="tuteur_id" type="text"> -->
		<input name="ajouter" type="submit">
	</form>
	
	<form action="deleteGroup" method="post" style="border: 1px solid black;">
	enlever un groupe <br>
		<select name="nomGroupe" type="text">
			<c:forEach var="groupe" items="${groupes}">
				<option><c:out value="${groupe.nom}"/></option>
			</c:forEach>
		</select>
		<input name="enlever" type="submit">
	</form>
	
	attribuer un élève a un groupe
	<form action="attribGroup" method="post" style="border: 1px solid black;">
		<select name="nomGroupe" type="text">
			<c:forEach var="groupe" items="${groupes}">
				<option><c:out value="${groupe.nom}"/></option>
			</c:forEach>
		</select>
		<input name="nomEleve" type="text">
		<input name="attribuer" type="submit">
	</form>

</body>
</html>