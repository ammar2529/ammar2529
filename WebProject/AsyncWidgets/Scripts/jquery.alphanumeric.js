/*
* Every time the form field is changed, sanitize its contents with the given
* function to only allow input of a certain form.
*/
/*
(function ($) {
    var inputEvents = "input";
    if (!("oninput" in document || "oninput" in $("<input>")[0])) {
        inputEvents += " keypress keyup";
    }

    jQuery.fn.restrict = function (sanitizationFunc) {
        $(this).bind(inputEvents, function (e) {
            if (e.keyCode > 36 && e.keyCode < 41 || e.keyCode ==8) return;
            $(this).val(sanitizationFunc($(this).val()));
        });
    };
    */
    /*
    * Every time the form field is changed, modify its contents by eliminating
    * matches for the given regular expression within the field.
   
    jQuery.fn.regexRestrict = function (regex) {
        var sanitize = function (text) {
            return text.replace(regex, '');
        };
        $(this).restrict(sanitize);
    }
})(jQuery);

 */

/* These functions require the jquery.formrestrict.js functions to work!
*
* These functions can be used to replace the functionality of the jQuery
* AlphaNumeric plugin. The usage of this plugin is almost identical to that of
* the AlphaNumeric plugin.


(function ($) {
    jQuery.fn.alphanumeric = function (r) {
        alphanumericHelper(this, r, true, true);
    };
    jQuery.fn.numeric = function (r) {
        alphanumericHelper(this, r, false, true);
    };
    jQuery.fn.alpha = function (r) {
        alphanumericHelper(this, r, true, false);
    };
    var alphanumericHelper = function (obj, restraints, alpha, numeric) {
        var regex = "";
        if (numeric)
            regex += "0-9";
        if (alpha) {
            if (restraints == undefined || !restraints.allcaps)
                regex += "a-z";
            if (restraints == undefined || !restraints.nocaps)
                regex += "A-Z";
        }
        if (restraints != undefined && restraints.allow != undefined)
            regex += RegExp.escape(restraints.allow);

        $(obj).regexRestrict(RegExp("[^" + regex + "]", "g"))
    };
})(jQuery);

*/
/*
* Function created by Colin Snover in response to an article by Simon Willison
* on Regular Expression escaping in JavaScript:
* http://simonwillison.net/2006/Jan/20/escape/
*/
RegExp.escape = function (text) {
    return text.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&");
};




(function($){

	$.fn.alphanumeric = function(p) { 

		p = $.extend({
			ichars: "!@#$%^&*()+=[]\\\';,/{}|\":<>?~`.- ",
			nchars: "",
			allow: ""
		  }, p);	

		return this.each
			(
				function() 
				{

					if (p.nocaps) p.nchars += "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
					if (p.allcaps) p.nchars += "abcdefghijklmnopqrstuvwxyz";
					
					s = p.allow.split('');
					for ( i=0;i<s.length;i++) if (p.ichars.indexOf(s[i]) != -1) s[i] = "\\" + s[i];
					p.allow = s.join('|');
					
					var reg = new RegExp(p.allow,'gi');
					var ch = p.ichars + p.nchars;
					ch = ch.replace(reg,'');

					$(this).keypress
						(
							function (e)
								{
								
									if (!e.charCode) k = String.fromCharCode(e.which);
										else k = String.fromCharCode(e.charCode);
										
									if (ch.indexOf(k) != -1) e.preventDefault();
									if (e.ctrlKey&&k=='v') e.preventDefault();
									
								}
								
						);
						
					$(this).bind('contextmenu',function () {return false});
									
				}
			);

	};

	$.fn.numeric = function(p) {
	
		var az = "abcdefghijklmnopqrstuvwxyz";
		az += az.toUpperCase();

		p = $.extend({
			nchars: az
		  }, p);	
		  	
		return this.each (function()
			{
				$(this).alphanumeric(p);
			}
		);
			
	};
	
	$.fn.alpha = function(p) {

		var nm = "1234567890";

		p = $.extend({
			nchars: nm
		  }, p);	

		return this.each (function()
			{
				$(this).alphanumeric(p);
			}
		);
			
	};	

})(jQuery);
