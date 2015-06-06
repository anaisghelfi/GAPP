/*
 *
 *   INSPINIA - Responsive Admin Theme
 *   version 2.0
 *
 */

$(document).ready(function () {

    // Add body-small class if window less than 768px
    if ($(this).width() < 769) {
        $('body').addClass('body-small')
    } else {
        $('body').removeClass('body-small')
    }

    // MetsiMenu
    $('#side-menu').metisMenu();

    // Collapse ibox function
    $('.collapse-link').click( function() {
        var ibox = $(this).closest('div.ibox');
        var button = $(this).find('i');
        var content = ibox.find('div.ibox-content');
        content.slideToggle(200);
        button.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down');
        ibox.toggleClass('').toggleClass('border-bottom');
        setTimeout(function () {
            ibox.resize();
            ibox.find('[id^=map-]').resize();
        }, 50);
    });

    // Close ibox function
    $('.close-link').click( function() {
        var content = $(this).closest('div.ibox');
        content.remove();
    });

    // Close menu in canvas mode
    $('.close-canvas-menu').click( function() {
        $("body").toggleClass("mini-navbar");
        SmoothlyMenu();
    });

    // Open close right sidebar
    $('.right-sidebar-toggle').click(function(){
        $('#right-sidebar').toggleClass('sidebar-open');
    });

    // Initialize slimscroll for right sidebar
    $('.sidebar-container').slimScroll({
        height: '100%',
        railOpacity: 0.4,
        wheelStep: 10
    });

    // Open close small chat
    $('.open-small-chat').click(function(){
        $(this).children().toggleClass('fa-comments').toggleClass('fa-remove');
        $('.small-chat-box').toggleClass('active');
    });

    // Initialize slimscroll for small chat
    $('.small-chat-box .content').slimScroll({
        height: '234px',
        railOpacity: 0.4
    });

    // Small todo handler
    $('.check-link').click( function(){
        var button = $(this).find('i');
        var label = $(this).next('span');
        button.toggleClass('fa-check-square').toggleClass('fa-square-o');
        label.toggleClass('todo-completed');
        return false;
    });

    // Append config box / Only for demo purpose
    // Uncomment on server mode to enable XHR calls
    $.get("skin-config.html", function (data) {
        if (!$('body').hasClass('no-skin-config'))
            $('body').append(data);
    });

    // Minimalize menu
    $('.navbar-minimalize').click(function () {
        $("body").toggleClass("mini-navbar");
        SmoothlyMenu();

    });

    // Tooltips demo
    $('.tooltip-demo').tooltip({
        selector: "[data-toggle=tooltip]",
        container: "body"
    });

    // Move modal to body
    // Fix Bootstrap backdrop issu with animation.css
    $('.modal').appendTo("body");

    // Full height of sidebar
    function fix_height() {
        var heightWithoutNavbar = $("body > #wrapper").height() - 61;
        $(".sidebard-panel").css("min-height", heightWithoutNavbar + "px");

        var navbarHeigh = $('nav.navbar-default').height();
        var wrapperHeigh = $('#page-wrapper').height();

        if(navbarHeigh > wrapperHeigh){
            $('#page-wrapper').css("min-height", navbarHeigh + "px");
        }

        if(navbarHeigh < wrapperHeigh){
            $('#page-wrapper').css("min-height", $(window).height()  + "px");
        }

    }
    fix_height();

    // Fixed Sidebar
    $(window).bind("load", function () {
        if ($("body").hasClass('fixed-sidebar')) {
            $('.sidebar-collapse').slimScroll({
                height: '100%',
                railOpacity: 0.9
            });
        }
    })

    // Move right sidebar top after scroll
    $(window).scroll(function(){
        if ($(window).scrollTop() > 0 && !$('body').hasClass('fixed-nav') ) {
            $('#right-sidebar').addClass('sidebar-top');
        } else {
            $('#right-sidebar').removeClass('sidebar-top');
        }
    });

    $(document).bind("load resize scroll", function() {
        if(!$("body").hasClass('body-small')) {
            fix_height();
        }
    });

    $("[data-toggle=popover]")
        .popover();

    // Add slimscroll to element
    $('.full-height-scroll').slimscroll({
        height: '100%'
    })
});


// Minimalize menu when screen is less than 768px
$(window).bind("resize", function () {
    if ($(this).width() < 769) {
        $('body').addClass('body-small')
    } else {
        $('body').removeClass('body-small')
    }
});

