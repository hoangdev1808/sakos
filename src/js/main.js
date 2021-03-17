/*==================== SHOW SCROLL TOP ====================*/
const scrollTop = () => {
	let headerHeight = $("header").outerHeight();
	let bannerHeight = $("#section-banner").outerHeight();
	$(window).scroll(function () {
		if ($(this).scrollTop() > headerHeight) {
			$("#scroll-top").addClass("show-scroll");
		} else {
			$("#scroll-top").removeClass("show-scroll");
		}
	});

	$("#scroll-top").on("click", function (e) {
		e.preventDefault();
		$("html,body").animate({
			scrollTop: 0,
		});
	});
}

/*==================== MAIN MENU MOBILE ====================*/
const mainMenu = () => {
	$("header").find(".btn-toggle")
		.on("click", function () {
			$(this).toggleClass("active");
			$("#overlay").toggleClass("active");
			$("header").find('.nav').toggleClass('active');
			if ($('header').find('.megasub').hasClass('active')) {
				$('header').find('.megasub').removeClass('active')
			}
		});
	$("header").find(".btn-sub")
		.on("click", function () {
			$(this).parent().next().toggleClass('active')
		});
	$("header").find(".btnsub")
		.on("click", function () {
			$(this).parent().next().toggleClass('active');
		})
	$("#overlay").on('click', function () {
		let $this = $(this);
		$this.removeClass('active');
		$('.btn-toggle').removeClass('active');
	});
	$('.turn-back ').on('click', function () {
		if ($(this).closest('.megasub').find('.megasub__dropdown').hasClass('active')) {
			$(this).closest('.megasub').find('.megasub__dropdown').removeClass('active')
		} else {
			$(this).closest('.megasub').removeClass('active')
		}
	});

}


/*==========LISTBANNER SLIDER==========*/
const initSwiper = () => {
	let myswiper = new Swiper(".home-banner .swiper-container", {
		loop: false,
		speed: 2000,
		effect: "fade",
		autoplay: {
			delay: 3000,
			disableOnInteraction: false,
		},
		fadeEffect: {
			crossFade: true,
		},
		pagination: {
			el: '.home-banner .swiper-pagination',
			type: 'bullets',
			clickable: true,
		},
	});
	let headerSlide = new Swiper(".wrapper-middle .swiper-container", {
		loop: false,
		speed: 2000,
		slidesPerView: 1,
		spaceBetween: 30,
		autoplay: {
			delay: 3000,
			disableOnInteraction: false,
		},
		navigation: {
			nextEl: ".wrapper-middle .swiper-button-next",
			prevEl: ".wrapper-middle .swiper-button-prev",
		},
	});
	let productSpecailHome = new Swiper(".wrap-slide .swiper-container", {
		loop: true,
		speed: 2000,
		spaceBetween: 30,
		observer: true,
		observeParents: true,
		navigation: {
			nextEl: ".wrap-slide .swiper-button-next",
			prevEl: ".wrap-slide .swiper-button-prev",
		},
		breakpoints: {
			320: {
				slidesPerView: 1,
				spaceBetween: 10,
			},
			375: {
				slidesPerView: 1,
				spaceBetween: 10,
			},
			575: {
				slidesPerView: 1,
				spaceBetween: 10,
			},
			768: {
				slidesPerView: 2,
				spaceBetween: 20,
			},
			1280: {
				spaceBetween: 30,
				slidesPerView: 4,
			},
		},
	});
	let experienceHome = new Swiper(".wrapper-slide .swiper-container", {
		loop: true,
		speed: 2000,
		spaceBetween: 30,
		observer: true,
		observeParents: true,
		navigation: {
			nextEl: ".wrapper-slide .swiper-button-next",
			prevEl: ".wrapper-slide .swiper-button-prev",
		},
		breakpoints: {
			320: {
				slidesPerView: 1,
				spaceBetween: 10,
			},
			375: {
				slidesPerView: 1,
				spaceBetween: 10,
			},
			575: {
				slidesPerView: 1,
				spaceBetween: 10,
			},
			768: {
				slidesPerView: 2,
				spaceBetween: 20,
			},
			1280: {
				spaceBetween: 30,
				slidesPerView: 5,
			},
		},
	});
	let partnerHome = new Swiper(".wrap-partner .swiper-container", {
		loop: true,
		speed: 2000,
		spaceBetween: 30,
		observer: true,
		observeParents: true,
		navigation: {
			nextEl: ".wrap-partner .swiper-button-next",
			prevEl: ".wrap-partner .swiper-button-prev",
		},
		breakpoints: {
			320: {
				slidesPerView: 2,
				spaceBetween: 10,
			},
			375: {
				slidesPerView: 3,
				spaceBetween: 10,
			},
			575: {
				slidesPerView: 3,
				spaceBetween: 10,
			},
			768: {
				slidesPerView: 4,
				spaceBetween: 20,
			},
			1280: {
				spaceBetween: 30,
				slidesPerView: 6,
			},
		},
	});
}
// ===========================CHECK BANNER=========================//
const checkLayoutBanner = () => {
	const pagesBanner = $("#pagebanner");
	const heightHeader = $("header").outerHeight();
	const mainBanner = $("#home-banner");
	if (mainBanner.length >= 1) {
		$("main").css("padding-top", heightHeader);
	} else if (pagesBanner.length >= 1) {
		$("main").css("padding-top", heightHeader);
	} else {
		$("main").css("padding-top", heightHeader);
	}
};

