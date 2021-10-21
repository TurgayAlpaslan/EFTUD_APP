window.addEvent('domready', function() {
	
	//create our Accordion instance
	var myAccordion = new Accordion($('accordion'), 'h3.toggler', 'div.element', {
		opacity: false,
		onActive: function(toggler, element){
			toggler.setStyle('color', '#41464D');					
		},
		onBackground: function(toggler, element){
			toggler.setStyle('color', '#528CE0');
		}
	});
//	/* hide using opacity on page load */
//	$('fb-modal').setStyles({
//		opacity:0,
//		display:'block'
//	});
	/* hiders */
//	$('fb-close').addEvent('click',function(e) { $('fb-modal').fade('out'); });
//	window.addEvent('keypress',function(e) { if(e.key == 'esc') { $('fb-modal').fade('out'); } });
//	$(document.body).addEvent('click',function(e) {
//		if($('fb-modal').get('opacity') == 1) {
//			$('fb-modal').fade('out');
//		}
//	});
	/* click to show */
//	$('fb-trigger').addEvent('click',function() {
//		$('fb-modal').fade('in');
//	});
});