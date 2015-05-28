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
	<form method="post" action="add_deadline">
			<h1>Ajouter une deadline</h1>
                      <input type="text" name="titre" ></br>
                      <input type="text" name="description"></br>  
                      <input type="date" name="date" ></br>
                      <input type="text" name="groupe" value="groupe"></br>
	           <input type="submit" name="valider"/>
	</form>
	
	<form action="delete_deadline" method="post">
		<h1>Supprimer une deadline</h1>
		<select name="titre">
			<c:forEach var="titre" items="${deadlines}">
				<option value="${deadlines.titre}"><c:out value="${deadlines.titre}"/></option>
			</c:forEach>
		</select>
		<input name="enlever" type="submit">
	</form>
	
	
								
	
	
	
</body>
</html>