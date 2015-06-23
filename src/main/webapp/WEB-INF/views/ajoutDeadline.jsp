<%@ include file="include/haut_de_page.jsp" %>


            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>Gestion des deadlines</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="#">Accueil</a>
                        </li>
                        <li class="active">
                            <strong>Ajouter une deadline</strong>
                        </li>
                    </ol>
                </div>
                
            </div>

        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
            
				<div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Voir les deadlines</h5>
                        </div>
	                        <div class="ibox-content">
							
							<c:forEach var="deadline" items="${deadlines}">
								<div class="form-group"><strong>Titre :</strong> <c:out value="${deadline.titre}"/> 
								<strong>Description :</strong> <c:out value="${deadline.description}"/>
								<strong>Date limite :</strong> <c:out value="${deadline.date_limite}"/>
								<strong>Groupe concerné :</strong> <c:out value="${deadline.groupes_id}"/></div> </br>
							</c:forEach>
							
	                        </div>
                    </div>
                </div>
                
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Voir les prochaines séances d'APP</h5>
                        </div>
	                        <div class="ibox-content">
							
							<c:forEach var="seance" items="${seances}">
								<div class="form-group">
								<strong>Séance numéro :</strong> <c:out value="${seance.numero_seance}"/> 
								<strong>Date :</strong> <c:out value="${seance.date_seance}"/>
								<strong>Groupe concerné :</strong> <c:out value="${seance.nom}"/></div></br>
							</c:forEach>
							
	                        </div>
                    </div>
                </div>
                
                
			
			<div class="col-lg-12">
			
                <div class="col-lg-6">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Ajouter une nouvelle deadline</h5>
                        </div>
                        	<div class="ibox-content">
                            
                            	<form method="post" action="add_deadline">
								  <div class="form-group"><label>Titre :</label> <input type="text" name="titre" class="form-control" ></div>
								  <div class="form-group"><label>Description :</label> <input type="text" name="description" class="form-control"></div>
								  <div class="form-group"><label>Date :</label> <input type="date" name="date_limite" class="form-control"></div>
									<div class="form-group"><label>Groupe :</label>
											<select name="groupes_id" class="form-control">
													<c:forEach var="groupe" items="${groupes}">
													<option value="${groupe.id}"><c:out value="${groupe.nom}"/></option>
													</c:forEach>
											</select>	
									</div> 									
										<button class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit" name="valider"><strong>Valider</strong></button></br>
								</form>
                            
                       	 </div>
                    </div>
                </div>
                
                <div class="col-lg-6">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Supprimer une deadline</h5>
                        </div>
                        	<div class="ibox-content">
                            
                            	<form method="post" action="delete_deadline">
								  <div class="form-group"><label>Titre :</label> 
											<select name="titre" class="form-control">
													<c:forEach var="deadline" items="${deadlines}">
													<option value="${deadline.titre}"><c:out value="${deadline.titre}"/></option>
													</c:forEach>
											</select>	
									</div> 			
								  
										<button class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit" name="valider"><strong>Supprimer</strong></button></br>
								</form>
                            
                       	 </div>
                    </div>
                </div>
                
           </div>
                
                
 		   <div class="col-lg-12">

                <div class="col-lg-6">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Ajouter une nouvelle séance</h5>
                        </div>
                        	<div class="ibox-content">
                            
                            	<form method="post" action="add_seance">
								  <div class="form-group"><label>Numéro de séance :</label> <input type="text" name="numero_seance" class="form-control" ></div>
								  <div class="form-group"><label>Date :</label> <input type="date" name="date_seance" class="form-control"></div>
									 <div class="form-group"><label>Groupe :</label>
											<select name="groupes_id" class="form-control">
													<c:forEach var="groupe" items="${groupes}">
													<option value="${groupe.id}"><c:out value="${groupe.nom}"/></option>
													</c:forEach>
											</select>	
									</div> 							
										<button class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit" name="valider"><strong>Valider</strong></button></br>
								</form>
                            
                       	 </div>
                    </div>
                </div>
                
                <div class="col-lg-6">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Supprimer une séance d'APP</h5>
                        </div>
                        	<div class="ibox-content">
                            
                            	<form method="post" action="delete_seance">
								  <div class="form-group"><label>Titre :</label> 
											<select name="id" class="form-control">
													<c:forEach var="seance" items="${seances}">
													<option value="${seance.id}">Date : <c:out value="${seance.date_seance}"/> Groupe : <c:out value="${seance.nom}"/></option>
													</c:forEach>
											</select>	
									</div> 			
								  
										<button class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit" name="valider"><strong>Supprimer</strong></button></br>
								</form>
                            
                       	 </div>
                    </div>
                </div>
                
           </div>
                
              
        </div>
     </div>
       
       
<%@ include file="include/bas_de_page.jsp" %>