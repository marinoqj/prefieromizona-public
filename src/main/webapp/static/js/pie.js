	$(document).ready(function () {
		showOrHideFooter();
	});
	
	
	$(window).resize(function () {
		showOrHideFooter();
	});
	
	function showOrHideFooter() {
		let windowHeight = $(window).height();
		let documentHeight = $(document).height();
		let footer = document.querySelector('footer');

		if (documentHeight <= windowHeight) {
			footer.classList.add('fixed-bottom');
		} else {
			footer.classList.remove('fixed-bottom');
		}
	}
