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
       <h1 style="text-align:center">Mon profil</h1>
	       <div class="col-lg-3" style="text-align:center">
	       <h2>Absences</h2>
	       		<canvas id="doughnutChart" height="420" width="900" style="width: 450px; height: 210px;"></canvas>
	       </div>
	        <div class="col-lg-6" style="text-align:center">
	       <h2>Cours</h2>
			<div id="calendar" class="fc fc-ltr fc-unthemed">
			</div>	
		</div>
	        <div class="col-lg-3" style="text-align:center">
	       <h2>Tuteur</h2>
	       	<p>Nom Prénom</p>
	       	<p>E-mail</p>
	       	<p>Remarques tuteur :</p>
	       </div>
       </div>
     </div>
	

<%@ include file="include/bas_de_page.jsp" %>
  <script src="<c:url value="/resources/js/moment.min.js"/>"></script>
  <script src="<c:url value="/resources/js/fullcalendar.min.js"/>"></script>
<script>
    var doughnutData = [
        {
            value: 300,
            color: "#a3e1d4",
            highlight: "#1ab394",
            label: "App"
        },
        {
            value: 50,
            color: "#dedede",
            highlight: "#1ab394",
            label: "Software"
        },
        {
            value: 100,
            color: "#b5b8cf",
            highlight: "#1ab394",
            label: "Laptop"
        }
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