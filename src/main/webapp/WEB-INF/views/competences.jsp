<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ajouter une compétence</title>
</head>
<body>

	<form method="post" action="addcompetences">
		<input name="famille" placeholder="Nom de la famille" type="text"/>
		<input type="text" placeholder="Coefficient" name="coefficient"/>
		<input type="submit" name="valider"/>
	</form>
	 

	 <c:forEach var="co" items="${competences}"> 
          ${co.value.famille}
          ${co.value.coefficient}
        </c:forEach>

</body>
</html>

