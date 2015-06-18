<%@ include file="include/haut_de_page.jsp" %>

<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-lg-10">
    	<h2>Evaluation Croisée</h2>
        	<ol class="breadcrumb">
            	<li>
                	<a href="#">Accueil</a>
                </li>
                <li>
                	<a>Test fil</a>
                </li>
                <li class="active">
                	<strong>Evaluation croisée</strong>
                </li>
            </ol>
        </div>
    <div class="col-lg-2">

    </div>
</div>
 
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">

		<div class="col-lg-12"><!-- Mettre dans cette col les boutons vers formulaire ajouts groupes, attribution des élèves, et liste des groupes, sous-groupes avec bouton pour supprimer -->               
        	<div class="ibox">
            	<div class="ibox-title">
                	<h5>Faire l'évaluation croisée de mon groupe</h5>
                </div>
                <div class="ibox-content" style="overflow-x: auto">
                	<form >
                		<table class="table table-bordered text-center"  style="width:auto">
	                		<thead>
	<!--                 	Ligne avec les compétences -->
		                		<tr>
		                			<th class="text-center">Nom des Eleves</th>
		                			<c:forEach var="competence" items="${competences}">
		                				<th colspan="4" class="text-center" ><c:out value="${competence.famille}"></c:out></th>
		                				
		                			</c:forEach>
		                		</tr>
	                		</thead>
	                		
	                		<tbody>
	                		
<!-- 		                	Ligne avec la descritpion des compétences -->
		                		<tr>
		                			<th></th>
		                			<c:forEach  var="competence" items="${competences}">
		                			<th colspan="4" class="text-center">Description</th>
		                			</c:forEach>
		                		</tr>
		                		
		<!--                 	Ligne avec les niveaux -->
								<tr>
									<th></th>
									<c:forEach  var="competence" items="${competences}">
										<c:forEach begin="1" end="4" var="i">
			                				<th class="text-center">
			                					<c:choose>
													<c:when test="${i == 1}">
													Non Acquis
													</c:when>
													<c:when test="${i == 2}">
													En cours d'acquisition
													</c:when>
													<c:when test="${i == 3}">
													Acquis 
													</c:when>
													<c:when test="${i == 4}">
													Dépassé
													</c:when>
												</c:choose>
											</th>
			                			</c:forEach>
			                		</c:forEach>
		                		</tr>
		                		
		<!--                 	Ligne avec tous les noms des membres du groupes (y compris celui connecté) et checkbox pour cocher niveau -->
								<c:forEach var="eleve" items="${eleves}">
								<tr>
									<th><c:out value="${eleve.prenom} ${eleve.nom}"></c:out></th>
									<c:forEach  var="competence" items="${competences}">
									<c:forEach begin="1" end="4" var="i">
			                		<th class="text-center">
			                			<c:choose>
											<c:when test="${i == 1}">
												<input type="radio" name="${competence.id}" value="1">
											</c:when>
											<c:when test="${i == 2}">
												<input type="radio" name="${competence.id}" value="2">
											</c:when>
											<c:when test="${i == 3}">
												<input type="radio" name="${competence.id}" value="3">
											</c:when>
											<c:when test="${i == 4}">
												<input type="radio" name="${competence.id}" value="4">
											</c:when>
										</c:choose>
									</th>
			             			</c:forEach>
			             			</c:forEach>	
		                		</tr>
		                		</c:forEach>
	                		</tbody>
	                	</table>
	                	<input type="submit" value="Envoyer" class="btn btn-primary">
                	</form>
                </div>
            </div>
        </div>
    </div>
</div>
                	
					
 
 
<%@ include file="include/bas_de_page.jsp" %>