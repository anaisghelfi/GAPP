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
								<button class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit" name="valider"><strong>Valider</strong></button>
							</form>
							
							
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
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Rechercher un groupe d'APP</h5>
                        </div>
                        	<div class="ibox-content">
                            
                            	
                       			<div class='form-group'>
                                     <label>Accéder à un sous-groupe d'APP</label>
                                     
 									<select name="id" class="form-control">
 										<c:forEach var="groupe" items="${groupes}">
 										<optgroup label="${groupe.nom}">
 											<c:forEach var="sousGroupe" items="${sousGroupes}">
 												<c:if test="${sousGroupe.groupes_id == groupe.id}">
 													<option value="http://localhost:8080/gapp/ficheGroupe?=<c:out value="${sousGroupe.nom}"/>" ><c:out value="${sousGroupe.nom}"/></option>
 												</c:if> 												
 											</c:forEach>
 										</optgroup>
 										</c:forEach>
 									</select>
 								</div>
								
                       	 </div>
                    </div>
                </div>
                
              
            </div>


        </div>
       
       
<%@ include file="include/bas_de_page.jsp" %>