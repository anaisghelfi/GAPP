
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
                            <h5>Ajouter un groupe</h5>
                        </div>
                        <div class="ibox-content">
							<form action="addGroupe" method="post">
								 <div class='form-group'>
                                    <label>Nom du groupe</label>
									<input name="nom" type="text" class='form-control'>                                            
								</div>
								<div class='form-group'>
                                    <label>Nom du Tuteur</label>
									<input name="tuteur_id" type="text" class='form-control'>                                            
								</div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Ajouter</button>
                                </div>
							</form>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-6">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Enlever un groupe</h5>
                        </div>
                        <div class="ibox-content">
                        <form action="deleteGroupe" method="post">
                       			<div class='form-group'>
                                    <label>Nom du groupe</label>
									<select name="nom" class='form-control'>
										<c:forEach var="groupe" items="${groupes}">
											<option value="${groupe.nom}"><c:out value="${groupe.nom}"/></option>
										</c:forEach>
									</select>                                          
								</div>
								
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Supprimer</button>
                                </div>                                                               
						</form>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-6">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Ajouter un sous-groupe</h5>
                        </div>
                        <div class="ibox-content">
	                        <form action="addSousGroupe" method="post">
	                        	 <div class='form-group'>
                                    <label>Nom du groupe</label>
									<input name="nom" type="text" class='form-control'>                                            
								</div>
								 <div class='form-group'>
                                    <label>Groupe Parent</label>
									<select name="groupes_id" class="form-control">
										<c:forEach var="groupe" items="${groupes}">
											<option value="${groupe.id}"><c:out value="${groupe.nom}"/></option>
										</c:forEach>
									</select>								
								</div>
	                        		
								<div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Ajouter</button>
                                </div>							
                             </form>                        
						</div>
                    </div>
                </div>
                
                <div class="col-lg-6">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>enlever un sous-groupe</h5>
                        </div>
                        <div class="ibox-content">
	                       <form action="deleteSousGroupe" method="post">
	                     		<div class='form-group'>
                                    <label>Sous-groupe</label>
									<select name="id" class="form-control">
										<c:forEach var="groupe" items="${groupes}">
										<optgroup label="${groupe.nom}">
											<c:forEach var="sousGroupe" items="${sousGroupes}">
												<c:if test="${sousGroupe.groupes_id == groupe.id}">
													<option value="${sousGroupe.id}"><c:out value="${sousGroupe.nom}"/></option>
												</c:if>
											</c:forEach>	
										</optgroup>
										</c:forEach>
									</select>							
								</div>
								<div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Supprimer</button>
                                </div>
							</form>                      
						</div>
                    </div>
                </div>
                
                 <div class="col-lg-6">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Attribuer un élève a un groupe</h5>
                        </div>
                        <div class="ibox-content">
	                        <form action="attribGroup" method="post">
								<div class='form-group'>
                                    <label>Sous-groupe</label>
									<select name="id" class="form-control">
										<c:forEach var="groupe" items="${groupes}">
										<optgroup label="${groupe.nom}">
											<c:forEach var="sousGroupe" items="${sousGroupes}">
												<c:if test="${sousGroupe.groupes_id == groupe.id}">
													<option value="${sousGroupe.id}"><c:out value="${sousGroupe.nom}"/></option>
												</c:if>
											</c:forEach>	
										</optgroup>
										</c:forEach>
									</select>							
								</div>
 								<div class='form-group'>
                                    <label>Nom de l'élève</label>
									<input name="nom" type="text" class='form-control'>                                            
								</div>								
								
								<div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Ajouter</button>
                                </div>							
                             </form>                   
						</div>
                    </div>
                </div>

            </div>
        </div>
	
	<%@ include file="include/bas_de_page.jsp" %>
	