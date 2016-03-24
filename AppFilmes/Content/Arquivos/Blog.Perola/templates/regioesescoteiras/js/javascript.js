jQuery(document).ready(function() {
	jQuery('.lof-navigator img').vAlign();
	
	jQuery('.lof-navigator li img').vAlign();
	
	jQuery('.bloco-chamada img').wrap('<div class="noticiaimg" />');
	
	jQuery('.noticias .img-intro-left').hide();
});






(function (jQuery) {
// VERTICALLY ALIGN FUNCTION
jQuery.fn.vAlign = function() {
	return this.each(function(i){
	var ah = jQuery(this).height();
	var ph = jQuery(this).parent().height();
	var mh = Math.ceil((ph-ah) / 2);
	jQuery(this).css('margin-top', mh);
	});
};
})(jQuery);