// Local Storage functions
// Set proper body class and plugins based on user configuration
$(document).ready(function() {
    if (localStorageSupport) {

        var collapse = localStorage.getItem("collapse_menu");
        var fixedsidebar = localStorage.getItem("fixedsidebar");
        var fixednavbar = localStorage.getItem("fixednavbar");
        var boxedlayout = localStorage.getItem("boxedlayout");
        var fixedfooter = localStorage.getItem("fixedfooter");

        var body = $('body');

        if (fixedsidebar == 'on') {
            body.addClass('fixed-sidebar');
            $('.sidebar-collapse').slimScroll({
                height: '100%',
                railOpacity: 0.9
            });
        }

        if (collapse == 'on') {
            if(body.hasClass('fixed-sidebar')) {
                if(!body.hasClass('body-small')) {
                    body.addClass('mini-navbar');
                }
            } else {
                if(!body.hasClass('body-small')) {
                    body.addClass('mini-navbar');
                }

            }
        }

        if (fixednavbar == 'on') {
            $(".navbar-static-top").removeClass('navbar-static-top').addClass('navbar-fixed-top');
            body.addClass('fixed-nav');
        }

        if (boxedlayout == 'on') {
            body.addClass('boxed-layout');
        }

        if (fixedfooter == 'on') {
            $(".footer").addClass('fixed');
        }
    }
});

// check if browser support HTML5 local storage
function localStorageSupport() {
    return (('localStorage' in window) && window['localStorage'] !== null)
}

// For demo purpose - animation css script
function animationHover(element, animation){
    element = $(element);
    element.hover(
        function() {
            element.addClass('animated ' + animation);
        },
        function(){
            //wait for animation to finish before removing classes
            window.setTimeout( function(){
                element.removeClass('animated ' + animation);
            }, 2000);
        });
}

function SmoothlyMenu() {
    if (!$('body').hasClass('mini-navbar') || $('body').hasClass('body-small')) {
        // Hide menu in order to smoothly turn on when maximize menu
        $('#side-menu').hide();
        // For smoothly turn on menu
        setTimeout(
            function () {
                $('#side-menu').fadeIn(500);
            }, 100);
    } else if ($('body').hasClass('fixed-sidebar')) {
        $('#side-menu').hide();
        setTimeout(
            function () {
                $('#side-menu').fadeIn(500);
            }, 300);
    } else {
        // Remove all inline style from jquery fadeIn function to reset menu state
        $('#side-menu').removeAttr('style');
    }
}

// Dragable panels
function WinMove() {
    var element = "[class*=col]";
    var handle = ".ibox-title";
    var connect = "[class*=col]";
    $(element).sortable(
        {
            handle: handle,
            connectWith: connect,
            tolerance: 'pointer',
            forcePlaceholderSize: true,
            opacity: 0.8
        })
        .disableSelection();
}

function dramModalConfirm(id,type,name,action) {
	if(type == 'supprimerFamille') {
		var title = 'Etes-vous sûr de vouloir supprimer cette famille : "'+name+'" ?';
	}
	else if (type == 'supprimerCompetence') {
		var title = 'Etes-vous sûr de vouloir supprimer cette compétence : "'+name+'" ?';
	}

	var modal = '<div style="display:none" class="modal inmodal" id="modalConfirm" tabindex="-1" role="dialog" aria-hidden="false">'+
	    '<div class="modal-dialog">'+
	    '<div class="modal-content animated bounceInRight">'+
	    	'<form method="POST" action="'+action+'">'+
	            '<div class="modal-header">'+
	                '<button type="button" class="close" onclick="destroyConfirmModal()" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>'+
	                '<h4 class="modal-title">'+title+'</h4>'+
	                    '<input type="hidden" name="id" value="'+id+'" class="form-control" />'+
	            '</div>'+
	            '<div class="modal-footer">'+
	                '<button class="btn btn-white" onclick="destroyConfirmModal()" data-dismiss="modal">Annuler</button>'+
	                '<button type="submit" class="btn btn-danger">Confirmer la suppression</button>'+
	            '</div>'+
	            '</form>'+
	        '</div>'+
	    '</div>'+
	'</div>';
	
$('#wrapper').append(modal);
$('body').append('<div class="modal-backdrop in"></div>');
$("#modalConfirm").fadeIn(500);
	
console.log(id);
console.log(type);
console.log(action);
	
	
}

function destroyConfirmModal() {
	$("#modalConfirm").remove();
	$(".modal-backdrop").remove();
	
}

function update(type,param1,param2,param3) {
	if (type=="famille") {
		$("#idfamille").val(param1);
		$("#famillename").val(param2);
		$("#coefficientfamille").val(param3);
	}
	console.log("click");
}

//VERIFIER REMPLISSAGE DES CHAMPS
function ajouterfamille() {
	var nameBool = verfiBool("#addfamille");
	var coeffBool = verifCoeff("#addcoefficient");
	if ((nameBool && coeffBool) === true) {
		return true;
	}
	else {
		return false;
	}

}

function ajouterCompetence() {
	var nameBool = verfiBool("#addsouscompetence");
	if (nameBool === true) {
		return true;
	}
	else {
		return false;
	}
}

//Verification champs vide 
function verfiBool(id) {
	var value = $(id).val();
	$(id).css('border-color','#e5e6e7');
	if (value !== '') {
		return true;
	}
	else {
		$(id).css('border-color','#ed5565');
		return false;
	}
}

//verification coefficient 
function verifCoeff(id) {
	var value = $(id).val();
	var nAn = isNaN(value);
	$(id).css('border-color','#e5e6e7');
	if (value !== '' && nAn === false) {
		return true;
	}
	else {
		$(id).css('border-color','#ed5565');
		return false;
	}
}