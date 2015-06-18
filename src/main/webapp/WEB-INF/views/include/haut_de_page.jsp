<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>GAPP</title>

	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" media="screen" />
	<link href="<c:url value="/resources/fonts/css/font-awesome.css" />" rel="stylesheet" type="text/css" media="screen" />
    <!-- Toastr style -->
    <link href="<c:url value="/resources/css/plugins/toastr/toastr.min.css" />" rel="stylesheet" type="text/css" media="screen" />
    <link href="<c:url value="/resources/css/plugins/jsTree/style.min.css" />" rel="stylesheet" type="text/css" media="screen" />
    <link href="<c:url value="/resources/css/animate.css" />" rel="stylesheet" type="text/css" media="screen" />
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" type="text/css" media="screen" />
    <link href="<c:url value="/resources/css/fullcalendar.css" />" rel="stylesheet" type="text/css" media="screen" />
   

</head>

<body>

    <div id="wrapper">

    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                           <!--  <img alt="image" class="img-circle" src="img/profile_small.jpg" />-->
                             </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold"><c:out value='${sessionScope.prenom} ' /><c:out value='${ sessionScope.nom}'/></strong>
                             </span> <span class="text-muted text-xs block"><c:out value='${sessionScope.type }'/><b class="caret"></b></span> </span> </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="ficheEleve?nom=${sessionScope.nom}">Profil</a></li>
                            <li class="divider"></li>
                            <li><a href="deconnexion">Déconnexion</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        GAPP
                    </div>
                </li>
                <li>
                    <a href="#"> <i class="fa fa-table"></i><span class="nav-label">Grille de compétences</span> </a>
                </li>
                <li>
                    <a href="rechercheEleves"> <i class="fa fa-search"></i><span class="nav-label">Rechercher</span></a>
                </li>
                <li>
                    <a href="ajoutDeadline"><i class="fa fa-calendar"></i><span class="nav-label">Ajouter des deadlines</span></a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-user"></i> <span class="nav-label">Attribuer les rôles </span></a>
                </li>
                <li>
                    <a href="attribGroupe"> <i class="fa fa-users"></i><span class="nav-label">Attribuer les groupes</span> </a>
                </li>

            </ul>

        </div>
    </nav>

        <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
            <form role="search" class="navbar-form-custom" action="search_results.html">
                <div class="form-group">
                        <h4 style="margin-top:20px; margin-left:15px">Bienvenue sur GAPP.</h4>
                   
                </div>
            </form>
        </div>
            <ul class="nav navbar-top-links navbar-right">
                <li>
                    <a href="deconnexion">
                        <i class="fa fa-sign-out"></i> Déconnexion
                    </a>
                </li>
            </ul>

        </nav>
        </div>
