<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Recherche</title>

	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" media="screen" />
	<link href="<c:url value="/resources/fonts/css/font-awesome.css" />" rel="stylesheet" type="text/css" media="screen" />
    <!-- Toastr style -->
    <link href="<c:url value="/resources/css/plugins/toastr/toastr.min.css" />" rel="stylesheet" type="text/css" media="screen" />
    <link href="<c:url value="/resources/css/animate.css" />" rel="stylesheet" type="text/css" media="screen" />
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" type="text/css" media="screen" />

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
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">Matthieu Manceny</strong>
                             </span> <span class="text-muted text-xs block">Responsable d'APP <b class="caret"></b></span> </span> </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="profile.html">Profil</a></li>
                            <li class="divider"></li>
                            <li><a href="login.html">Déconnexion</a></li>
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
                    <a href="rechercher.html"> <i class="fa fa-search"></i><span class="nav-label">Rechercher</span></a>
                </li>
                <li>
                    <a href="ajout_deadline.jsp"><i class="fa fa-calendar"></i><span class="nav-label">Ajouter des deadlines</span></a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-user"></i> <span class="nav-label">Attribuer les rôles </span></a>
                </li>
                <li>
                    <a href="#"> <i class="fa fa-users"></i><span class="nav-label">Attribuer les groupes</span> </a>
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
                    <a href="login.html">
                        <i class="fa fa-sign-out"></i> Déconnexion
                    </a>
                </li>
            </ul>

        </nav>
        </div>
            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>Grille de compétences</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="#">Accueil</a>
                        </li>
                        <li>
                            <a>Test fil</a>
                        </li>
                        <li class="active">
                            <strong>Ajouter une deadline</strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>

        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
			
			
			<div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Ajout d'une deadline</h5>
                        </div>
                        <div class="ibox-content">
						
						
	<c:forEach var="deadline" items="${deadlines}">
							Titre : <c:out value="${deadline.titre}"/> 
							Description : <c:out value="${deadline.description}"/>
							Date limite : <c:out value="${deadline.date_limite}"/>
							Groupe concerné : <c:out value="${deadline.groupes_id}"/> </br>
						</c:forEach>
						
						
                        </div>
                    </div>
                </div>
			
			
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Ajout d'une deadline</h5>
                        </div>
                        <div class="ibox-content">
						
						
						<h2>Voir les Deadlines</h2> 
	
						
						</br>
                            <h4>Ajouter une deadline</h4>
                            <p>
                            	<form method="post" action="add_deadline">
								  Titre : <input type="text" name="titre" >
								  Description : <input type="text" name="description">  
								  Date : <input type="date" name="date_limite" >
								  Groupe :<input type="text" name="groupes_id">
										<input type="submit" name="valider"/>
								</form>
                            </p>

                        </div>
                    </div>
                </div>
              
				
			  
			  
            </div>


        </div>
        <div class="footer">
            <div class="pull-right">
                Projet <strong>GAPP</strong> ISEP.
            </div>
            <div>
                <strong>Copyright</strong> Equipe "rouge vif" &copy; 2015
            </div>
        </div>

        </div>
        </div>



    <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="js/GAPP.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>

</body>


</html>

