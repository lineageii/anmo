/* google analytics */
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-21068406-1']);
_gaq.push(['_trackPageview']);

(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();


$(function(){
	topicPath();
	pageTop();
	activeNavi();
	smoothScr();
	slideImg();
	dLightBox();
	slideImgs('_jykb');
	dLightBoxs('_jykb');
	slideImgs('_lomi');
	dLightBoxs('_lomi');
	slideImgs('_tai');
	dLightBoxs('_tai');
	popup();
	engNav();
	detailDesign();
	detailImgPreview();
	ladysdayImg();
});

/* -----------------------------------------------------
  ladysDayImg
----------------------------------------------------- */
function ladysdayImg(){
	bodyID = $('body').attr('id');
	bodyCL = $('body').attr('class');
	if(bodyID == 'shop' || bodyID == 'restaurant'){
		if(bodyCL == 'ladysday'){
			$('ul.ladysShopList li').each(function(){
				imgH = Number($(this).find('img').attr('height'));
				pdT = Math.floor(((63-imgH)/2)+2);
				$(this).css('padding-top', pdT+ 'px');
				$(this).css('height',68-pdT + 'px');
			});
		}
	}
}

/* -----------------------------------------------------
  topic path
----------------------------------------------------- */
function topicPath(){
	if($('ul#topicPath')){
		$('ul#topicPath li').css('display','inline');
		$('ul#topicPath li a').after('<span>&nbsp;&gt;</span>');
	}
}

/* -----------------------------------------------------
  pageTop
----------------------------------------------------- */
function pageTop(){
	if($('.pageTop')){
		$('.pageTop').click(function(){
			$('html,body').animate({ scrollTop: 0 }, 300);
		});
	}
}


/* -----------------------------------------------------
  active navi
----------------------------------------------------- */
function activeNavi(){
	if($('#sub ul')){
		bodyID = $('body').attr('id');
		bodyCL = $('body').attr('class');
		$('#sub ul li').each(function(){
			snavID = $(this).attr('id').split('snav-')[1];
			if(bodyCL == snavID){
				$(this).find('img').css('visibility','hidden');
			}
		});
	}
}

/* -----------------------------------------------------
  scroll
----------------------------------------------------- */
function smoothScr(){
	  $('a[href*=#]').click(function() {
	    xHref = $(this).attr('href').substring(0,1);
	    if(xHref == '#'){
	    	$(this).scrollTo(500);
	    	return false;
	    }
	  });

	  $('area[href*=#]').click(function() {
	    xHref = $(this).attr('href').substring(0,1);
	    if(xHref == '#'){
	    	$(this).scrollTo(500);
	    	return false;
	    }
	  });

	$('#pageLink-map').click(function(){
		xHref = $(this).find('a').attr('href');
		location.href = xHref;
	});
}
jQuery.fn.extend({
	scrollTo : function(speed, easing) {
		if(!$(this)[0].hash || $(this)[0].hash == "#") {
			return false;
		}
		return this.each(function() {
			var targetOffset = $($(this)[0].hash).offset().top;
			$('html,body').animate({scrollTop: targetOffset}, speed, easing);
		});
	}
});


/*--------------------------------
  slideImg
 -------------------------------*/
function slideImg(){
 	if($('body').is(':has("#slideImg")')){
 		var slideSize = $('#slideImg li').size();
 		var slideW = 150;
 		var slideNum = 4;
 		var maxw = -((slideW * slideSize)-(slideW * slideNum));
		$('#slideImg ul').css('width',slideW*slideSize+'px');
		
		if(slideSize > 4){

			$('p#slideNext').fadeIn();
			
	 		var i= 0;
	 		$('p#slideNext').click(function(){
	 			if(i == 0){
		 			$('p#slideBack').fadeIn(300);
	 				if(Number($('#slideImg ul').css('margin-left').split('px')[0]) == maxw+slideW){
		 				i = 1;
						$('#slideImg ul').animate({marginLeft : '-='+slideW+'px'},300,function(){i=0;});
						$('p#slideNext').fadeOut(300);
					}else if(Number($('#slideImg ul').css('margin-left').split('px')[0]) > maxw){
		 				i = 1;
						$('#slideImg ul').animate({marginLeft : '-='+slideW+'px'},300,function(){i=0;});
					}
		 		}
	 		});

	 		$('p#slideBack').click(function(){
	 			if(i == 0){
					$('p#slideNext').fadeIn(300);
					if($('#slideImg ul').css('margin-left') == '-'+slideW+'px'){
						i = 1;
		 				$('#slideImg ul').animate({marginLeft : '+='+slideW+'px'},300,function(){i=0;});
		 				$('p#slideBack').fadeOut(300);
		 				
	 				}else if($('#slideImg ul').css('margin-left') != '0px'){
		 				i = 1;
		 				$('#slideImg ul').animate({marginLeft : '+='+slideW+'px'},300,function(){i=0;});
		 			}
		 		}
	 		});
	 	}
  	}
}
/*--------------------------------
  lightBox
 -------------------------------*/

function dLightBox(){
	if($('body').is(':has("#slideBox")')){
		//$('#slideBox li a').lightBox({fixedNavigation:true});
		$('#slideBox li a').lightBox();
	}
}


/*--------------------------------
slideImg
-------------------------------*/
function slideImgs(index){
	if($('body').is(':has("#slideImg' + index + '")')){
		var slideSize = $('#slideImg' + index + ' li').size();
		var slideW = 150;
		var slideNum = 4;
		var maxw = -((slideW * slideSize)-(slideW * slideNum));
		$('#slideImg' + index + ' ul').css('width',slideW*slideSize+'px');
		
		if(slideSize > 4){
			$('p#slideNext' + index).fadeIn();
	 		var i= 0;
	 		$('p#slideNext' + index).click(function(){
	 			if(i == 0){
		 			$('p#slideBack' + index).fadeIn(300);
	 				if(Number($('#slideImg' + index + ' ul').css('margin-left').split('px')[0]) == maxw+slideW){
		 				i = 1;
						$('#slideImg' + index + ' ul').animate({marginLeft : '-='+slideW+'px'},300,function(){i=0;});
						$('p#slideNext' + index + '').fadeOut(300);
					}else if(Number($('#slideImg' + index + ' ul').css('margin-left').split('px')[0]) > maxw){
		 				i = 1;
						$('#slideImg' + index + ' ul').animate({marginLeft : '-='+slideW+'px'},300,function(){i=0;});
					}
		 		}
	 		});

	 		$('p#slideBack' + index).click(function(){
	 			if(i == 0){
					$('p#slideNext' + index).fadeIn(300);
					if($('#slideImg' + index + ' ul').css('margin-left') == '-'+slideW+'px'){
						i = 1;
		 				$('#slideImg' + index + ' ul').animate({marginLeft : '+='+slideW+'px'},300,function(){i=0;});
		 				$('p#slideBack1').fadeOut(300);
		 				
	 				}else if($('#slideImg' + index + ' ul').css('margin-left') != '0px'){
		 				i = 1;
		 				$('#slideImg' + index + ' ul').animate({marginLeft : '+='+slideW+'px'},300,function(){i=0;});
		 			}
		 		}
	 		});
	 	}
	}
}
/*--------------------------------
lightBox
-------------------------------*/

function dLightBoxs(index){
	if($('body').is(':has("#slideBox' + index + '")')){
		//$('#slideBox li a').lightBox({fixedNavigation:true});
		$('#slideBox' + index + ' li a').lightBox();
	}
}


/*--------------------------------
  popup close
 -------------------------------*/

function popup(){
	$('dd#closeBtn img').click(function(){
		window.close();
	});
	$('a.popup').click(function(){
		xHref = $(this).attr('href').split('#')[0];
		if($(this).attr('href').indexOf("#w") != -1){
			xWidth = Number($(this).attr('href').split('#')[1].split('w')[1].split('h')[0]);
			xHeight = Number($(this).attr('href').split('#')[1].split('h')[1]);
		}else{
			xWidth =760;
			xHeight = 600;
		}
		window.open(xHref,'SubWin','resizable=yes,scrollbars=yes,menubar=no,directories=no,status=no,location=no,width='+xWidth+',height='+xHeight+'');
		return false;
	});
}

/* -----------------------------------------------------
  english navi
----------------------------------------------------- */
function engNav(){
	if($('ul#engNav')){
		bodyCL = $('body').attr('class');
		$('#engNav li').each(function(){
			enavID = $(this).attr('id').split('enav-')[1];
			if(bodyCL == enavID){
				$(this).find('img').css('visibility','hidden');
			}
		});
	}
}
 
/* swapImg */

jQuery.fn.extend({
	swapImg: $(document).ready(function(){
		return $('.swapImg').each(function(){
			$(this).hover(
				function(){
					$(this).attr('src',$(this).attr('src').replace('_no.','_ro.'));
				},
				function(){
					$(this).attr('src',$(this).attr('src').replace('_ro.','_no.'));
				}
			);
		});
	})
});



/* -----------------------------------------------------
  staff tab
----------------------------------------------------- */
function staffTab(){
	bodyID = $('body').attr('id');
	if(bodyID == 'staff'){
		$('ul#staffNav li').click(function(){
			$('ul#staffNav li img').css('visibility','visible');
			$(this).find('img').css('visibility','hidden');
			
			boxID = $(this).attr('class');
			$('.staffBox').css('display','none');
			$('#staff-' + boxID).css('display','block');
		});
		
		$('#sub ul li.staff').each(function(){
			$(this).hover(
				function(){
					$(this).find('img').css('visibility','hidden');
				},function(){
					$(this).find('img').css('visibility','visible');
				}
			);
			
			$(this).click(function(){
				boxCls = $(this).attr('id').split('-')[1];
				$('.staffBox').css('display','none');
				$('#staff-' + boxCls).css('display','block');
				$('ul#staffNav li img').css('visibility','visible');
				$('ul#staffNav li.' + boxCls).find('img').css('visibility','hidden');
				return false;
			});

		});
	}
}

/* -----------------------------------------------------
  detailDesign
----------------------------------------------------- */
function detailDesign(){
	$('ul#dPickUp li:last').css('border-bottom','none');
	$('ul#dTopics li:last').css('border-bottom','none');
	$('ul#dLadys li:last').css('border-bottom','none');
	$('ul#dMenuCt1 li:last').css('border-bottom','none');
	$('ul#dMenu li:last').css('border-bottom','none');
}


/* -----------------------------------------------------
  imgPreview
----------------------------------------------------- */
function detailImgPreview(){
	if($('a.imgPreview').size()!= 0){
		$('a.imgPreview').css('cursor','default');
		$('a.imgPreview').imgPreview();
		$('a.imgPreview').click(function(){
			return false;
		});
	}
	
}





/*
 * imgPreview jQuery plugin
 * Copyright (c) 2009 James Padolsey
 * j@qd9.co.uk | http://james.padolsey.com
 * Dual licensed under MIT and GPL.
 * Updated: 09/02/09
 * @author James Padolsey
 * @version 0.22
 */
(function($){
    
    $.expr[':'].linkingToImage = function(elem, index, match){
        // This will return true if the specified attribute contains a valid link to an image:
        return !! ($(elem).attr(match[3]) && $(elem).attr(match[3]).match(/\.(gif|jpe?g|png|bmp)$/i));
    };
    
    $.fn.imgPreview = function(userDefinedSettings){
        
        var s = $.extend({
            
            /* DEFAULTS */
            
            // CSS to be applied to image:
            imgCSS: {},
            // Distance between cursor and preview:
            distanceFromCursor: {top: -100, left:-320},
            // Boolean, whether or not to preload images:
            preloadImages: true,
            // Callback: run when link is hovered: container is shown:
            onShow: function(){},
            // Callback: container is hidden:
            onHide: function(){},
            // Callback: Run when image within container has loaded:
            onLoad: function(){},
            // ID to give to container (for CSS styling):
            containerID: 'imgPreviewContainer',
            // Class to be given to container while image is loading:
            containerLoadingClass: 'loading',
            // Prefix (if using thumbnails), e.g. 'thumb_'
            thumbPrefix: '',
            // Where to retrieve the image from:
            srcAttr: 'href'
            
        }, userDefinedSettings),
        
        $container = $('<div/>').attr('id', s.containerID)
                        .append('<img/>').hide()
                        .css('position','absolute')
                        .appendTo('body'),
            
        $img = $('img', $container).css(s.imgCSS),
        
        // Get all valid elements (linking to images / ATTR with image link):
        $collection = this.filter(':linkingToImage(' + s.srcAttr + ')');
        
        // Re-usable means to add prefix (from setting):
        function addPrefix(src) {
            return src.replace(/(\/?)([^\/]+)$/,'$1' + s.thumbPrefix + '$2');
        }
        
        if (s.preloadImages) {
            (function(i){
                var tempIMG = new Image(),
                    callee = arguments.callee;
                tempIMG.src = addPrefix($($collection[i]).attr(s.srcAttr));
                tempIMG.onload = function(){
                    $collection[i + 1] && callee(i + 1);
                };
            })(0);
        }
        
        $collection
            .mousemove(function(e){
                
                $container.css({
                    top: e.pageY + s.distanceFromCursor.top + 'px',
                    left: e.pageX + s.distanceFromCursor.left + 'px'
                });
                
            })
            .hover(function(){
                
                var link = this;
                $container
                    .addClass(s.containerLoadingClass)
                    .show();
                $img
                    .load(function(){
                        $container.removeClass(s.containerLoadingClass);
                        $img.show();
                        s.onLoad.call($img[0], link);
                    })
                    .attr( 'src' , addPrefix($(link).attr(s.srcAttr)) );
                s.onShow.call($container[0], link);
                
            }, function(){
                
                $container.hide();
                $img.unbind('load').attr('src','').hide();
                s.onHide.call($container[0], this);
                
            });
        
        // Return full selection, not $collection!
        return this;
        
    };
    
})(jQuery);
