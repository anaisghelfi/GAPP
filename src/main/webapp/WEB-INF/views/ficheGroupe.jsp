
	   <%@ include file="include/haut_de_page.jsp" %>
	
			<div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>Gestion des groupes</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="#">Accueil</a>
                        </li>
                        <li>
                            <a>Tous les groupes</a>
                        </li>
                        <li class="active">
                            <strong>Groupe </strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>
	
	<div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">

                <div class="col-lg-8"><!-- Mettre dans cette col les boutons vers formulaire ajouts groupes, attribution des élèves, et liste des groupes, sous-groupes avec bouton pour supprimer -->               
                <div class="ibox">
                	<div class="ibox-title">
                    	<h5>Elèves du groupe</h5>
                    </div>
                    <div class="ibox-content">
						test
                 
              
                
           			</div>
        </div>  
    </div><!-- fin col lg 6 avec les formulaires -->
                
    <div class="col-lg-4">        
    	<div class="ibox">
        	<div class="ibox-title">
            	<h5>Visualisation des Groupes</h5>
            </div>
            <div class="ibox-content">
            	<h4>
                	<c:forEach var="groupe" items="${groupes}">
                    <span class='label label-primary'><c:out value="${groupe.nom}"/></span>
                    </c:forEach>                            	                         
                </h4> 
					<c:forEach var="sousGroupe" items="${sousGroupes}">
                    <table class="table table-bordered">
                    	<thead>
                        	<caption style="background-color: #1AB394;color: #fff;text-align: center;"><c:out value="${sousGroupe.nom}"></c:out></caption>
	                        <tr>
	                        	<th>Nom</th>
	                            <th>Prénom</th>
	                            <th>Mail</th>
	                            <th>Note</th>
	                        </tr>
                        </thead>
                                <!-- Faire un foreach avec les élèves dans le groupe -->
                        <tbody>
                        	<c:forEach var="eleve" items="${eleves}">
                            	<c:if test="eleve.groupe == sousGroupe.nom">
	                            <tr>
	                               <td><c:out value="${eleve.nom}"></c:out></td>
	                               <td><c:out value="${eleve.prenom}"></c:out></td>
	                               <td><c:out value="${eleve.mail}"></c:out></td>
	                               <td><c:out value="${eleve.note}"></c:out></td>
	                            </tr>
	                            </c:if>
	                         </c:forEach>
                         </tbody>
                      </table>
                      </c:forEach>
                                
                              
                            

                        </div>
                    </div>
                
                </div> <!-- Fin du 2e col lg 6 -->          
            </div>
        </div>
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                


           
	
	<%@ include file="include/bas_de_page.jsp" %>
	