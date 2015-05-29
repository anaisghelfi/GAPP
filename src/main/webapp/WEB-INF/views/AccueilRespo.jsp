<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Accueil responsable</title>

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
                    <a href="#"> <i class="fa fa-search"></i><span class="nav-label">Rechercher</span></a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-calendar"></i><span class="nav-label">Ajouter des deadlines</span></a>
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
                        <li class="active">
                            <strong>Grille de compétences</strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>

        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-6">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Gérer la grille de compétences</h5>
                        </div>
                        <div class="ibox-content">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                Ajouter une famille de compétences
                            </button></br></br>

                            <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog">
                                <div class="modal-content animated bounceInRight">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <i class="fa fa-laptop modal-icon"></i>
                                            <h4 class="modal-title">Ajouter une famille de compétences</h4>
                                           <form method="POST" action="addfamille">
                                             <div class='form-group'>
                                                <label>Nom</label>
                                                <input type='text' name="famille" class='form-control' placeholder='Nom de la famille' />
                                            </div>
                                            <div class='form-group'>
                                                <label>Coefficient</label>
                                                <input type='text' name="coefficient" class='form-control' placeholder='Coefficient' />
                                            </div>
                                        </div>
                                        <div class="modal-body">
                                            <div class='form-group'>
                                                <label>Définition</label>
                                                <textarea class='form-control' placeholder='Définition'></textarea>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-white" data-dismiss="modal">Fermer</button>
                                            <button type="submit" class="btn btn-primary">Sauvegarder</button>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2">
                                Ajouter une compétences
                            </button>
                            <div class="modal inmodal" id="myModal2" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog">
                                <div class="modal-content animated bounceInRight">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <i class="fa fa-laptop modal-icon"></i>
                                            <h4 class="modal-title">Ajouter une compétence</h4>
                                             <form method="POST" action="addcompetence">
                                             <div class='form-group'>
                                                <label>Nom</label>
                                                <input name="sous_competences" type='text' class='form-control' placeholder='Nom de la famille' />
                                            </div>
                                            <div class='form-group'>
                                                <label>Famille</label>
                                                <select name="competences_id" class='form-control' >
                                                    <optgroup label='Familles'>
											 			<c:forEach var="allcompetences" items="${allcompetences}">
															<option value="<c:out value="${allcompetences.id}"/>"><c:out value="${allcompetences.famille}"/></option>
														</c:forEach>
                                                    </optgroup>
                                                </select>
                                            </div>
               
											                                            
                                        </div>
                                        <div class="modal-body">
                                            <div class='form-group'>
                                                <label>Définition</label>
                                                <textarea class='form-control' placeholder='Définition'></textarea>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-white" data-dismiss="modal">Fermer</button>
                                            <button type="submit" class="btn btn-primary">Sauvegarder</button>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            </br>

                            

                            <div class="panel-body">
                                <div class="panel-group" id="accordion">
                                
                                   
                                    <c:forEach var="allcompetences" items="${allcompetences}">
										<div style="margin-bottom:6px" class="panel panel-primary">
											<div class="panel-heading">
	                                            <h5 class="panel-title">
	                                                <a data-toggle="collapse" data-parent="#accordion" href="#<c:out value="${allcompetences.id}"/>"><c:out value="${allcompetences.famille}"/><i style='float:right; margin:5px' class="fa fa-trash"></i><i style='float:right;margin:5px' class="fa fa-pencil"></i></a>
	                                            </h5>
	                                        </div>
										</div>
										
										<div id="<c:out value="${allcompetences.id}"/>" class="panel-collapse collapse in">
                                            <div class="panel-body">
                                                <c:forEach var="allsouscompetences" items="${allsouscompetences}">
                                                <!--  	<li><c:out value="${allsouscompetences.sous_competences}"/>"></li>
                                                </c:forEach> -->
                                       

                                            </div>
                                        </div>
									</c:forEach>
                                                                        


                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Grille de compétences</h5>
                        </div>
                        <div class="ibox-content">
                            <h4>
                                <span class='label label-primary'>Travail en groupe</span>
                                <span class='label label-info'>Communication</span>
                                <span class='label label-success'>Conduite de projet</span>
                            </h4>

                            <table class='table table-bordered'>
                                <thead>
                                    <caption style="background-color: #1AB394;color: #fff;text-align: center;">Travail en groupe</caption>
                                    <tr>
                                        <td>Compétence</td>
                                        <td>Niveau</td>
                                        <td>Observation
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Travailler en équipe</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>B : animer en maintenant la cohésion de l'équipe et un minimum d'intérêt</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>I : et motiver </td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>M : et faire évoluer </td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                        <td>E : et jouer le rôle de leader</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>

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
    <script src="<c:url value="/resources/js/jquery-2.1.1.js" />"></script>
   <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
   <script src="<c:url value="/resources/js/plugins/metisMenu/jquery.metisMenu.js" />"></script>
   <script src="<c:url value="/resources/js/plugins/slimScroll/jquery.slimscroll.min.js" />"></script>

    <!-- Custom and plugin javascript -->
    <script src="<c:url value="/resources/js/GAPP.js" />"></script>
   <script src="<c:url value="/resources/js/plugins/pace/pace.min.js" />"></script>





</body>
</html>