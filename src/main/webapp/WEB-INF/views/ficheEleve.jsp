<%@ include file="include/haut_de_page.jsp" %>


            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>Fiche Eleve</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="#">Accueil</a>
                        </li>
                        <li class="active">
                            <strong>Consulter la fiche élève</strong>
                        </li>
                    </ol>
                </div>
                
            </div>

        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
            
            <div class="col-lg-6">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Informations élève :</h5>
                        </div>
                        	<div class="ibox-content">
                            <c:forEach var="eleve" items="${eleves}">
								<div class="form-group">
									<strong>Nom :</strong> <c:out value="${eleve.nom}"/> </br>
									<strong>Prénom :</strong> <c:out value="${eleve.prenom}"/> </br>
									<strong>Promo :</strong> <c:out value="${eleve.promo}"/> </br>
									<strong>Groupe :</strong> <c:out value="${eleve.groupe}"/> </br>
									<strong>E-Mail :</strong> <c:out value="${eleve.mail}"/></br>
									<strong>Note :</strong> <c:out value="${eleve.note}"/>  
								</div>
							</c:forEach>
                            
                       	 </div>
                    </div>
                </div>
            
				<div class="col-lg-6">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Mon taux de présence</h5>
                        </div>
	                        <div class="ibox-content">
							
							 Login : ${ sessionScope.login }
   							 Number : ${sessionScope.number}
   							 Type : ${ sessionScope.type}
   							 OK : ${nom}
							
	                        </div>
                    </div>
                </div>
			
			
                <div class="col-lg-6">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Mes prochains cours</h5>
                        </div>
                        	<div class="ibox-content">
                            
                            <c:forEach var="seance" items="${seances}">
								<div class="form-group">
									<strong>Séance numéro :</strong> <c:out value="${seance.numero_seance}"/>
									<!-- <strong>Date :</strong> <c:out value="${seance.date_seance}"/> Ne prends pas en charge date.sql-->
								</div>
							</c:forEach>
                            
                       	 </div>
                    </div>
                </div>
                
                
                <div class="col-lg-6">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Mon tuteur</h5>
                        </div>
                        	<div class="ibox-content">
                            
                            	<c:forEach var="tuteur" items="${tuteurs}">
								<div class="form-group">
									<strong>Nom :</strong> <c:out value="${tuteur.nom}"/> </br>
									<strong>Prénom :</strong> <c:out value="${tuteur.prenom}"/> </br>
									<strong>E-Mail :</strong> <c:out value="${tuteur.mail}"/> </br> 
								</div>
							</c:forEach>
                            
                       	 </div>
                    </div>
                </div>
                
              
            </div>


        </div>
       
       
<%@ include file="include/bas_de_page.jsp" %>