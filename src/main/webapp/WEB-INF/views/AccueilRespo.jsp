 <%@ include file="include/haut_de_page.jsp" %>
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

<!-- Pop up pour ajouter une nouvelle famille -->

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
                                                <input type='text' name="famille" id="addfamille" class='form-control' placeholder='Nom de la famille' />
                                            </div>
                                            <div class='form-group'>
                                                <label>Coefficient</label>
                                                <input type='text'id="addcoefficient" name="coefficient" class='form-control' placeholder='Coefficient' />
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-white" data-dismiss="modal">Fermer</button>
                                            <button type="submit" onclick="return ajouterfamille()" class="btn btn-primary">Sauvegarder</button>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            
<!-- Pop up pour la MAJ d'une famille de compétence -->
                            <div class="modal inmodal" id="myModalUpdateFamille" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog">
                                <div class="modal-content animated bounceInRight">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <i class="fa fa-laptop modal-icon"></i>
                                            <h4 class="modal-title">Editer une famille de compétences</h4>
                                           <form method="POST" action="updatefamille">
                                             <div class='form-group'>
                                                <input type='hidden' name="id" id='idfamille' class='form-control' />
                                                <label>Nom</label>
                                                <input type='text' name="famille" id='famillename' class='form-control' placeholder='Nom de la famille' />
                                            </div>
                                            <div class='form-group'>
                                                <label>Coefficient</label>
                                                <input type='text' name="coefficient" id='coefficientfamille' class='form-control' placeholder='Coefficient' />
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-white" data-dismiss="modal">Fermer</button>
                                            <button type="submit" onclick="return updatefamille()" class="btn btn-primary">Sauvegarder</button>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>                            
                            
                            <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#myModal2">
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
                                                <input name="sous_competences" type='text' id="addsouscompetence" class='form-control' placeholder='Nom de la compétence' />
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
                                        	<h3 style='text-align:center'>Niveaux associés</h4>
                                            <div class='form-group'>
                                                <input class='form-control' name="B" placeholder='B'></input>
                                            </div>
                                            <div class='form-group'>
                                                <input class='form-control' name="I" placeholder='I'></input>
                                            </div>
                                            <div class='form-group'>
                                                <input class='form-control' name="M" placeholder='M'></input>
                                            </div>
                                            <div class='form-group'>
                                                <input class='form-control' name="E" placeholder='E'></input>
                                            </div>                                                                                                                                    
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-white" data-dismiss="modal">Fermer</button>
                                            <button type="submit" onclick="return ajoutercompetence()" class="btn btn-primary">Sauvegarder</button>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            
        
