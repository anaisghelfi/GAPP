
	   <%@ include file="include/haut_de_page.jsp" %>
	
			<div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>Gestion des groupes</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="#">Accueil</a>
                        </li>
                        <li>
                            <a>Test fil</a>
                        </li>
                        <li class="active">
                            <strong>Gestion des groupes</strong>
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
                            <h5>Gérer les groupes d'APP</h5>
                        </div>
                        <div class="ibox-content">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                Ajouter un groupe d'APP
                            </button><br/><br/>

                            <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog">
                                <div class="modal-content animated bounceInRight">
                                	<form method="POST" action="addGroupe">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <i class="fa fa-laptop modal-icon"></i>
                                            <h4 class="modal-title">Ajouter un groupe d'APP</h4>
                                            	<div class='form-group'>
                                                	<label>Nom du groupe</label>
                                                	<input type='text' name="nom" class='form-control' placeholder='Nom du groupe' />
                                            	</div>
                                            	<div class='form-group'>
                                             	   <label>Nom du tuteur</label>
                                             	   <input type='text' name="tuteur_id" class='form-control' placeholder='Tuteur' />
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
                 		
               	
                 	
                      
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalAddSousGroupe">
                                Ajouter un sous-groupe d'APP
                            </button></br></br>

                            <div class="modal inmodal" id="myModalAddSousGroupe" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog">
                                <div class="modal-content animated bounceInRight">
                                	<form method="POST" action="addSousGroupe">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <i class="fa fa-laptop modal-icon"></i>
                                            <h4 class="modal-title">Ajouter un sous-groupe d'APP</h4>
                                            <div class='form-group'>
                                               	<label>Nom du sous-groupe</label>
                                               	<input type='text' name="nom" class='form-control' placeholder='Nom du groupe' />
                                           	</div>
                                           	<div class='form-group'> 
                                    			<label>Groupe Parent</label>
												<select name="groupes_id" class="form-control">
													<c:forEach var="groupe" items="${groupes}">
													<option value="${groupe.id}"><c:out value="${groupe.nom}"/></option>
													</c:forEach>
												</select>								
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
                 		
                 	
                 		
                 
                 
                 <!-- Mettre la liste des groupe et sous-groupes avec petite image pour supprimer -->
                 <div class="panel-body">
                                <div class="panel-group" id="accordion">
                                
                                    <form method="POST" action="addfamille">
                                    <c:forEach var="groupe" items="${groupes}">
										<div style="margin-bottom:6px" class="panel panel-primary">
											<div class="panel-heading">
	                                            <h5 class="panel-title">
	                                                <a data-toggle="collapse" data-parent="#accordion" href="#<c:out value="${groupe.id}"/>"><c:out value="${groupe.nom}"/><a href="<c:url value="/deleteGroupe?groupe=${groupe.nom}" />" ><i style='float:right; margin:5px'  type="submit" class="fa fa-trash"></i></a><i style='float:right;margin:5px' class="fa fa-pencil"></i></a>
	                                            </h5>
	                                        </div>
										</div>
										
										<div id="<c:out value="${groupe.id}"/>" class="panel-collapse collapse in">
                                            <div class="panel-body">
			                                   	<c:forEach var="sousGroupe" items="${sousGroupes}">
													<c:if test="${sousGroupe.groupes_id == groupe.id}">
														<li><c:out value="${sousGroupe.nom}"/></li>
													</c:if>
												</c:forEach> 
							
                                            </div>
                                        </div>
									</c:forEach> 
                                    </form>                              
									

                                </div>
                            </div>
                        </div>
               		</div>  
               		
               		<div>
               			<h6>Test</h6>
               			<select name="groupes_id" class="form-control">
							<c:forEach var="tuteur" items="${tuteurs}">
							<option value="${tuteur.id}"><c:out value="${tuteur.nom} ${tuteur.prenom}"/></option>
							</c:forEach>
						</select>	
               		</div>
                 	
                 	
                 	
                </div><!-- fin col lg 6 avec les formulaires -->
                
                <div class="col-lg-6">
                
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
	                                    <th><c:out value="${eleve.note}"></c:out></th>
	                                </tr>
	                                </c:if>
	                                </c:forEach>
                                </tbody>
                            </table>
                            </c:forEach>
                                
                              
                            

                        </div>
                    </div>
                
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Visualisation des Groupes exemple</h5>
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
	                                	<th>#</th>
	                                    <th>Nom</th>
	                                    <th>Prénom</th>
	                                    <th>Mail</th>
	                                    <th>Note</th>
	                                </tr>
                                </thead>
                                <!-- Faire un foreach avec les élèves dans le groupe -->
                                 <tbody>
	                                <tr>
	                                    <td>1</td>
	                                    <td>Mark</td>
	                                    <td>Otto</td>
	                                    <td>@mdo</td>
	                                    <th>Note</th>
	                                </tr>
	                                <tr>
	                                    <td>2</td>
	                                    <td>Jacob</td>
	                                    <td>Thornton</td>
	                                    <td>@fat</td>
	                                    <th>Note</th>
	                                </tr>
	                                <tr>
	                                    <td>3</td>
	                                    <td>Larry</td>
	                                    <td>the Bird</td>
	                                    <td>@twitter</td>
	                                    <th>Note</th>
	                                </tr>
                                </tbody>
                            </table>
                            </c:forEach>
                                
                              
                            

                        </div>
                    </div>
                </div> <!-- Fin du 2e col lg 6 --> 
                         
            </div>
        </div>
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
<!--                 <div class="col-lg-6"> -->
<!--                     <div class="ibox"> -->
<!--                         <div class="ibox-title"> -->
<!--                             <h5>Enlever un groupe</h5> -->
<!--                         </div> -->
<!--                         <div class="ibox-content"> -->
<!--                         <form action="deleteGroupe" method="post"> -->
<!--                        			<div class='form-group'> -->
<!--                                     <label>Nom du groupe</label> -->
<!-- 									<select name="nom" class='form-control'> -->
<%-- 										<c:forEach var="groupe" items="${groupes}"> --%>
<%-- 											<option value="${groupe.nom}"><c:out value="${groupe.nom}"/></option> --%>
<%-- 										</c:forEach> --%>
<!-- 									</select>                                           -->
<!-- 								</div> -->
								
