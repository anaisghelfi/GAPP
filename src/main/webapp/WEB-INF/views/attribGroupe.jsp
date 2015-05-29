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
		<h1>ajouter un groupe (ok)</h1>
			nom du groupe <input name="nom" type="text">
<!-- 		nom du tuteur <input name="tuteur_id" type="text"> -->
		<input name="ajouter" type="submit">
	</form>
	
	<br>
	
	<form action="deleteGroupe" method="post" style="border: 1px solid black;">
		<h1>enlever un groupe (ok)</h1>
		<select name="nom">
			<c:forEach var="groupe" items="${groupes}">
				<option value="${groupe.nom}"><c:out value="${groupe.nom}"/></option>
			</c:forEach>
		</select>
		<input name="enlever" type="submit">
	</form>
	
	<br>
	
	<form action="addSousGroupe" method="post" style="border: 1px solid black;">
		<h1>Ajouter un sous-groupe (ok)</h1>
		nom du groupe <input name="nom" type="text"><br>
		groupe parent : 
		<select name="groupes_id">
			<c:forEach var="groupe" items="${groupes}">
				<option value="${groupe.id}"><c:out value="${groupe.nom}"/></option>
			</c:forEach>
		</select>
		<input name="Ajouter" type="submit">
	</form>

	<br>
	
	<form action="deleteSousGroupe" method="post" style="border: 1px solid black;">
		<h1>enlever un sous-groupe</h1>
		<select name="id">
		<c:forEach var="groupe" items="${groupes}">
			<optgroup label="${groupe.nom}">
				<c:forEach var="sousGroupe" items="${sousGroupes}">
					<c:if test="${sousGroupe.groupes_id == groupe.id}">
						<option value="${sousGroupe.id}"><c:out value="${sousGroupe.nom}"/></option>
					</c:if>
				</c:forEach>	
			</optgroup>
		</c:forEach>
		</select>
		<input name="enlever" type="submit">
	</form>
	
	<br>
	
	<form action="attribGroup" method="post" style="border: 1px solid black;">
		<h1>attribuer un élève a un groupe ()ok)</h1>
		<select name="nom">
			<c:forEach var="groupe" items="${groupes}">
				<option><c:out value="${groupe.nom}"/></option>
			</c:forEach>
		</select>
		<input name="nomEleve" type="text">
		<input name="attribuer" type="submit">
	</form>
</body>
</html>