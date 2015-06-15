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
	       <div class="col-lg-4" style="text-align:center">
	       <h2>Absences</h2>
	       		<canvas id="doughnutChart" height="420" width="900" style="width: 450px; height: 210px;"></canvas>
	       </div>
	        <div class="col-lg-4" style="text-align:center">
	       <h2>Cours</h2>
			<div id="calendar" class="fc fc-ltr fc-unthemed">
				<div class="fc-toolbar">
					<div class="fc-left">
						<div class="fc-button-group">
							<button type="button"
								class="fc-prev-button fc-button fc-state-default fc-corner-left">
								<span class="fc-icon fc-icon-left-single-arrow"></span>
							</button>
							<button type="button"
								class="fc-next-button fc-button fc-state-default fc-corner-right">
								<span class="fc-icon fc-icon-right-single-arrow"></span>
							</button>
						</div>
						<button type="button"
							class="fc-today-button fc-button fc-state-default fc-corner-left fc-corner-right fc-state-disabled"
							disabled="disabled">today</button>
					</div>
					<div class="fc-right">
						<div class="fc-button-group">
							<button type="button"
								class="fc-month-button fc-button fc-state-default fc-corner-left fc-state-active">month</button>
							<button type="button"
								class="fc-agendaWeek-button fc-button fc-state-default">week</button>
							<button type="button"
								class="fc-agendaDay-button fc-button fc-state-default fc-corner-right">day</button>
						</div>
					</div>
					<div class="fc-center">
						<h2>June 2015</h2>
					</div>
					<div class="fc-clear"></div>
				</div>
				<div class="fc-view-container">
					<div class="fc-view fc-month-view fc-basic-view">
						<table>
							<thead>
								<tr>
									<td class="fc-widget-header">
										<div class="fc-row fc-widget-header">
											<table>
												<thead>
													<tr>
														<th class="fc-day-header fc-widget-header fc-sun">Sun</th>
														<th class="fc-day-header fc-widget-header fc-mon">Mon</th>
														<th class="fc-day-header fc-widget-header fc-tue">Tue</th>
														<th class="fc-day-header fc-widget-header fc-wed">Wed</th>
														<th class="fc-day-header fc-widget-header fc-thu">Thu</th>
														<th class="fc-day-header fc-widget-header fc-fri">Fri</th>
														<th class="fc-day-header fc-widget-header fc-sat">Sat</th>
													</tr>
												</thead>
											</table>
										</div>
									</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="fc-widget-content">
										<div class="fc-day-grid-container">
											<div class="fc-day-grid">
												<div class="fc-row fc-week fc-widget-content"
													style="height: 84px;">
													<div class="fc-bg">
														<table>
															<tbody>
																<tr>
																	<td
																		class="fc-day fc-widget-content fc-sun fc-other-month fc-past"
																		data-date="2015-05-31"></td>
																	<td class="fc-day fc-widget-content fc-mon fc-past"
																		data-date="2015-06-01"></td>
																	<td class="fc-day fc-widget-content fc-tue fc-past"
																		data-date="2015-06-02"></td>
																	<td class="fc-day fc-widget-content fc-wed fc-past"
																		data-date="2015-06-03"></td>
																	<td class="fc-day fc-widget-content fc-thu fc-past"
																		data-date="2015-06-04"></td>
																	<td class="fc-day fc-widget-content fc-fri fc-past"
																		data-date="2015-06-05"></td>
																	<td class="fc-day fc-widget-content fc-sat fc-past"
																		data-date="2015-06-06"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-number fc-sun fc-other-month fc-past"
																		data-date="2015-05-31">31</td>
																	<td class="fc-day-number fc-mon fc-past"
																		data-date="2015-06-01">1</td>
																	<td class="fc-day-number fc-tue fc-past"
																		data-date="2015-06-02">2</td>
																	<td class="fc-day-number fc-wed fc-past"
																		data-date="2015-06-03">3</td>
																	<td class="fc-day-number fc-thu fc-past"
																		data-date="2015-06-04">4</td>
																	<td class="fc-day-number fc-fri fc-past"
																		data-date="2015-06-05">5</td>
																	<td class="fc-day-number fc-sat fc-past"
																		data-date="2015-06-06">6</td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td></td>
																	<td class="fc-event-container"><a
																		class="fc-day-grid-event fc-event fc-start fc-end fc-draggable"><div
																				class="fc-content">
																				<span class="fc-time">12a</span> <span
																					class="fc-title">All Day Event</span>
																			</div></a></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="fc-row fc-week fc-widget-content"
													style="height: 84px;">
													<div class="fc-bg">
														<table>
															<tbody>
																<tr>
																	<td class="fc-day fc-widget-content fc-sun fc-past"
																		data-date="2015-06-07"></td>
																	<td class="fc-day fc-widget-content fc-mon fc-past"
																		data-date="2015-06-08"></td>
																	<td class="fc-day fc-widget-content fc-tue fc-past"
																		data-date="2015-06-09"></td>
																	<td class="fc-day fc-widget-content fc-wed fc-past"
																		data-date="2015-06-10"></td>
																	<td class="fc-day fc-widget-content fc-thu fc-past"
																		data-date="2015-06-11"></td>
																	<td class="fc-day fc-widget-content fc-fri fc-past"
																		data-date="2015-06-12"></td>
																	<td class="fc-day fc-widget-content fc-sat fc-past"
																		data-date="2015-06-13"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-number fc-sun fc-past"
																		data-date="2015-06-07">7</td>
																	<td class="fc-day-number fc-mon fc-past"
																		data-date="2015-06-08">8</td>
																	<td class="fc-day-number fc-tue fc-past"
																		data-date="2015-06-09">9</td>
																	<td class="fc-day-number fc-wed fc-past"
																		data-date="2015-06-10">10</td>
																	<td class="fc-day-number fc-thu fc-past"
																		data-date="2015-06-11">11</td>
																	<td class="fc-day-number fc-fri fc-past"
																		data-date="2015-06-12">12</td>
																	<td class="fc-day-number fc-sat fc-past"
																		data-date="2015-06-13">13</td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td rowspan="2"></td>
																	<td rowspan="2"></td>
																	<td rowspan="2"></td>
																	<td class="fc-event-container" colspan="3"><a
																		class="fc-day-grid-event fc-event fc-start fc-end fc-draggable"><div
																				class="fc-content">
																				<span class="fc-time">12a</span> <span
																					class="fc-title">Long Event</span>
																			</div></a></td>
																	<td rowspan="2"></td>
																</tr>
																<tr>
																	<td></td>
																	<td></td>
																	<td class="fc-event-container"><a
																		class="fc-day-grid-event fc-event fc-start fc-end fc-draggable"><div
																				class="fc-content">
																				<span class="fc-time">4p</span> <span
																					class="fc-title">Repeating Event</span>
																			</div></a></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="fc-row fc-week fc-widget-content"
													style="height: 84px;">
													<div class="fc-bg">
														<table>
															<tbody>
																<tr>
																	<td class="fc-day fc-widget-content fc-sun fc-past"
																		data-date="2015-06-14"></td>
																	<td
																		class="fc-day fc-widget-content fc-mon fc-today fc-state-highlight"
																		data-date="2015-06-15"></td>
																	<td class="fc-day fc-widget-content fc-tue fc-future"
																		data-date="2015-06-16"></td>
																	<td class="fc-day fc-widget-content fc-wed fc-future"
																		data-date="2015-06-17"></td>
																	<td class="fc-day fc-widget-content fc-thu fc-future"
																		data-date="2015-06-18"></td>
																	<td class="fc-day fc-widget-content fc-fri fc-future"
																		data-date="2015-06-19"></td>
																	<td class="fc-day fc-widget-content fc-sat fc-future"
																		data-date="2015-06-20"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-number fc-sun fc-past"
																		data-date="2015-06-14">14</td>
																	<td
																		class="fc-day-number fc-mon fc-today fc-state-highlight"
																		data-date="2015-06-15">15</td>
																	<td class="fc-day-number fc-tue fc-future"
																		data-date="2015-06-16">16</td>
																	<td class="fc-day-number fc-wed fc-future"
																		data-date="2015-06-17">17</td>
																	<td class="fc-day-number fc-thu fc-future"
																		data-date="2015-06-18">18</td>
																	<td class="fc-day-number fc-fri fc-future"
																		data-date="2015-06-19">19</td>
																	<td class="fc-day-number fc-sat fc-future"
																		data-date="2015-06-20">20</td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td rowspan="2"></td>
																	<td class="fc-event-container"><a
																		class="fc-day-grid-event fc-event fc-start fc-end fc-draggable">
																		<div class="fc-content">
																				<span class="fc-time">10:30a</span> <span
																					class="fc-title">Meeting</span>
																			</div></a></td>
																	<td class="fc-event-container" rowspan="2"><a
																		class="fc-day-grid-event fc-event fc-start fc-end fc-draggable">
																		<div class="fc-content">
																				<span class="fc-time">7p</span> <span
																					class="fc-title">Birthday Party</span>
																			</div></a></td>
																	<td rowspan="2"></td>
																	<td rowspan="2"></td>
																	<td class="fc-event-container" rowspan="2"><a
																		class="fc-day-grid-event fc-event fc-start fc-end fc-draggable">
																		<div class="fc-content">
																				<span class="fc-time">4p</span> <span
																					class="fc-title">Repeating Event</span>
																			</div></a></td>
																	<td rowspan="2"></td>
																</tr>
																<tr>
																	<td class="fc-event-container"><a
																		class="fc-day-grid-event fc-event fc-start fc-end fc-draggable"><div
																				class="fc-content">
																				<span class="fc-time">12p</span> <span
																					class="fc-title">Lunch</span>
																			</div></a></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="fc-row fc-week fc-widget-content"
													style="height: 84px;">
													<div class="fc-bg">
														<table>
															<tbody>
																<tr>
																	<td class="fc-day fc-widget-content fc-sun fc-future"
																		data-date="2015-06-21"></td>
																	<td class="fc-day fc-widget-content fc-mon fc-future"
																		data-date="2015-06-22"></td>
																	<td class="fc-day fc-widget-content fc-tue fc-future"
																		data-date="2015-06-23"></td>
																	<td class="fc-day fc-widget-content fc-wed fc-future"
																		data-date="2015-06-24"></td>
																	<td class="fc-day fc-widget-content fc-thu fc-future"
																		data-date="2015-06-25"></td>
																	<td class="fc-day fc-widget-content fc-fri fc-future"
																		data-date="2015-06-26"></td>
																	<td class="fc-day fc-widget-content fc-sat fc-future"
																		data-date="2015-06-27"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-number fc-sun fc-future"
																		data-date="2015-06-21">21</td>
																	<td class="fc-day-number fc-mon fc-future"
																		data-date="2015-06-22">22</td>
																	<td class="fc-day-number fc-tue fc-future"
																		data-date="2015-06-23">23</td>
																	<td class="fc-day-number fc-wed fc-future"
																		data-date="2015-06-24">24</td>
																	<td class="fc-day-number fc-thu fc-future"
																		data-date="2015-06-25">25</td>
																	<td class="fc-day-number fc-fri fc-future"
																		data-date="2015-06-26">26</td>
																	<td class="fc-day-number fc-sat fc-future"
																		data-date="2015-06-27">27</td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="fc-row fc-week fc-widget-content"
													style="height: 84px;">
													<div class="fc-bg">
														<table>
															<tbody>
																<tr>
																	<td class="fc-day fc-widget-content fc-sun fc-future"
																		data-date="2015-06-28"></td>
																	<td class="fc-day fc-widget-content fc-mon fc-future"
																		data-date="2015-06-29"></td>
																	<td class="fc-day fc-widget-content fc-tue fc-future"
																		data-date="2015-06-30"></td>
																	<td
																		class="fc-day fc-widget-content fc-wed fc-other-month fc-future"
																		data-date="2015-07-01"></td>
																	<td
																		class="fc-day fc-widget-content fc-thu fc-other-month fc-future"
																		data-date="2015-07-02"></td>
																	<td
																		class="fc-day fc-widget-content fc-fri fc-other-month fc-future"
																		data-date="2015-07-03"></td>
																	<td
																		class="fc-day fc-widget-content fc-sat fc-other-month fc-future"
																		data-date="2015-07-04"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-number fc-sun fc-future"
																		data-date="2015-06-28">28</td>
																	<td class="fc-day-number fc-mon fc-future"
																		data-date="2015-06-29">29</td>
																	<td class="fc-day-number fc-tue fc-future"
																		data-date="2015-06-30">30</td>
																	<td
																		class="fc-day-number fc-wed fc-other-month fc-future"
																		data-date="2015-07-01">1</td>
																	<td
																		class="fc-day-number fc-thu fc-other-month fc-future"
																		data-date="2015-07-02">2</td>
																	<td
																		class="fc-day-number fc-fri fc-other-month fc-future"
																		data-date="2015-07-03">3</td>
																	<td
																		class="fc-day-number fc-sat fc-other-month fc-future"
																		data-date="2015-07-04">4</td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td class="fc-event-container"><a
																		class="fc-day-grid-event fc-event fc-start fc-end fc-draggable"
																		href="http://google.com/"><div class="fc-content">
																				<span class="fc-time">12a</span> <span
																					class="fc-title">Click for Google</span>
																			</div></a></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="fc-row fc-week fc-widget-content"
													style="height: 85px;">
													<div class="fc-bg">
														<table>
															<tbody>
																<tr>
																	<td
																		class="fc-day fc-widget-content fc-sun fc-other-month fc-future"
																		data-date="2015-07-05"></td>
																	<td
																		class="fc-day fc-widget-content fc-mon fc-other-month fc-future"
																		data-date="2015-07-06"></td>
																	<td
																		class="fc-day fc-widget-content fc-tue fc-other-month fc-future"
																		data-date="2015-07-07"></td>
																	<td
																		class="fc-day fc-widget-content fc-wed fc-other-month fc-future"
																		data-date="2015-07-08"></td>
																	<td
																		class="fc-day fc-widget-content fc-thu fc-other-month fc-future"
																		data-date="2015-07-09"></td>
																	<td
																		class="fc-day fc-widget-content fc-fri fc-other-month fc-future"
																		data-date="2015-07-10"></td>
																	<td
																		class="fc-day fc-widget-content fc-sat fc-other-month fc-future"
																		data-date="2015-07-11"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td
																		class="fc-day-number fc-sun fc-other-month fc-future"
																		data-date="2015-07-05">5</td>
																	<td
																		class="fc-day-number fc-mon fc-other-month fc-future"
																		data-date="2015-07-06">6</td>
																	<td
																		class="fc-day-number fc-tue fc-other-month fc-future"
																		data-date="2015-07-07">7</td>
																	<td
																		class="fc-day-number fc-wed fc-other-month fc-future"
																		data-date="2015-07-08">8</td>
																	<td
																		class="fc-day-number fc-thu fc-other-month fc-future"
																		data-date="2015-07-09">9</td>
																	<td
																		class="fc-day-number fc-fri fc-other-month fc-future"
																		data-date="2015-07-10">10</td>
																	<td
																		class="fc-day-number fc-sat fc-other-month fc-future"
																		data-date="2015-07-11">11</td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	        <div class="col-lg-4" style="text-align:center">
	       <h2>Tuteur</h2>
	       	<p>Nom Prénom</p>
	       	<p>E-mail</p>
	       	<p>Remarques tuteur :</p>
	       </div>
       </div>
     </div>
	

<%@ include file="include/bas_de_page.jsp" %>
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

        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green'
        });

    /* initialize the external events
     -----------------------------------------------------------------*/


    $('#external-events div.external-event').each(function() {

        // store data so the calendar knows to render an event upon drop
        $(this).data('event', {
            title: $.trim($(this).text()), // use the element's text as the event title
            stick: true // maintain when user navigates (see docs on the renderEvent method)
        });

        // make the event draggable using jQuery UI
        $(this).draggable({
            zIndex: 1111999,
            revert: true,      // will cause the event to go back to its
            revertDuration: 0  //  original position after the drag
        });

    });


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
        editable: true,
        droppable: true, // this allows things to be dropped onto the calendar
        drop: function() {
            // is the "remove after drop" checkbox checked?
            if ($('#drop-remove').is(':checked')) {
                // if so, remove the element from the "Draggable Events" list
                $(this).remove();
            }
        },
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