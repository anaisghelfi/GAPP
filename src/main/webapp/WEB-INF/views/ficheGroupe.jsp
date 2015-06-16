
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
 						<table class="table table-bordered">
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
                               <form  method='POST' action="../addAbsences/<c:out value="${numerogroupe}"/>"> 
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
				
				<button type="submit" class="btn btn-w-m btn-success">Remplir la grille de compétences</button>
				</br></br></br>
		
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
	var input = $( "input:radio" );
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
	