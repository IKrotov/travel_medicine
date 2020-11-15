// $('#team-block').load('team.html');

// function loadTeamMate() {
// 	$('#pre-team').removeClass('hidden');
// 	$('#team-block').load('test.html');
// 	$('#team-block').on('load', function() {
// 		$('#pre-team').fadeOut('slow')
// 	});
// };

// jQuery(document).ready(function($) {

$(window).on('load', function(){
	$('#pre-main').fadeOut('slow')

	
	if ($(window).scrollTop() > 200) {
		$('header').addClass('bg-navbar');
	};

  	$(window).scroll(function() {
	var header = $('header');
	var scrollPos = $(window).scrollTop();    

	    if (scrollPos > 200) {
	      header.removeClass('navbar-transparent');
	      header.addClass('bg-navbar');
	    } else {
	      header.removeClass('bg-navbar');
	      header.addClass('navbar-transparent');
	    }
  	});

  	// Add scrollspy to <body>
	$('body').scrollspy({target: "#navbar", offset: 0});
	// Add smooth scrolling on all links inside the navbar
	$("#navbar a").on('click', function() {
	  // Make sure this.hash has a value before overriding default behavior
	  if (this.hash !== "") {
	    // Prevent default anchor click behavior
	    event.preventDefault();
	    // Store hash
	    var hash = this.hash;
	    // Using jQuery's animate() method to add smooth page scroll
	    // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
	    $('html, body').animate({
	      scrollTop: $(hash).offset().top
	    }, 600, function(){
	    // Add hash (#) to URL when done scrolling (default click behavior)
	      window.location.hash = hash;
	    });
	  } // End if
	});

	$('.navbar-brand').on("click",function() {
	    $('html, body').animate({ scrollTop: 0 }, '600', function () {
	    });
	});

	$('.navbar-collapse a').click(function(){
    	$(".navbar-collapse").collapse('hide');
	});

	$('.navbar-brand').click(function(){
    	$(".navbar-collapse").collapse('hide');
	});

	$('#team-block .main-cards').hover(function() {
		$(this).addClass('active-mate');
	}, function() {
		$(this).removeClass('active-mate');
	});
    
    //function to check that the element is on the viewport
    (function($, win) {
        $.fn.inViewport = function(cb) {
            return this.each(function(i,el){
                function visPx(){
                    var H = $(this).height()*0.8,
                    r = el.getBoundingClientRect(), t=r.top, b=r.bottom;
                    return cb.call(el, Math.max(0, t>0? H-t : (b<H?b:H)));  
                } visPx();
                $(win).on("resize scroll", visPx);
            });
        };
    }(jQuery, window));



    $(".scroll-anim").inViewport(function(px){
        if(px){
            $(this).removeClass("scroll-anim");
            $(this).addClass("animation");
            $(this).removeClass("hide");
        }
    });


	// $('#team-block .main-cards .photo img').on("click",function() {
	// 	$('#team-block .main-cards').fadeOut('slow');
	// 	setTimeout(loadTeamMate,200);
	// });
});
// });





