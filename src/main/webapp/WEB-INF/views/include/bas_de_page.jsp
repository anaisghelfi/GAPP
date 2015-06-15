
<!--         </div> -->
 

        <div class="footer">
            <div class="pull-right">
                Projet <strong>GAPP</strong> ISEP.
            </div>
            <div>
                <strong>Copyright</strong> Equipe "rouge vif" &copy; 2015
            </div>
        </div>

        </div>
        </div>



    <!-- Mainly scripts -->
    <script src="<c:url value="/resources/js/jquery-2.1.1.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/plugins/metisMenu/jquery.metisMenu.js"/>"></script>
    <script src="<c:url value="/resources/js/plugins/slimScroll/jquery.slimscroll.min.js"/>"></script>

    <!-- Custom and plugin javascript -->
    <script src="<c:url value="/resources/js/GAPP.js"/>"></script>
    <script src="<c:url value="/resources/js/Chart.min.js"/>"></script>
  
    
    <script src="<c:url value="/resources/js/plugins/pace/pace.min.js"/>"></script>
    
<script>
//Afficher que la grille N°1
 $(document).ready(function(){
	 var span  = $("table[name^='grille-']");
	 for(var i =1; i<span.length;i++) {
		 $(span[i]).hide();
	 }
	 
	$("[name^='souscompgrille-']").hide();
	 
   });
</script>
</body>

</html>