/*===================BACKGROUNDELEMENT===========*/
const setBackgroundElement = () => {
	$("[setBackground]").each(function () {
		let background = $(this).attr("setBackground");
		$(this).css({
			"background-image": "url(" + background + ")",
			"background-size": "cover",
			"background-position": "center center",
		});
	});
	$("[setBackgroundRepeat]").each(function () {
		let background = $(this).attr("setBackgroundRepeat");
		$(this).css({
			"background-image": "url(" + background + ")",
			"background-repeat": "repeat",
		});
	});
};

const tabPanel = () => {
	$(".support-page .wrap-right ul li .title").on("click", function(e) {
		var t = $(this).closest("li").find(".content");
		$(this)
			.closest(".support-page .wrap-right ul")
			.find(".content")
			.not(t)
			.slideUp();
		$(this).hasClass("active")
			? $(this).removeClass("active")
			: ($(this)
					.closest(".wrap-card")
					.find(".title.active")
					.removeClass("active"),
			  $(this).addClass("active")),
			t.stop(!1, !0).slideToggle(),
			e.preventDefault();
	})
} 
/*==================== INIT MAPPING ====================*/

/*==================== LOAD FUNCTION ====================*/
$(document).ready(function () {
	scrollTop();
	mainMenu();
	initSwiper();
	checkLayoutBanner();
	setBackgroundElement();
	tabPanel();

	/*==================== LIST TAB =========================*/
	var theTabs = $(".nav-tabs li");
	var i;

	function theTabClicks(tabClickEvent) {
		var clickedTab = tabClickEvent.currentTarget;
		var tabParent = tabClickEvent.currentTarget.parentNode.parentNode.parentNode;
		var theTabs = tabParent.querySelectorAll(".nav-tabs li");
		for (var i = 0; i < theTabs.length; i++) {
			theTabs[i].classList.remove("active");
		}

		clickedTab.classList.add("active");
		tabClickEvent.preventDefault();
		var contentPanes = tabParent.querySelectorAll(".tab-pane");
		for (i = 0; i < contentPanes.length; i++) {
			contentPanes[i].classList.remove("active");
		}
		var anchorReference = tabClickEvent.target;
		var activePaneId = anchorReference.getAttribute("href");
		var activePane = tabParent.querySelector(activePaneId);
		activePane.classList.add("active");
	}
	for (i = 0; i < theTabs.length; i++) {
		theTabs[i].addEventListener("click", theTabClicks)
	}
});
