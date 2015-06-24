
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
                                    <th colspan="2">
                                    <c:if test="${nombreseance != 0}">
                                    	<c:forEach var="numeroseance" items="${numeroseance}">
                                    		Séance <c:out value="${numeroseance.numero_seance}"/>
                                    	</c:forEach>
                                    </c:if>
                                    <c:if test="${nombreseance == 0}">
                                     	Pas de séances en cours
                                    </c:if>
                                   </th>
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
									<c:if test="${nombreseance2 != 0}">
									
									
									                		
						<!-- 			                		On met un bouton radio différent pour chaque compétences et niveau (name) -->
						
																		<c:set var="radio_pas_coche" value="true" scope="page" />
						<!-- 											On regarde toutes les evaluations croisees pour voir si elle a deja été remplit -->
																		<c:forEach var="allabsences" items="${allabsences}">													
						<!-- 												On met un radio coché si il a deja été enregistré en base de données	-->												 
																				<c:if test="${allabsences.eleves_id == alleleves.id && allabsences.abscencescol == 'present'}">
																						<td><input type="radio" name="absence-<c:out value="${alleleves.id}"/>" value="present" checked><br></td>
																						<td><input type="radio" name="absence-<c:out value="${alleleves.id}"/>" value="absent"><br></td>

																							
																					<c:set var="radio_pas_coche" value="false" scope="page" />
																				</c:if>
																				<c:if test="${allabsences.eleves_id == alleleves.id && allabsences.abscencescol == 'absent'}">
																				
																						<td><input type="radio" name="absence-<c:out value="${alleleves.id}"/>" value="present"><br></td>
																						<td><input type="radio" name="absence-<c:out value="${alleleves.id}"/>" value="absent" checked><br></td>

																						
																					<c:set var="radio_pas_coche" value="false" scope="page" />
																				</c:if>			
																											
																		</c:forEach>
																		<c:if test="${radio_pas_coche == true}">
																			<td><input type="radio" name="absence-<c:out value="${alleleves.id}"/>" value="present"><br></td>
																			<td><input type="radio" name="absence-<c:out value="${alleleves.id}"/>" value="absent"><br></td>
																		</c:if>
									
									

									</c:if>
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
                                          
				                            <h4>
				                            	<c:forEach var="allcompetences" items="${allcompetences}">
				                                	<span style="cursor:pointer" name="showGrille-<c:out value="${allcompetences.id}"/>" class='label label-primary'><c:out value="${allcompetences.famille}"/></span>
				                            	</c:forEach>
				                            </h4>

                                        </div>
                                        
                                        <c:forEach var="allcompetences" items="${allcompetences}">
                                        <div name="grille-<c:out value="${allcompetences.id}"/>">
                                        <h6 style='text-align:center' class="modal-title"><c:out value="${allcompetences.famille}"/> <i style="cursor:pointer;" style='color:rgb(199, 199, 199)' name="showgrilleGroupe-<c:out value="${allcompetences.id}"/>" class="fa fa-users"></i> <i style="cursor:pointer"  name="showgrilleEleve-<c:out value="${allcompetences.id}"/>" class="fa fa-user"></i> </h6>
				 						
				 						<div id="grille-groupe-<c:out value="${allcompetences.id}"/>">
				 						<form method="POST" action ="addGrilleG-<c:out value="${numerogroupe}"/>-<c:out value="${allcompetences.id}"/>">
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
		
													
															<c:forEach begin="1" end="6" var="j">
									                		
						<!-- 			                			On met un bouton radio différent pour chaque compétences et niveau (name) -->
									                			<c:choose>
						
																	<c:when test="${j == 1}">
																		<c:set var="radio_pas_coche" value="true" scope="page" />
						<!-- 											On regarde toutes les evaluations croisees pour voir si elle a deja été remplit -->
																		<c:forEach var="notecompetencesgroupe" items="${notecompetencesgroupe}">													
						<!-- 												On met un radio coché si il a deja été enregistré en base de données	-->												 
																				<c:if test="${notecompetencesgroupe.competences_id == allcompetences.id && notecompetencesgroupe.groupe == numerogroupe && notecompetencesgroupe.sous_competences_id == allsouscompetences.id && notecompetencesgroupe.niveaux_competences_id == 1}">
																					<td rowspan="5"><input type="radio" name="groupe-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>" value="1" checked="checked"></td>
																					<c:set var="radio_pas_coche" value="false" scope="page" />
																				</c:if>
																		</c:forEach>
																		<c:if test="${radio_pas_coche == true}">
																			<td rowspan="5"><input type="radio" name="groupe-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>" value="1"></td>
																		</c:if>
																	</c:when>
																	
																	<c:when test="${j == 2}">
																		<c:set var="radio_pas_coche" value="true" scope="page" />
						<!-- 											On regarde toutes les evaluations croisees pour voir si elle a deja été remplit -->
																		<c:forEach var="notecompetencesgroupe" items="${notecompetencesgroupe}">													
						<!-- 												On met un radio coché si il a deja été enregistré en base de données	-->												 
																				<c:if test="${notecompetencesgroupe.competences_id == allcompetences.id && notecompetencesgroupe.groupe == numerogroupe && notecompetencesgroupe.sous_competences_id == allsouscompetences.id && notecompetencesgroupe.niveaux_competences_id == 2}">
																					<td rowspan="5"><input type="radio" name="groupe-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>" value="2" checked="checked"></td>
																					<c:set var="radio_pas_coche" value="false" scope="page" />
																				</c:if>
																		</c:forEach>
																		<c:if test="${radio_pas_coche == true}">
																			<td rowspan="5"><input type="radio" name="groupe-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>" value="2"></td>
																		</c:if>
																	</c:when>
																	
																	<c:when test="${j == 3}">
																		<c:set var="radio_pas_coche" value="true" scope="page" />
						<!-- 											On regarde toutes les evaluations croisees pour voir si elle a deja été remplit -->
																		<c:forEach var="notecompetencesgroupe" items="${notecompetencesgroupe}">													
						<!-- 												On met un radio coché si il a deja été enregistré en base de données	-->												 
																				<c:if test="${notecompetencesgroupe.competences_id == allcompetences.id && notecompetencesgroupe.groupe == numerogroupe && notecompetencesgroupe.sous_competences_id == allsouscompetences.id && notecompetencesgroupe.niveaux_competences_id == 3}">
																					<td rowspan="5"><input type="radio" name="groupe-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>" value="3" checked="checked"></td>
																					<c:set var="radio_pas_coche" value="false" scope="page" />
																				</c:if>
																		</c:forEach>
																		<c:if test="${radio_pas_coche == true}">
																			<td rowspan="5"><input type="radio" name="groupe-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>" value="3"></td>
																		</c:if>
																	</c:when>
																	
																	<c:when test="${j == 4}">
																		<c:set var="radio_pas_coche" value="true" scope="page" />
						<!-- 											On regarde toutes les evaluations croisees pour voir si elle a deja été remplit -->
																		<c:forEach var="notecompetencesgroupe" items="${notecompetencesgroupe}">													
						<!-- 												On met un radio coché si il a deja été enregistré en base de données	-->												 
																				<c:if test="${notecompetencesgroupe.competences_id == allcompetences.id && notecompetencesgroupe.groupe == numerogroupe && notecompetencesgroupe.sous_competences_id == allsouscompetences.id && notecompetencesgroupe.niveaux_competences_id == 4}">
																					<td rowspan="5"><input type="radio" name="groupe-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>" value="4" checked="checked"></td>
																					<c:set var="radio_pas_coche" value="false" scope="page" />
																				</c:if>
																		</c:forEach>
																		<c:if test="${radio_pas_coche == true}">
																			<td rowspan="5"><input type="radio" name="groupe-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>" value="4"></td>
																		</c:if>
																	</c:when>
																	
																	<c:when test="${j == 5}">
																		<c:set var="radio_pas_coche" value="true" scope="page" />
						<!-- 											On regarde toutes les evaluations croisees pour voir si elle a deja été remplit -->
																		<c:forEach var="notecompetencesgroupe" items="${notecompetencesgroupe}">													
						<!-- 												On met un radio coché si il a deja été enregistré en base de données	-->												 
																				<c:if test="${notecompetencesgroupe.competences_id == allcompetences.id && notecompetencesgroupe.groupe == numerogroupe && notecompetencesgroupe.sous_competences_id == allsouscompetences.id && notecompetencesgroupe.niveaux_competences_id == 5}">
																					<td rowspan="5"><input type="radio" name="groupe-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>" value="5" checked="checked"></td>
																					<c:set var="radio_pas_coche" value="false" scope="page" />
																				</c:if>
																		</c:forEach>
																		<c:if test="${radio_pas_coche == true}">
																			<td rowspan="5"><input type="radio" name="groupe-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>" value="5"></td>
																		</c:if>
																	</c:when>																					

																	
																	<c:when test="${j == 6}">
																		<c:set var="radio_pas_coche" value="true" scope="page" />
						<!-- 											On regarde toutes les evaluations croisees pour voir si elle a deja été remplit -->
																		<c:forEach var="notecompetencesgroupe" items="${notecompetencesgroupe}">													
						<!-- 												On met un radio coché si il a deja été enregistré en base de données	-->												 
																				<c:if test="${notecompetencesgroupe.competences_id == allcompetences.id && notecompetencesgroupe.groupe == numerogroupe && notecompetencesgroupe.sous_competences_id == allsouscompetences.id}">
																					<td rowspan="5"><textarea style="height:100%;resize:none"  name="grouperemarques-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>"><c:out value="${notecompetencesgroupe.remarques}"/></textarea></td>
																					<c:set var="radio_pas_coche" value="false" scope="page" />
																				</c:if>
																		</c:forEach>
																		<c:if test="${radio_pas_coche == true}">
																			<td rowspan="5"><textarea style="height:100%;resize:none" name="grouperemarques-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>"></textarea></td>
																		</c:if>
																	</c:when>																																	
																</c:choose>
													
									             			</c:forEach>													
													
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
				                         </form>
				                         </div>
				                         
				                       <form method="POST" action ="addGrilleE-<c:out value="${numerogroupe}"/>-<c:out value="${allcompetences.id}"/>">
				                         <div style="display:none" id="grille-eleves-<c:out value="${allcompetences.id}"/>">
				 						<table class="table table-bordered">
				                                <thead>
				                                <tr>
				                                    <th rowspan="2">Compétence</th>
				                                    <th colspan="5">Niveau</th>
				                                    <th rowspan="2">Eleves</th>
				                                    <th style="word-break:	break-word;width=15%" rowspan="2">Remarques</th>
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
														
															<c:forEach var="alleleves" items="${alleleves}" varStatus="loop">
															<tr>
															 
															<c:if test="${loop.index == 0}">
																<td class='primary'><c:out value="${allsouscompetences.sous_competences}"/> </td>
															</c:if>
															<c:if test="${loop.index == 1}">
																<td>B : <c:out value="${allsouscompetences.getB()}"/></td>
															</c:if>															
															<c:if test="${loop.index == 2}">
																<td>I : <c:out value="${allsouscompetences.getI()}"/></td>
															</c:if>
															<c:if test="${loop.index == 3}">
																<td><i>M : <c:out value="${allsouscompetences.getM()}"/></i></td>
															</c:if>		
															<c:if test="${loop.index == 4}">
															
																<td rowspan="2"><i>E : <c:out value="${allsouscompetences.getE()}"/></i></td>
															</c:if>	
															
																
																
																
															<c:forEach begin="1" end="7" var="j">
									                		
						<!-- 			                			On met un bouton radio différent pour chaque compétences et niveau (name) -->
									                			<c:choose>
						
																	<c:when test="${j == 1}">
																		<c:set var="radio_pas_coche" value="true" scope="page" />
						<!-- 											On regarde toutes les evaluations croisees pour voir si elle a deja été remplit -->
																		<c:forEach var="notecompetences" items="${notecompetences}">													
						<!-- 												On met un radio coché si il a deja été enregistré en base de données	-->												 
																				<c:if test="${notecompetences.competences_id == allcompetences.id && notecompetences.eleves_id == alleleves.id && notecompetences.sous_competences_id == allsouscompetences.id && notecompetences.niveaux_competences_id == 1}">
																					<td><input type="radio" name="eleve-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>-<c:out value="${alleleves.id}"/>" value="1" checked="checked"></td>
																					<c:set var="radio_pas_coche" value="false" scope="page" />
																				</c:if>
																		</c:forEach>
																		<c:if test="${radio_pas_coche == true}">
																			<td><input type="radio" name="eleve-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>-<c:out value="${alleleves.id}"/>" value="1"></td>
																		</c:if>
																	</c:when>
																	
																	<c:when test="${j == 2}">
																		<c:set var="radio_pas_coche" value="true" scope="page" />
						<!-- 											On regarde toutes les evaluations croisees pour voir si elle a deja été remplit -->
																		<c:forEach var="notecompetences" items="${notecompetences}">													
						<!-- 												On met un radio coché si il a deja été enregistré en base de données	-->												 
																				<c:if test="${notecompetences.competences_id == allcompetences.id && notecompetences.eleves_id == alleleves.id && notecompetences.sous_competences_id == allsouscompetences.id && notecompetences.niveaux_competences_id == 2}">
																					<td><input type="radio" name="eleve-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>-<c:out value="${alleleves.id}"/>" value="2" checked="checked"></td>
																					<c:set var="radio_pas_coche" value="false" scope="page" />
																				</c:if>
																		</c:forEach>
																		<c:if test="${radio_pas_coche == true}">
																			<td><input type="radio" name="eleve-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>-<c:out value="${alleleves.id}"/>" value="2"></td>
																		</c:if>
																	</c:when>
																	
																	<c:when test="${j == 3}">
																		<c:set var="radio_pas_coche" value="true" scope="page" />
						<!-- 											On regarde toutes les evaluations croisees pour voir si elle a deja été remplit -->
																		<c:forEach var="notecompetences" items="${notecompetences}">													
						<!-- 												On met un radio coché si il a deja été enregistré en base de données	-->												 
																				<c:if test="${notecompetences.competences_id == allcompetences.id && notecompetences.eleves_id == alleleves.id && notecompetences.sous_competences_id == allsouscompetences.id && notecompetences.niveaux_competences_id == 3}">
																					<td><input type="radio" name="eleve-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>-<c:out value="${alleleves.id}"/>" value="3" checked="checked"></td>
																					<c:set var="radio_pas_coche" value="false" scope="page" />
																				</c:if>
																		</c:forEach>
																		<c:if test="${radio_pas_coche == true}">
																			<td><input type="radio" name="eleve-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>-<c:out value="${alleleves.id}"/>" value="3"></td>
																		</c:if>
																	</c:when>
																	
																	<c:when test="${j == 4}">
																		<c:set var="radio_pas_coche" value="true" scope="page" />
						<!-- 											On regarde toutes les evaluations croisees pour voir si elle a deja été remplit -->
																		<c:forEach var="notecompetences" items="${notecompetences}">													
						<!-- 												On met un radio coché si il a deja été enregistré en base de données	-->												 
																				<c:if test="${notecompetences.competences_id == allcompetences.id && notecompetences.eleves_id == alleleves.id && notecompetences.sous_competences_id == allsouscompetences.id && notecompetences.niveaux_competences_id == 4}">
																					<td><input type="radio" name="eleve-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>-<c:out value="${alleleves.id}"/>" value="4" checked="checked"></td>
																					<c:set var="radio_pas_coche" value="false" scope="page" />
																				</c:if>
																		</c:forEach>
																		<c:if test="${radio_pas_coche == true}">
																			<td><input type="radio" name="eleve-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>-<c:out value="${alleleves.id}"/>" value="4"></td>
																		</c:if>
																	</c:when>
																	
																	<c:when test="${j == 5}">
																		<c:set var="radio_pas_coche" value="true" scope="page" />
						<!-- 											On regarde toutes les evaluations croisees pour voir si elle a deja été remplit -->
																		<c:forEach var="notecompetences" items="${notecompetences}">													
						<!-- 												On met un radio coché si il a deja été enregistré en base de données	-->												 
																				<c:if test="${notecompetences.competences_id == allcompetences.id && notecompetences.eleves_id == alleleves.id && notecompetences.sous_competences_id == allsouscompetences.id && notecompetences.niveaux_competences_id == 5}">
																					<td><input type="radio" name="eleve-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>-<c:out value="${alleleves.id}"/>" value="5" checked="checked"></td>
																					<c:set var="radio_pas_coche" value="false" scope="page" />
																				</c:if>
																		</c:forEach>
																		<c:if test="${radio_pas_coche == true}">
																			<td><input type="radio" name="eleve-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>-<c:out value="${alleleves.id}"/>" value="5"></td>
																		</c:if>
																	</c:when>																						
																	
																	<c:when test="${j == 6}">
																			<td><c:out value="${alleleves.prenom}"/> <c:out value="${alleleves.nom}"/></td>
																	</c:when>		
																	
																	<c:when test="${j == 7}">
																		<c:set var="radio_pas_coche" value="true" scope="page" />
						<!-- 											On regarde toutes les evaluations croisees pour voir si elle a deja été remplit -->
																		<c:forEach var="notecompetences" items="${notecompetences}">													
						<!-- 												On met un radio coché si il a deja été enregistré en base de données	-->												 
																				<c:if test="${notecompetences.competences_id == allcompetences.id && notecompetences.eleves_id == alleleves.id && notecompetences.sous_competences_id == allsouscompetences.id}">
																					<td><textarea style="height:100%;resize:none" name="eleveremarques-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>-<c:out value="${alleleves.id}"/>"><c:out value="${notecompetences.remarques}"/></textarea></td>
																					<c:set var="radio_pas_coche" value="false" scope="page" />
																				</c:if>
																		</c:forEach>
																		<c:if test="${radio_pas_coche == true}">
																			<td><textarea style="height:100%;resize:none" name="eleveremarques-<c:out value="${allcompetences.id}"/>-<c:out value="${allsouscompetences.id}"/>-<c:out value="${alleleves.id}"/>"></textarea></td>
																		</c:if>
																	</c:when>																																	
																</c:choose>
													
									             			</c:forEach>
																
															
							
															</tr>
															</c:forEach>
													
											
													</c:if>
												</c:forEach>										
				
				                                </tbody>
				                         </table>	
				                         
				                         <button type="submit" class="btn btn-w-m btn-success">Valider la grille des élèves</button>			                         
				                         </div>
				                         </form>
				                         </div>
				                         </c:forEach>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-white" data-dismiss="modal">Fermer</button>
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
}

//Afficher que la grille N°1
$(document).ready(function(){
	 var span  = $("[name^='grille-']");
	 for(var i =1; i<span.length;i++) {
		 $(span[i]).hide();
	 }
	 
	$("[name^='souscompgrille-']").hide();
	$("li[name^='geredisplay-']").hide();
 });

 


</script>
	
