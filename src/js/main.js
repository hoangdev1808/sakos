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
	let historySlide = new Swiper(".wrapper-history .swiper-container", {
		loop: false,
		speed: 2000,
		spaceBetween: 30,
		observer: true,
		observeParents: true,
		navigation: {
			nextEl: ".wrapper-history .swiper-button-next",
			prevEl: ".wrapper-history .swiper-button-prev",
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
				spaceBetween: 30,
			},
			1280: {
				spaceBetween: 30,
				slidesPerView: 6,
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
	let otherNews = new Swiper(".swiper-discount-other .swiper-container", {
		loop: true,
		speed: 2000,
		spaceBetween: 30,
		observer: true,
		observeParents: true,
		autoplay: {
			delay: 3000,
		},
		navigation: {
			nextEl: ".swiper-discount-other .swiper-button-next",
			prevEl: ".swiper-discount-other .swiper-button-prev",
		},
		breakpoints: {
			320: {
				spaceBetween: 10,
				slidesPerView: 1,
			},
			768: {
				spaceBetween: 20,
				slidesPerView: 2,
			},
			1024: {
				spaceBetween: 30,
				slidesPerView: 3,
			},
		},
	});
	let galleryThumbs = new Swiper('.wrap-slide-detail .gallery-thumbs', {
		direction: 'vertical',
		spaceBetween: 25,
		slidesPerView: 5,
		loopedSlides: 5,
		loop: true,
		watchSlidesVisibility: true,
		watchSlidesProgress: true,
		breakpoints: {
			320: {
				direction: 'horizontal',
				slidesPerView: 2,
				spaceBetween: 10
			},
			376: {
				direction: 'horizontal',
				slidesPerView: 3,
				spaceBetween: 10
			},
			576: {
				direction: 'horizontal',
				slidesPerView: 3,
				spaceBetween: 10
			},
			768: {
				direction: 'horizontal',
				slidesPerView: 4,
				spaceBetween: 10
			},
			1025: {
				slidesPerView: 4,
			},
			1200: {
				slidesPerView: 5,
			},
		},
	});
	let galleryTop = new Swiper('.wrap-slide-detail .gallery-top', {
		spaceBetween: 30,
		observer: true,
		observeParents: true,
		loop: true,
		navigation: {
			nextEl: '.gallery-top .swiper-button-next',
			prevEl: '.gallery-top .swiper-button-prev',
		},
		pagination: {
			el: '.gallery-thumbs .swiper-pagination',
			clickable: true,
		},
		thumbs: {
			swiper: galleryThumbs,
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

/*==================== SCROLL SECTION ===================*/
const crollToDiv = () => {
	if ($(window).width() >= 992) {
		$(' #catelogry li a').on('click', function (event) {
			$(this).parent('li').addClass('active');
			event.preventDefault();
			var $section = $($(this).attr('href'));
			$('html, body').animate({
				scrollTop: $section.offset().top - $(".catelogry").outerHeight() - $("header").outerHeight()
			});

			window.addEventListener("scroll", function () {
				let bannerheight = $('#pagebanner').outerHeight();
				let headerHeight = $('header').outerHeight();

				if (window.pageYOffset > bannerheight) {
					$(".catelogry").addClass("scolled");
					$(".catelogry").css('top', headerHeight)
				} else {
					$(".catelogry").removeClass("scolled");
					$(".catelogry").css('top', 0)
				}
			});
		});
	}
	$('[data-scroll]').on('click', function () {
		$('[data-scroll]').not(this).parent('li').removeClass('active')
	});
	if ($('#catelogry').length >= 1 && $(window).width() >= 992) {
		window.addEventListener("scroll", function () {
			var bannerheight = $('#pagebanner').outerHeight();
			var heightHeader = $('header').outerHeight();
			if (window.pageYOffset > bannerheight) {
				$(".catelogry").addClass("scolled");
				$('.scolled').css('top', heightHeader)
			} else {
				$(".catelogry").removeClass("scolled");
				$(".catelogry").css('top', 0)
			}
		})
		$(window).scroll(function () {
			var scrollDistance = $(window).scrollTop();
			$("#about-page section").each(function (i) {
				if ($(this).position().top - $(".catelogry").outerHeight() - $("header").outerHeight() - 1 <= scrollDistance) {
					$(".catelogry #catelogry li.active").removeClass("active");
					$(".catelogry #catelogry li").eq(i).addClass("active");
				}
			});
		})
	}
	if ($(window).width() < 992) {
		$(' #catelogry li a').on('click', function (event) {
			$(this).parent('li').addClass('active');
			event.preventDefault();
			var $section = $($(this).attr('href'));
			$('html, body').animate({
				scrollTop: $section.offset().top - $("header").outerHeight()
			});
			if ($(window).width() >= 992) {
				window.addEventListener("scroll", function () {
					let bannerheight = $('#pagebanner').outerHeight();
					let headerHeight = $('header').outerHeight();

					if (window.pageYOffset > bannerheight) {
						$(".catelogry").addClass("scolled");
						$(".catelogry").css('top', headerHeight)
					} else {
						$(".catelogry").removeClass("scolled");
						$(".catelogry").css('top', 0)
					}
				});
			}

		});
		window.addEventListener("scroll", function () {
			let bannerheight = $('#pagebanner').outerHeight();
			let headerHeight = $('header').outerHeight();
			const tabPanel = () => {
				$(".support-page .wrap-right ul li .title").on("click", function (e) {
					var t = $(this).closest("li").find(".content");
					$(this)
						.closest(".support-page .wrap-right ul")
						.find(".content")
						.not(t)
						.slideUp();
					$(this).hasClass("active") ?
						$(this).removeClass("active") :
						($(this)
							.closest(".support-page .wrap-right ul")
							.find(".title.active")
							.removeClass("active"),
							$(this).addClass("active")),
						t.stop(!1, !0).slideToggle(),
						e.preventDefault();
				})
			}
			/*==================== INIT MAPPING ====================*/

			if (window.pageYOffset > bannerheight && $('#about-page').length >= 1) {
				$(".catelogry").css({
					'top': headerHeight,
					'position': 'fixed'
				})
				$('#tool-item').css({
					'top': headerHeight,
					'position': 'fixed'
				})
			} else {
				$(".catelogry").css({
					'top': 0,
					'position': 'absolute'
				})
				$('#tool-item').css({
					'top': 0,
					'position': 'absolute'
				})
			}
		});
		$('#tool-item').on('click', function () {
			$('#about-page .catelogry').find('#catelogry').slideToggle()
		});
		$('#tool-item').on('click', function () {
			$(this).next().toggleClass('active')
		});
	}
}

/*==================== ACCORDIAN ===================*/
const accordianTable = () => {
	$('.toggle').on('click', function () {
		$(this).toggleClass('active')
		$(this).next().find('.wrap-content').slideToggle();
		$(this).find('.title em').toggleClass('active')
		$('.toggle').not(this).next().find('.wrap-content').slideUp();
		$('.toggle').not(this).find('.title em').removeClass('active');
		$('.toggle').not(this).removeClass('active');
	});
	$('.btn-view').on('click', function () {
		$(this).parent().find('.wrap-content').slideToggle();
		$('.btn-view').not(this).parent().find('.wrap-content').slideUp()
	})
}
const accordianList = () => {
	$('.accordion-title em').on('click', function (e) {
		let $this = $(this);
		e.preventDefault();
		if ($this.parent().next().hasClass('show')) {
			$this.parent().next().removeClass('show');
			$this.parent().next().slideUp(350);
			$this.parents().removeClass('active');
		} else {
			$this.parent().parents().find('.nav-sub').removeClass('show');
			$this.parent().parents().find('.nav-sub').slideUp(350);
			$this.parent().parents().find('li').removeClass('active');
			$this.parent().next().toggleClass('show');
			$this.parent().next().slideDown(350);
			$this.parents('li').addClass('active');
		}
	});
	$('.btn-dropdown').on('click', function () {
		$(this).toggleClass('active');
		$(this).parent().next().slideToggle();
		$('.btn-dropdown').not(this).parent().next().slideUp();
		$('.btn-dropdown').not(this).removeClass('active')
	})
}
/*==================== LOAD FUNCTION ====================*/
$(document).ready(function () {
	scrollTop();
	mainMenu();
	initSwiper();
	checkLayoutBanner();
	setBackgroundElement();
	crollToDiv();
	accordianTable();
	accordianList();

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
	$(function () {
		$("#slider").slider({
			range: "min",
			value: 500000,
			min: 0,
			max: 15000000,
			step: 500000,
			slide: function (event, ui) {
				$(ui.handle).find('.tooltip').text(ui.value + " VND");
				$("#amount").val(ui.value + "VND");
			},
			create: function (event, ui) {
				var tooltip = $('<div class="tooltip" />');
				$(event.target).find('.ui-slider-handle').append(tooltip);
			},
			change: function (event, ui) {
				$('#hidden').attr('value', ui.value);
			}
		});
		$("#amount").val($("#slider").slider("value") + "đ");
	});
});
