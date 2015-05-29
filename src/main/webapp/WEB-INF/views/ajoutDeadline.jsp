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
								<strong>Titre :</strong> <c:out value="${deadline.titre}"/> 
								<strong>Description :</strong> <c:out value="${deadline.description}"/>
								<strong>Date limite :</strong> <c:out value="${deadline.date_limite}"/>
								<strong>Groupe concerné :</strong> <c:out value="${deadline.groupes_id}"/> </br></br>
							</c:forEach>
							
	                        </div>
                    </div>
                </div>
			
			
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Ajouter une nouvelle deadline</h5>
                        </div>
                        	<div class="ibox-content">
                            
                            	<form method="post" action="add_deadline">
								  <strong>Titre :</strong> <input type="text" name="titre" >
								  <strong>Description :</strong> <input type="text" name="description">  
								  <strong>Date :</strong> <input type="date" name="date_limite" >
								  <strong>Groupe :</strong> <input type="text" name="groupes_id">
										<input type="submit" name="valider"/>
								</form>
                            
                       	 </div>
                    </div>
                </div>
                
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Supprimer une deadline</h5>
                        </div>
                        	<div class="ibox-content">
                            
                            	<form method="post" action="delete_deadline">
								  <strong>Titre :</strong> <input type="text" name="titre" >
								  
										<input type="submit" name="supprimer"/>
								</form>
                            
                       	 </div>
                    </div>
                </div>
              
            </div>


        </div>
       
       
<%@ include file="include/bas_de_page.jsp" %>