<!-- MODAL UPDATE COMPETENCES -->
                            <div class="modal inmodal" id="myModalUpdateCompetences" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog">
                                <div class="modal-content animated bounceInRight">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <i class="fa fa-laptop modal-icon"></i>
                                            <h4 class="modal-title">Editer une compétence</h4>
                                             <form method="POST" action="updatecompetence">
                                             <div class='form-group'>
                                                <label>Nom</label>
                                                <input name="sous_competences" type='text' id="updatesouscompetence" class='form-control' placeholder='Nom de la compétence' />
                                            </div>
                                            <input type='hidden' name="id" id='idsouscomp' class='form-control' />
                                            <div class='form-group'>
                                                <label>Famille</label>
                                                 <select name="competences_id" id="updatecompfamille" class='form-control' >
                                                    <optgroup label='Familles'>
											 			<c:forEach var="allcompetences" items="${allcompetences}">
															<option value="<c:out value="${allcompetences.id}"/>"><c:out value="${allcompetences.famille}"/></option>
														</c:forEach> 
                                                    </optgroup>
                                                </select> 
                                            </div>
               
											                                            
                                        </div>
                                        <div class="modal-body">
                                        	<h3 style='text-align:center'>Niveaux associés</h4>
                                            <div class='form-group'>
                                                <input class='form-control' id="updateB" name="B" placeholder='B'></input>
                                            </div>
                                            <div class='form-group'>
                                                <input class='form-control' id="updateI" name="I" placeholder='I'></input>
                                            </div>
                                            <div class='form-group'>
                                                <input class='form-control' id="updateM" name="M" placeholder='M'></input>
                                            </div>
                                            <div class='form-group'>
                                                <input class='form-control' id="updateE" name="E" placeholder='E'></input>
                                            </div>                                                                                                                                    
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-white" data-dismiss="modal">Fermer</button>
                                            <button type="submit" onclick="return ajoutersousCompetence()" class="btn btn-primary">Sauvegarder</button>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>        
                            
                            </br>

                            

                            <div class="panel-body">
                                <div class="panel-group" id="accordion">
                                
                                    <form method="POST" action="addfamille">
                                    <c:forEach var="allcompetences" items="${allcompetences}">
										<div style="margin-bottom:6px" class="panel panel-primary">
											<div class="panel-heading">
	                                            <h5 class="panel-title">
	                                                <a data-toggle="collapse" data-parent="#accordion" href="#<c:out value="${allcompetences.id}"/>"><c:out value="${allcompetences.famille}"/> (<c:out value="${allcompetences.coefficient}"/>)<i onclick="dramModalConfirm('<c:out value="${allcompetences.id}"/>','supprimerFamille','<c:out value="${allcompetences.famille}"/>','deletefamille')" style='float:right; margin:5px' <c:out value="${allcompetences.id}"/>  type="submit" class="fa fa-trash"></i><i style='float:right;margin:5px' onclick="update('famille','<c:out value="${allcompetences.id}"/>','<c:out value="${allcompetences.famille}"/>','<c:out value="${allcompetences.coefficient}"/>')" data-toggle="modal" data-target="#myModalUpdateFamille" class="fa fa-pencil"></i></a>
	                                            </h5>
	                                        </div>
										</div>
										
										<div id="<c:out value="${allcompetences.id}"/>" class="panel-collapse collapse in">
			                                   	<c:forEach var="allsouscompetences" items="${allsouscompetences}">
													<c:if test="${allsouscompetences.competences_id == allcompetences.id}">
														<div class='blueCompetence' style="height:25px"><c:out value="${allsouscompetences.sous_competences}"/><i onclick="dramModalConfirm('<c:out value="${allsouscompetences.id}"/>','supprimerCompetence','<c:out value="${allsouscompetences.sous_competences}"/>','deletecompetence')" style='float:right;cursor:pointer; margin:5px' type="submit" class="fa fa-trash"></i><i style='float:right;margin:5px;cursor:pointer' onclick="update('competence','<c:out value="${allsouscompetences.sous_competences}"/>','<c:out value="${allsouscompetences.competences_id}"/>','<c:out value="${allsouscompetences.getB()}"/>','<c:out value="${allsouscompetences.getI()}"/>','<c:out value="${allsouscompetences.getM()}"/>','<c:out value="${allsouscompetences.getE()}"/>','<c:out value="${allsouscompetences.id}"/>')" data-toggle="modal" data-target="#myModalUpdateCompetences"  class="fa fa-pencil"></i></div>
														<li style="list-style-type:none;margin-left:30px">B : <c:out value="${allsouscompetences.getB()}"/></li>
														<li style="list-style-type:none;margin-left:30px">I : <c:out value="${allsouscompetences.getI()}"/></li>
														<li style="list-style-type:none;margin-left:30px">M : <c:out value="${allsouscompetences.getM()}"/></li>
														<li style="list-style-type:none;margin-left:30px">E : <c:out value="${allsouscompetences.getE()}"/></li>
													</c:if>
												</c:forEach> 							
                                        </div>
									</c:forEach> 
                                    </form>                              
									

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
                            	<c:forEach var="allcompetences" items="${allcompetences}">
                                	<span style="cursor:pointer" name="showGrille-<c:out value="${allcompetences.id}"/>" class='label label-primary'><c:out value="${allcompetences.famille}"/></span>
                            	</c:forEach>
                            </h4>
	
							<c:forEach var="allcompetences" items="${allcompetences}">
                            <table  name="grille-<c:out value="${allcompetences.id}"/>" class='table table-bordered'>
                                <thead>
                                    <caption style="background-color: #1AB394;color: #fff;text-align: center;"><c:out value="${allcompetences.famille}"/></caption>
                                    <tr>
                                        <td>Compétence</td>
                                        <td>Niveau</td>

                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="allsouscompetences" items="${allsouscompetences}">
									<c:if test="${allsouscompetences.competences_id == allcompetences.id}">
                                   
                                    <tr name="affichersouscomp-<c:out value="${allsouscompetences.competences_id}"/>-<c:out value="${allsouscompetences.id}"/>" style="cursor:pointer" class="active">
                                        <td><c:out value="${allsouscompetences.sous_competences}"/></td>
                                        <td></td>
                                    </tr>
                                    
                                    
                                    <tr name="souscompgrille-<c:out value="${allsouscompetences.competences_id}"/>-<c:out value="${allsouscompetences.id}"/>">
                                        <td>B : <c:out value="${allsouscompetences.getB()}"/></td>
                                        <td></td>
                                    </tr>
                                    <tr name="souscompgrille-<c:out value="${allsouscompetences.competences_id}"/>-<c:out value="${allsouscompetences.id}"/>">
                                        <td>I : <c:out value="${allsouscompetences.getI()}"/> </td>
                                        <td></td>
                                    </tr>
                                    <tr name="souscompgrille-<c:out value="${allsouscompetences.competences_id}"/>-<c:out value="${allsouscompetences.id}"/>">
                                        <td>M : <c:out value="${allsouscompetences.getM()}"/> </td>
                                        <td></td>
                                    </tr>
                                    <tr name="souscompgrille-<c:out value="${allsouscompetences.competences_id}"/>-<c:out value="${allsouscompetences.id}"/>">
                                        <td>E : <c:out value="${allsouscompetences.getE()}"/></td>
                                        <td></td>
                                    </tr>
                                    
                                    </c:if>
								</c:forEach> 
                                </tbody>
                            </table>
                            </c:forEach>

                        </div>
                    </div>
                </div>

            </div>


        </div>
<%@ include file="include/bas_de_page.jsp" %>


