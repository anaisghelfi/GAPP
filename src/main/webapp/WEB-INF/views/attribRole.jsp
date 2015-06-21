<%@ include file="include/haut_de_page.jsp" %>

	<div class="row wrapper border-bottom white-bg page-heading">
         <div class="col-lg-10">
            <h2>Attribution des rôles</h2>
               <ol class="breadcrumb">
                   <li><a href="#">Accueil</a></li>
                   <li class="active"><strong>Attribuer les rôles</strong></li>
               </ol>
         </div>
                
     </div>
      <div class="wrapper wrapper-content animated fadeInRight">
	      <div class="row">
	      	<div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Liste des tuteurs</h5>
                    </div>
                    <div class="ibox-content" style="display: block;">
 						<form  method='POST' action="attribRole">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Nom</th>
                                <th>Prénom</th>
                                <th>Tuteur</th>
                                <th>Responsable app</th>
                            </tr>
                            </thead>
                            <tbody>
                             
                            <c:forEach var="tuteur" items="${tuteurs}">
	                            <tr>
	                               <td><c:out value="${tuteur.nom}"></c:out></td>
	                               <td><c:out value="${tuteur.prenom}"></c:out></td>
	                               <c:if test="${tuteur.type == 1 }">
	                                 <td><input type="radio" name="type-<c:out value="${tuteur.id}"/>" value="1" checked/></td>
	                                 <td><input type="radio" name="type-<c:out value="${tuteur.id}"/>" value="2"/></td>
	                               </c:if>
	                                <c:if test="${tuteur.type == 2 }">
	                                 <td><input type="radio" name="type-<c:out value="${tuteur.id}"/>" value="1" /></td>
	                                 <td><input type="radio" name="type-<c:out value="${tuteur.id}"/>" value="2" checked/></td>
	                               </c:if>
	                             
	                            </tr>
	                         
	                         </c:forEach>
	                        
	                        	
                          
                            </tbody>
                        </table>
                        <button type="submit" class="btn btn-w-m btn-success btn-sm">Valider</button>
                         	
	                   </form>

                    </div>
                </div>
            </div>
	      	
	      </div>
      </div>

<%@ include file="include/bas_de_page.jsp" %>