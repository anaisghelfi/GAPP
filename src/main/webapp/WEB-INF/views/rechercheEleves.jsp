<%@ include file="include/haut_de_page.jsp" %>


            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>Recherche un élève</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="#">Accueil</a>
                        </li>
                        <li class="active">
                            <strong>Recherche un élève</strong>
                        </li>
                    </ol>
                </div>
                
            </div>

        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
            
				<div class="col-lg-6">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Rechercher un élève</h5>
                        </div>
	                    <div class="ibox-content">	
							<form method="post" action="rechercheEleves">
								<div class="form-group">
								 	<label>Accéder à la fiche élève :</label> 
								  	<input type="text" name="nom" class="form-control" >
								</div>
					
								<div class="form-group">
								  	<button class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit" name="valider"><strong>Valider</strong></button>  	
								</div>
						
							</form>
						</div>
						<div>
							<c:forEach var="eleve" items="${eleves}">
								<div class="form-group">
									<strong>Eleve :</strong> <c:out value="${eleve.nom}"/> <c:out value="${eleve.prenom}"/>
									<a href="http://localhost:8080/gapp/ficheEleve?nom=<c:out value="${eleve.nom}"/>">Voir sa fiche</a>
								</div>
							</c:forEach>														
	                    </div>
                    </div>
                </div>
			
			
			
					<div class="col-lg-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Trouver un groupe d'APP <small>avec ses sous-groupes associés</small></h5>
                    
                </div>
                <div class="ibox-content">

                    <div id="jstree1">
                        <ul>
                            <li class="jstree-open">Groupe d'APP 
                                <ul>
                         
	                                <c:forEach var="groupe" items="${groupes}">
	                                	<li> <c:out value="${groupe.nom}"/>
	                                
			                                <ul>
				                                <c:forEach var="sousGroupe" items="${sousGroupes}">
													<c:if test="${sousGroupe.groupes_id == groupe.id}">
														<li data-jstree='{"type":"css"}'>
															<a href="ficheGroupe/${sousGroupe.nom}"><c:out value="${sousGroupe.nom}"/></a>
														</li>
													</c:if>
												</c:forEach> 
			                                </ul>
	                                
										</li>
									</c:forEach>
                                

	                                </ul>
	                            </li>
	                        </ul>
	                    </div>
	
		                </div>
		            </div>
		        </div>
		        
		        <c:if test="${afficheBouton == true }">
		        <div id="BoutonEvalCroiseeTuteur" class="col-lg-6">
		        	<div class="ibox">
                        <div class="ibox-title">
                        	<h5>Autoriser l'évaluation croisée</h5>
                        </div>
                        <div class="ibox-content">
                        	<button type="button" class="btn btn-info" id="AutoriseEvalCroisee">Autoriser</button>
                        </div>
                    </div>
		        </div>
		        </c:if>
			              
                </div>
            </div>


       
       
<%@ include file="include/bas_de_page.jsp" %>

<style>
    .jstree-open > .jstree-anchor > .fa-folder:before {
        content: "\f07c";
    }

    .jstree-default .jstree-icon.none {
        width: 0;
    }
</style>

<script>
    $(document).ready(function(){

        $('#jstree1').jstree({
            'core' : {
                'check_callback' : true
            },
            'plugins' : [ 'types', 'dnd' ],
            'types' : {
                'default' : {
                    'icon' : 'fa fa-folder'
                },
                'html' : {
                    'icon' : 'fa fa-file-code-o'
                },
                'svg' : {
                    'icon' : 'fa fa-file-picture-o'
                },
                'css' : {
                    'icon' : 'fa fa-file-code-o'
                },
                'img' : {
                    'icon' : 'fa fa-file-image-o'
                },
                'js' : {
                    'icon' : 'fa fa-file-text-o'
                }

            }
        });

        $('#using_json').jstree({ 'core' : {
            'data' : [
                'Empty Folder',
                {
                    'text': 'Resources',
                    'state': {
                        'opened': true
                    },
                    'children': [
                        {
                            'text': 'css',
                            'children': [
                                {
                                    'text': 'animate.css', 'icon': 'none'
                                },
                                {
                                    'text': 'bootstrap.css', 'icon': 'none'
                                },
                                {
                                    'text': 'main.css', 'icon': 'none'
                                },
                                {
                                    'text': 'style.css', 'icon': 'none'
                                }
                            ],
                            'state': {
                                'opened': true
                            }
                        },
                        {
                            'text': 'js',
                            'children': [
                                {
                                    'text': 'bootstrap.js', 'icon': 'none'
                                },
                                {
                                    'text': 'inspinia.min.js', 'icon': 'none'
                                },
                                {
                                    'text': 'jquery.min.js', 'icon': 'none'
                                },
                                {
                                    'text': 'jsTree.min.js', 'icon': 'none'
                                },
                                {
                                    'text': 'custom.min.js', 'icon': 'none'
                                }
                            ],
                            'state': {
                                'opened': true
                            }
                        },
                        {
                            'text': 'html',
                            'children': [
                                {
                                    'text': 'layout.html', 'icon': 'none'
                                },
                                {
                                    'text': 'navigation.html', 'icon': 'none'
                                },
                                {
                                    'text': 'navbar.html', 'icon': 'none'
                                },
                                {
                                    'text': 'footer.html', 'icon': 'none'
                                },
                                {
                                    'text': 'sidebar.html', 'icon': 'none'
                                }
                            ],
                            'state': {
                                'opened': true
                            }
                        }
                    ]
                },
                'Fonts',
                'Images',
                'Scripts',
                'Templates',
            ]
        } });

    });
</script>