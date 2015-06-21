
	   <%@ include file="include/haut_de_page.jsp" %>
	
			<div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>Gestion des groupes</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="#">Accueil</a>
                        </li>
                        <li>
                            <a>Tous mes groupes</a>
                        </li>
                        <li class="active">
                            <strong>Groupe <c:out value="${numerogroupe}"/></strong>
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
                    <div style="display:none" id="alert" class="alert alert-danger alert-dismissable">
                    	Veuillez renseignez les absences de tous les élèves du groupe !
                    </div>
 						<table id="tableAsbence" class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Nom</th>
                                    <th>Prénom</th>
                                    <th>Code élève</th>
                                    <th colspan="2">Séance du </th>
                                </tr>
                                <tr>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th><span class="badge badge-primary">Présent</span></th>
                                    <th><span class="badge badge-danger">Absent</span></th>
                                </tr>                                
                                </thead>
                                <tbody>
                               <form  method='POST' action="addAbsences-<c:out value="${numerogroupe}"/>"> 
			                   <c:forEach var="alleleves" items="${alleleves}">
								<tr>	
									<td><c:out value="${alleleves.nom}"/></td>
									<td><c:out value="${alleleves.prenom}"/></td>
									<td><c:out value="${alleleves.code_eleve}"/></td>
									<td><input type="radio" name="absence-<c:out value="${alleleves.id}"/>" value="present"><br></td>
									<td><input type="radio" name="absence-<c:out value="${alleleves.id}"/>" value="absent"><br></td>
								</tr>
								</c:forEach> 	                                


                                </tbody>
                         </table>
                         <div class='col-lg-9'></div>
                         <div class="col-lg-3"><button type="submit" onclick="return validAbsence()" class="btn btn-w-m btn-success btn-sm">Valider</button>
                         </form>
                         </div>
                            
                 
              
                
           			</div>
        </div>  
    </div><!-- fin col lg 6 avec les formulaires -->
                
    <div class="col-lg-4">        
    	<div class="ibox">
        	<div class="ibox-title">
            	<h5>Informations Générales</h5>
            </div>
            <div class="ibox-content">
            	<h4>
					Grille de compétences                          	                         
                </h4> </br>
				
				<button type="submit" data-toggle="modal" data-target="#modalGrille" class="btn btn-w-m btn-success">Remplir la grille de compétences</button>
				</br></br></br>
		
		
		                  <div class="modal inmodal" id="modalGrille" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog">
                                <div class="modal-content animated bounceInRight">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                           
                                            <h4 class="modal-title">Remplir la grille de compétences</h4>
                                          


                                        </div>
                                        
                                        <c:forEach var="allcompetences" items="${allcompetences}">
                                        <h6 class="modal-title"><c:out value="${allcompetences.famille}"/></h6>
				 						<table class="table table-bordered">
				                                <thead>
				                                <tr>
				                                    <th rowspan="2">Compétence</th>
				                                    <th colspan="5">Niveau</th>
				                                    <th rowspan="2">Observation</th>
				                                </tr>   
				                                <tr>
				                                    
				                                    <th class="rotate">Non acquis</th>
				                                    <th class="rotate">En cours</th>
				                                    <th class="rotate">Acquis</th>
				                                    <th class="rotate">En cours d'acquisition</th>
				                                    <th class="rotate">Acquis (ou dépassé)</th>
				                                    
				                                </tr>   				                                
				                                </thead>
				                                <tbody>
							                   
												<c:forEach var="allsouscompetences" items="${allsouscompetences}">
													<c:if test="${allsouscompetences.competences_id == allcompetences.id}">		
													<tr>	
														
														<td class='primary'><c:out value="${allsouscompetences.sous_competences}"/></td>
														<td rowspan="5"><input type="radio" name="groupe-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>"/></td>
														<td rowspan="5"><input type="radio" name="groupe-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>"/></td>
														<td rowspan="5"><input type="radio" name="groupe-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>"/></td>
														<td rowspan="5"><input type="radio" name="groupe-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>"/></td>
														<td rowspan="5"><input type="radio" name="groupe-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>"/></td>
														<td rowspan="5"><textarea style="height:100%;resize:none" name="grouperemarques-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>"></textarea></td>
													</tr>
													<tr>	
														<td>B : <c:out value="${allsouscompetences.getB()}"/></td>

													<tr>	
														<td>I : <c:out value="${allsouscompetences.getI()}"/></td>
	
													</tr>
													<tr>	
														<td><i>M : <c:out value="${allsouscompetences.getM()}"/></i></td>

													</tr>
													<tr>	
														<td><i>E : <c:out value="${allsouscompetences.getE()}"/></i></td>

													</tr>												
													</c:if>
												</c:forEach>										
				
				                                </tbody>
				                         </table>
				                         <button type="submit" class="btn btn-w-m btn-success">Valider la grille du groupe</button>
				                         
				                       <form method="POST" action ="fillCompetenceEleves-<c:out value="${numerogroupe}"/>-<c:out value="${allcompetences.id}"/>">
				                         
				 						<table class="table table-bordered">
				                                <thead>
				                                <tr>
				                                    <th rowspan="2">Compétence</th>
				                                    <th colspan="5">Niveau</th>
				                                    <th rowspan="2">Eleves</th>
				                                </tr>   
				                                <tr>
				                                    
				                                    <th class="rotate">Non acquis</th>
				                                    <th class="rotate">En cours</th>
				                                    <th class="rotate">Acquis</th>
				                                    <th class="rotate">En cours d'acquisition</th>
				                                    <th class="rotate">Acquis (ou dépassé)</th>
				                                    
				                                </tr>   				                                
				                                </thead>
				                                <tbody>
							                   
												<c:forEach var="allsouscompetences" items="${allsouscompetences}">
													<c:if test="${allsouscompetences.competences_id == allcompetences.id}">		
														
															<c:forEach var="alleleves" items="${alleleves}">
															<tr>
															<c:set var="count" value="0" scope="page" />
															 
															<c:if test="${count == 0}">
																<td class='primary'><c:out value="${allsouscompetences.sous_competences}"/> <c:out value="${count}"/></td>
															</c:if>
															<c:if test="${count == 1} ">
																<td>B : <c:out value="${allsouscompetences.getB()}"/></td>
															</c:if>
															<c:if test="${count == 2}">
																<td>I : <c:out value="${allsouscompetences.getI()}"/></td>
															</c:if>
															<c:if test="${count == 3}">
																<td><i>M : <c:out value="${allsouscompetences.getM()}"/></i></td>
															</c:if>		
															<c:if test="${count == 4}">
																<td colspan="2"><i>E : <c:out value="${allsouscompetences.getE()}"/></i></td>
															</c:if>		
															<c:set var="count" value="${1+count}" scope="page"/>											
															<td><input type="radio" name="groupe-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>-<c:out value="${alleleves.id}"/>"/></td>
															<td><input type="radio" name="groupe-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>-<c:out value="${alleleves.id}"/>"/></td>
															<td><input type="radio" name="groupe-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>-<c:out value="${alleleves.id}"/>"/></td>
															<td><input type="radio" name="groupe-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>-<c:out value="${alleleves.id}"/>"/></td>
															<td><input type="radio" name="groupe-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>-<c:out value="${alleleves.id}"/>"/></td>
															<td><c:out value="${alleleves.prenom}"/> <c:out value="${alleleves.nom}"/></td>
															
															</tr>
															</c:forEach>
													
											
													</c:if>
												</c:forEach>										
				
				                                </tbody>
				                         </table>	
				                         
				                         <button type="submit" class="btn btn-w-m btn-success">Valider la grille des élèves</button>			                         
				                         </form>
				                         </c:forEach>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-white" data-dismiss="modal">Fermer</button>
                                            <button type="submit" class="btn btn-primary">Sauvegarder</button>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
		
		
		
            	<h4>
					Remarques générales sur le groupe                          	                         
                </h4> </br>
                
                <textarea style="width: 100%; height: 100px"></textarea>
                
                <button type="submit" class="btn btn-w-m btn-success btn-xs">Soumettre</button>
             </div>
       </div>
                
  	</div> <!-- Fin du 2e col lg 4 -->          
  </div>
</div>
                

        
	<%@ include file="include/bas_de_page.jsp" %>
	
<script>//-----Fiche élèves par le tuteur

//Vérifier que les input radio sont tous checks

function validAbsence() {
	var input = $( "#tableAsbence input:radio" );
	var nameTab = [];
	var bool = true;
	for(var i=0; i<input.length;i++) {
		var name = $(input[i]).attr('name');
		if(name !== nameTab[nameTab.length-1]) {
			nameTab.push(name);
		}		
	}
	
	
	
	for(j=0;j<nameTab.length;j++) {
		console.log(nameTab[j]);
		var value = $( "[name='"+nameTab[j]+"']:checked").val();
		if (value === undefined){
			bool = false;
			$("#alert").show(200);
		}
	}
	
	return bool;
}</script>
	