<!--                                 <div class="modal-footer"> -->
<!--                                     <button type="submit" class="btn btn-primary">Supprimer</button> -->
<!--                                 </div>                                                                -->
<!-- 						</form> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
                
                
                
                
                
                
<!--                 <div class="col-lg-6"> -->
<!--                     <div class="ibox"> -->
<!--                         <div class="ibox-title"> -->
<!--                             <h5>Ajouter un sous-groupe</h5> -->
<!--                         </div> -->
<!--                         <div class="ibox-content"> -->
<!-- 	                        <form action="addSousGroupe" method="post"> -->
<!-- 	                        	 <div class='form-group'> -->
<!--                                     <label>Nom du groupe</label> -->
<!-- 									<input name="nom" type="text" class='form-control'>                                             -->
<!-- 								</div> -->
<!-- 								 <div class='form-group'> -->
<!--                                     <label>Groupe Parent</label> -->
<!-- 									<select name="groupes_id" class="form-control"> -->
<%-- 										<c:forEach var="groupe" items="${groupes}"> --%>
<%-- 											<option value="${groupe.id}"><c:out value="${groupe.nom}"/></option> --%>
<%-- 										</c:forEach> --%>
<!-- 									</select>								 -->
<!-- 								</div> -->
	                        		
<!-- 								<div class="modal-footer"> -->
<!--                                     <button type="submit" class="btn btn-primary">Ajouter</button> -->
<!--                                 </div>							 -->
<!--                              </form>                         -->
<!-- 						</div> -->
<!--                     </div> -->
<!--                 </div> -->
                
                
                
                
                
                
<!--                 <div class="col-lg-6"> -->
<!--                     <div class="ibox"> -->
<!--                         <div class="ibox-title"> -->
<!--                             <h5>enlever un sous-groupe</h5> -->
<!--                         </div> -->
<!--                         <div class="ibox-content"> -->
<!-- 	                       <form action="deleteSousGroupe" method="post"> -->
<!-- 	                     		<div class='form-group'> -->
<!--                                     <label>Sous-groupe</label> -->
<!-- 									<select name="id" class="form-control"> -->
<%-- 										<c:forEach var="groupe" items="${groupes}"> --%>
<%-- 										<optgroup label="${groupe.nom}"> --%>
<%-- 											<c:forEach var="sousGroupe" items="${sousGroupes}"> --%>
<%-- 												<c:if test="${sousGroupe.groupes_id == groupe.id}"> --%>
<%-- 													<option value="${sousGroupe.id}"><c:out value="${sousGroupe.nom}"/></option> --%>
<%-- 												</c:if> --%>
<%-- 											</c:forEach>	 --%>
<!-- 										</optgroup> -->
<%-- 										</c:forEach> --%>
<!-- 									</select>							 -->
<!-- 								</div> -->
<!-- 								<div class="modal-footer"> -->
<!--                                     <button type="submit" class="btn btn-primary">Supprimer</button> -->
<!--                                 </div> -->
<!-- 							</form>                       -->
<!-- 						</div> -->
<!--                     </div> -->
<!--                 </div> -->






                
<!--                  <div class="col-lg-6"> -->
<!--                     <div class="ibox"> -->
<!--                         <div class="ibox-title"> -->
<!--                             <h5>Attribuer un élève a un groupe</h5> -->
<!--                         </div> -->
<!--                         <div class="ibox-content"> -->
<!-- 	                        <form action="attribGroup" method="post"> -->
<!-- 								<div class='form-group'> -->
<!--                                     <label>Sous-groupe</label> -->
<!-- 									<select name="id" class="form-control"> -->
<%-- 										<c:forEach var="groupe" items="${groupes}"> --%>
<%-- 										<optgroup label="${groupe.nom}"> --%>
<%-- 											<c:forEach var="sousGroupe" items="${sousGroupes}"> --%>
<%-- 												<c:if test="${sousGroupe.groupes_id == groupe.id}"> --%>
<%-- 													<option value="${sousGroupe.id}"><c:out value="${sousGroupe.nom}"/></option> --%>
<%-- 												</c:if> --%>
<%-- 											</c:forEach>	 --%>
<!-- 										</optgroup> -->
<%-- 										</c:forEach> --%>
<!-- 									</select>							 -->
<!-- 								</div> -->
<!--  								<div class='form-group'> -->
<!--                                     <label>Nom de l'élève</label> -->
<!-- 									<input name="nom" type="text" class='form-control'>                                             -->
<!-- 								</div>								 -->
								
<!-- 								<div class="modal-footer"> -->
<!--                                     <button type="submit" class="btn btn-primary">Ajouter</button> -->
<!--                                 </div>							 -->
<!--                              </form>                    -->
<!-- 						</div> -->
<!--                     </div> -->
<!--                 </div> -->

           
	
	<%@ include file="include/bas_de_page.jsp" %>
	