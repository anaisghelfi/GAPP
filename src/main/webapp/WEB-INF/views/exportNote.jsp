<%@ include file="include/haut_de_page.jsp" %>


            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>Export des notes</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="#">Accueil</a>
                        </li>
                        <li class="active">
                            <strong>Exporter les notes</strong>
                        </li>
                    </ol>
                </div>
                
            </div>
             <div class="wrapper wrapper-content animated fadeInRight">
             
	             <div class="row">
	            
					<div class="col-lg-12" style="text-align:center">
						<form method="POST" action="exportNote">
							<button type="submit" class="btn btn-primary btn-lg">Exporter les notes</button>
						</form>	
					</div>
				</div>
            
             </div>
            
                   
<%@ include file="include/bas_de_page.jsp" %>