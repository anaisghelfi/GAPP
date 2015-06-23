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
            
            <div class="col-lg-4">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Informations élève :</h5>
                        </div>
                        	<div class="ibox-content">
                            <c:forEach var="eleve" items="${eleves}">
								<div class="form-group">
									<strong>Nom :</strong> <c:out value="${eleve.nom}"/> </br>
									<strong>Prénom :</strong> <c:out value="${eleve.prenom}"/> </br>
									<strong>Code élève :</strong> <c:out value="${eleve.code_eleve}"/> </br>
									<strong>Promo :</strong> <c:out value="${eleve.promo}"/> </br>
									<strong>Groupe :</strong> <c:out value="${eleve.groupe}"/> </br>
									<strong>E-Mail :</strong> <c:out value="${eleve.mail}"/></br>
									<strong>Note :</strong> <c:out value="${eleve.note}"/>  
								</div>
							</c:forEach>
                            
                       	 </div>
                    </div>
                </div>
                
                <div class="col-lg-4">
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
            
				<div class="col-lg-4">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Mon taux de présence</h5>
                        </div>
	                        <div class="ibox-content">
							<canvas id="doughnutChart" height="420" width="900" style="width: 450px; height: 210px;"></canvas>
	                        </div>
                    </div>
                </div>
                </div>
			
			<div class="row">
				
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Mes prochains cours</h5>
                        </div>
                        	<div class="ibox-content">
                            <div id="calendar" class="fc fc-ltr fc-unthemed">
                            <c:forEach var="seance" items="${seances}">
								<div class="form-group">
									<strong>Séance numéro :</strong> <c:out value="${seance.numero_seance}"/>
									<strong>Date :</strong> <c:out value="${seance.date_seance}"/> 
								</div>
							</c:forEach>
                            
                       	 </div>
                    </div>
                </div>
               
            </div>


        </div>
       
       
<%@ include file="include/bas_de_page.jsp" %>
 <script src="<c:url value="/resources/js/moment.min.js"/>"></script>
  <script src="<c:url value="/resources/js/fullcalendar.min.js"/>"></script>
<script>
	
	var total = 5;
	var absence = 1;
	var presence = 4;
	var presenceP= ((total - absence)/total)*100;
	var absenceP = 100 - presenceP;
	
    var doughnutData = [
        {
            value: presenceP,
            color: "#3A99D9",
            highlight: "rgba(58,153,217,0.8)",
            label: "Présent"
        },
        {
            value: absenceP,
            color: "#e74c3c",
            highlight: "rgba(231, 76, 60,0.8)",
            label: "Absent"
        },
    ];

    var doughnutOptions = {
        segmentShowStroke: true,
        segmentStrokeColor: "#fff",
        segmentStrokeWidth: 2,
        percentageInnerCutout: 45, // This is 0 for Pie charts
        animationSteps: 100,
        animationEasing: "easeOutBounce",
        animateRotate: true,
        animateScale: false,
        responsive: true,
    };


    var ctx = document.getElementById("doughnutChart").getContext("2d");
    var myNewChart = new Chart(ctx).Doughnut(doughnutData, doughnutOptions);	
</script>
<script>


$(document).ready(function() {


    /* initialize the calendar
     -----------------------------------------------------------------*/
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();

    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        editable: false,
        droppable: false, // this allows things to be dropped onto the calendar

        events: [
            {
                title: 'All Day Event',
                start: new Date(y, m, 1)
            },
            {
                title: 'Long Event',
                start: new Date(y, m, d-5),
                end: new Date(y, m, d-2)
            },
            {
                id: 999,
                title: 'Repeating Event',
                start: new Date(y, m, d-3, 16, 0),
                allDay: false
            },
            {
                id: 999,
                title: 'Repeating Event',
                start: new Date(y, m, d+4, 16, 0),
                allDay: false
            },
            {
                title: 'Meeting',
                start: new Date(y, m, d, 10, 30),
                allDay: false
            },
            {
                title: 'Lunch',
                start: new Date(y, m, d, 12, 0),
                end: new Date(y, m, d, 14, 0),
                allDay: false
            },
            {
                title: 'Birthday Party',
                start: new Date(y, m, d+1, 19, 0),
                end: new Date(y, m, d+1, 22, 30),
                allDay: false
            },
            {
                title: 'Click for Google',
                start: new Date(y, m, 28),
                end: new Date(y, m, 29),
                url: 'http://google.com/'
            }
        ]
    });


});


</script>