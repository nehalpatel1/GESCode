(function(D){function y(a,b,c,p,d,o,j,i,f,g,h){var n,k,t,q;"true"==jQuery(d[c.current_img_no]).attr("data-video")&&jQuery("#contentHolderUnit_"+c.current_img_no,o).html(jQuery(d[c.current_img_no]).html());jQuery(p[c.current_img_no]).removeClass("bottomNavButtonON");c.current_img_no=A(c.current_img_no,a,f);"true"!=jQuery(d[c.current_img_no]).attr("data-video")&&g.css("display","none");jQuery(p[c.current_img_no]).addClass("bottomNavButtonON");c.currentZ_index=100;c.currentImg=jQuery("#contentHolderUnit_"+ c.current_img_no,o);n=j;k=i;t=parseInt((b.width-j)/2);q=parseInt(b.height-i)-b.verticalAdjustment;B(c.currentImg,t,q,n,k,1,!1,a,c,b,h,d,f,g,p,o,j,i);l=c.current_img_no;for(m=1;m<=Math.floor(b.numberOfVisibleItems/2);m++)c.currentZ_index--,l=A(l,-1,f),c.currentImg=jQuery("#contentHolderUnit_"+l),c.currentImg=jQuery("#contentHolderUnit_"+l,o),c.currentImg.css("z-index",c.currentZ_index),m==Math.floor(b.numberOfVisibleItems/2)&&(1===a?(last_aux_img_no=A(l,-1,f),last_currentImg=jQuery("#contentHolderUnit_"+ last_aux_img_no,o),k=i-2*(m+1)*b.elementsVerticalSpacing,n=parseInt(k*c.aspectOrig),t=parseInt((b.width-j)/2)-(m+1)*b.elementsHorizontalSpacing,q=parseInt(b.height-i)-b.verticalAdjustment+(m+1)*b.elementsVerticalSpacing,B(last_currentImg,t,q,n,k,0,!1,a,c,b,h,d,f,g,p,o,j,i)):(k=i-2*(m+1)*b.elementsVerticalSpacing,parseInt(k*c.aspectOrig),E(c.currentImg,m+1,b,i,c),t=parseInt((b.width-j)/2)-(m+1)*b.elementsHorizontalSpacing,q=parseInt(b.height-i)-b.verticalAdjustment+(m+1)*b.elementsVerticalSpacing, c.currentImg.css("left",t),c.currentImg.css("top",q),c.currentImg.css("opacity",0))),c.currentImg.css("display","block"),k=i-2*m*b.elementsVerticalSpacing,n=parseInt(k*c.aspectOrig),t=parseInt((b.width-j)/2)-m*b.elementsHorizontalSpacing,q=parseInt(b.height-i)-b.verticalAdjustment+m*b.elementsVerticalSpacing,B(c.currentImg,t,q,n,k,1,!1,a,c,b,h,d,f,g,p,o,j,i);var l=c.current_img_no;for(m=1;m<=Math.floor(b.numberOfVisibleItems/2);m++)c.currentZ_index--,l=A(l,1,f),c.currentImg=jQuery("#contentHolderUnit_"+ l,o),c.currentImg.css("z-index",c.currentZ_index),m==Math.floor(b.numberOfVisibleItems/2)&&(1===a?(E(c.currentImg,m+1,b,i,c),c.currentImg.css("left",parseInt((b.width-j)/2)+(j+(m+1)*b.elementsHorizontalSpacing-c.currentImg.width())+"px"),c.currentImg.css("top",parseInt(b.height-i)-b.verticalAdjustment+(m+1)*b.elementsVerticalSpacing+"px"),c.currentImg.css("opacity",0)):(last_aux_img_no=A(l,1,f),last_currentImg=jQuery("#contentHolderUnit_"+last_aux_img_no,o),k=i-2*(m+1)*b.elementsVerticalSpacing,n= parseInt(k*c.aspectOrig),t=parseInt((b.width-j)/2)+(j+(m+1)*b.elementsHorizontalSpacing-n),q=parseInt(b.height-i)-b.verticalAdjustment+(m+1)*b.elementsVerticalSpacing,B(last_currentImg,t,q,n,k,0,!1,a,c,b,h,d,f,g,p,o,j,i))),c.currentImg.css("display","block"),k=i-2*m*b.elementsVerticalSpacing,n=parseInt(k*c.aspectOrig),t=parseInt((b.width-j)/2)+(j+m*b.elementsHorizontalSpacing-n),q=parseInt(b.height-i)-b.verticalAdjustment+m*b.elementsVerticalSpacing,m==Math.floor(b.numberOfVisibleItems/2)?B(c.currentImg, t,q,n,k,1,!0,a,c,b,h,d,f,g,p,o,j,i):B(c.currentImg,t,q,n,k,1,!1,a,c,b,h,d,f,g,p,o,j,i)}function E(a,b,c,p,d){b=p-2*b*c.elementsVerticalSpacing;d=parseInt(b*d.aspectOrig);a.css("height",b+"px");a.css("width",d+"px");c.resizeImages&&(imgInside=a.find("img:first"),imgInside.is("img")&&(imgInside.css("height",b+"px"),imgInside.css("width",d+"px")))}function B(a,b,c,p,d,o,j,i,f,g,h,n,k,t,q,l,r,e){f.slideIsRunning=!0;h.html(jQuery(n[f.current_img_no]).attr("data-title"));0===o?a.css("z-index",f.currentZ_index- 1):a.css("z-index",f.currentZ_index);a.css("display","block");a.animate({left:b+"px",top:c+"px",width:p+"px",height:d+"px",opacity:o},1E3*g.animationTime,g.easing,function(){if(j){f.slideIsRunning=!1;"true"==jQuery(n[f.current_img_no]).attr("data-video")&&t.css("display","block");if(0<g.autoPlay&&1<k&&!f.mouseOverBanner&&!f.fastForwardRunning||f.current_img_no!=f.img_no_where_to_stop&&f.fastForwardRunning)clearTimeout(f.timeoutID),f.timeoutID=setTimeout(function(){y(i,g,f,q,n,l,r,e,k,t,h)},1E3*g.autoPlay); f.current_img_no==f.img_no_where_to_stop&&f.fastForwardRunning&&(f.fastForwardRunning=!1,g.animationTime=f.animationTimeOrig,g.autoPlay=f.autoPlayOrig)}});g.resizeImages&&(imgInside=a.find("img:first"),imgInside.is("img")&&imgInside.animate({width:p+"px",height:d+"px"},1E3*g.animationTime,g.easing,function(){}))}function A(a,b,c){return a+b>=c?0:0>a+b?c-1:a+b}function F(a,b,c,p,d,o,j,i,f,g,h){-1===c.current_img_no-a?y(1,b,c,p,d,o,j,i,f,g,h):1===c.current_img_no-a?y(-1,b,c,p,d,o,j,i,f,g,h):(c.fastForwardRunning= !0,b.animationTime=0.4,b.autoPlay=0.1,c.img_no_where_to_stop=a,c.current_img_no<a?a-c.current_img_no<f-a+c.current_img_no?y(1,b,c,p,d,o,j,i,f,g,h):y(-1,b,c,p,d,o,j,i,f,g,h):c.current_img_no>a&&(c.current_img_no-a<f-c.current_img_no+a?y(-1,b,c,p,d,o,j,i,f,g,h):y(1,b,c,p,d,o,j,i,f,g,h)))}var C=!1;D.fn.allinone_carousel=function(a){a=D.extend({},D.fn.allinone_carousel.defaults,a);return this.each(function(){var b=jQuery(this),c=jQuery("<div></div>").addClass("allinone_carousel").addClass(a.skin),p=jQuery('<div class="bannerControls"> <div class="leftNav"></div> <div class="rightNav"></div> </div> <div class="contentHolder"></div> <div class="elementTitle"></div>\t<div class="playOver"></div>'); b.wrap(c);b.after(p);var d=b.parent(".allinone_carousel"),p=jQuery(".bannerControls",d),o=jQuery(".contentHolder",d),c=jQuery('<div class="bottomNavLeft"></div>'),j=jQuery('<div class="bottomNav"></div>'),i=jQuery('<div class="bottomNavRight"></div>');b.after(c);b.after(j);b.after(i);a.showAllControllers||p.css("display","none");var f=jQuery(".leftNav",d),g=jQuery(".rightNav",d);f.css("display","none");g.css("display","none");a.showNavArrows&&a.showOnInitNavArrows&&(f.css("display","block"),g.css("display", "block"));var h=jQuery(".bottomNav",d),n=jQuery(".bottomNavLeft",d),k=jQuery(".bottomNavRight",d),t;h.css("display","block");n.css("display","block");k.css("display","block");a.showBottomNav||(h.css("display","none"),n.css("display","none"),k.css("display","none"));a.showOnInitBottomNav||(h.css("left","-5000px"),n.css("left","-5000px"),k.css("left","-5000px"));var q=jQuery(".elementTitle",d);a.showElementTitle||q.css("display","none");var l=jQuery(".playOver",d),r=0,e={current_img_no:0,currentImg:0, currentZ_index:101,slideIsRunning:!1,mouseOverBanner:!1,fastForwardRunning:!1,isVideoPlaying:!1,img_no_where_to_stop:0,aspectOrig:0,timeoutID:"",animationTimeOrig:a.animationTime,autoPlayOrig:a.autoPlay},B;d.width(a.width);d.height(a.height);o.width(a.width);o.height(a.height);p.css("margin-top",parseInt((a.height-f.height())/2)+"px");var w=b.find("ul:first").children();a.numberOfVisibleItems>b.find("ul:first li").length&&(a.numberOfVisibleItems=b.find("ul:first li").length);a.numberOfVisibleItems% 2||a.numberOfVisibleItems--;var s,x=0,u=0,z,A=0,D=0;w.each(function(){e.currentImg=jQuery(this);if(!e.currentImg.is("li"))e.currentImg=e.currentImg.find("li:first");if(e.currentImg.is("li")){r++;s=jQuery('<div class="contentHolderUnit" rel="'+(r-1)+'" id="contentHolderUnit_'+(r-1)+'">'+e.currentImg.html()+"</div>");o.append(s);s.css("display","none");if(x===0){x=s.width();u=s.height();e.aspectOrig=x/u}E(s,0,a,u,e);s.css("left",parseInt((a.width-s.width())/2)+"px");s.css("top",parseInt(a.height-s.height())- a.verticalAdjustment+"px");if(r==1){s.css("left",parseInt((a.width-s.width())/2)+"px");s.css("top",parseInt(a.height-s.height())-a.verticalAdjustment+"px");s.css("z-index",e.currentZ_index);s.css("display","block");jQuery(w[e.current_img_no]).attr("data-video")=="true"&&l.css("display","block")}else if(r<=Math.ceil(a.numberOfVisibleItems/2)){e.currentZ_index--;E(s,r-1,a,u,e);s.css("left",parseInt((a.width-x)/2)+(x+(r-1)*a.elementsHorizontalSpacing-s.width())+"px");s.css("top",parseInt(a.height-u)- a.verticalAdjustment+(r-1)*a.elementsVerticalSpacing+"px");s.css("z-index",e.currentZ_index);s.css("display","block")}z=jQuery('<div class="bottomNavButtonOFF" rel="'+(r-1)+'"></div>');h.append(z);A=A+(parseInt(z.css("padding-left").substring(0,z.css("padding-left").length-2))+z.width());D=parseInt((h.height()-parseInt(z.css("height").substring(0,z.css("height").length-2)))/2);z.css("margin-top",D+"px")}});l.css("left",parseInt((a.width-l.width())/2)+"px");l.css("top",parseInt(a.height-s.height()- a.verticalAdjustment+(jQuery("#contentHolderUnit_"+e.current_img_no,d).height()-l.height())/2)+"px");e.currentZ_index=100;for(m=1;m<=Math.floor(a.numberOfVisibleItems/2);m++)e.currentZ_index--,E(jQuery("#contentHolderUnit_"+(r-m),d),m,a,u,e),jQuery("#contentHolderUnit_"+(r-m),d).css("left",parseInt((a.width-x)/2)-m*a.elementsHorizontalSpacing+"px"),jQuery("#contentHolderUnit_"+(r-m),d).css("top",parseInt(a.height-u)-a.verticalAdjustment+m*a.elementsVerticalSpacing+"px"),jQuery("#contentHolderUnit_"+ (r-m),d).css("z-index",e.currentZ_index),jQuery("#contentHolderUnit_"+(r-m),d).css("display","block");q.html(jQuery(w[0]).attr("data-title"));h.width(A);a.showOnInitBottomNav&&(h.css("left",parseInt((d.width()-A)/2)+"px"),n.css("left",parseInt(h.css("left").substring(0,h.css("left").length-2))-n.width()+"px"),k.css("left",parseInt(h.css("left").substring(0,h.css("left").length-2))+h.width()+parseInt(z.css("padding-left").substring(0,z.css("padding-left").length-2))+"px"));jQuery("iframe").each(function(){var a= jQuery(this).attr("src");jQuery(this).attr("src",a+"?wmode=transparent")});e.current_img_no=0;e.currentImg=jQuery(w[e.current_img_no]);d.mouseenter(function(){e.mouseOverBanner=true;clearTimeout(e.timeoutID);if(a.autoHideNavArrows&&a.showNavArrows){f.css("display","block");g.css("display","block")}if(a.autoHideBottomNav&&a.showBottomNav){h.css("display","block");h.css("left",parseInt((d.width()-A)/2)+"px");n.css("display","block");n.css("left",parseInt(h.css("left").substring(0,h.css("left").length- 2))-n.width()+"px");k.css("display","block");k.css("left",parseInt(h.css("left").substring(0,h.css("left").length-2))+h.width()+parseInt(z.css("padding-left").substring(0,z.css("padding-left").length-2))+"px")}});d.mouseleave(function(){e.mouseOverBanner=false;if(a.autoHideNavArrows&&a.showNavArrows){f.css("display","none");g.css("display","none")}if(a.autoHideBottomNav&&a.showBottomNav){h.css("display","none");n.css("display","none");k.css("display","none")}if(a.autoPlay>0&&r>1&&!e.fastForwardRunning&& !e.isVideoPlaying){clearTimeout(e.timeoutID);e.timeoutID=setTimeout(function(){y(1,a,e,v,w,d,x,u,r,l,q)},a.autoPlay*1E3)}});s=jQuery(".contentHolderUnit",d);s.click(function(){if(!e.slideIsRunning&&!e.fastForwardRunning){var b=jQuery(this).attr("rel");if(b!=e.current_img_no){e.isVideoPlaying=false;jQuery(v[e.current_img_no]).removeClass("bottomNavButtonON");F(parseInt(b),a,e,v,w,d,x,u,r,l,q)}else if(jQuery(w[e.current_img_no]).attr("data-video")=="true"){l.css("display","none");B=jQuery(this).find("img:first"); B.css("display","none");e.isVideoPlaying=true}}});l.click(function(){l.css("display","none");B=jQuery("#contentHolderUnit_"+e.current_img_no,d).find("img:first");B.css("display","none");e.isVideoPlaying=true});f.mousedown(function(){C=true;if(!e.slideIsRunning&&!e.fastForwardRunning){e.isVideoPlaying=false;clearTimeout(e.timeoutID);y(-1,a,e,v,w,d,x,u,r,l,q)}});f.mouseup(function(){C=false});g.mousedown(function(){C=true;if(!e.slideIsRunning&&!e.fastForwardRunning){e.isVideoPlaying=false;clearTimeout(e.timeoutID); y(1,a,e,v,w,d,x,u,r,l,q)}});g.mouseup(function(){C=false});var v=jQuery(".bottomNavButtonOFF",d);v.mousedown(function(){C=true;if(!e.slideIsRunning&&!e.fastForwardRunning){var b=jQuery(this).attr("rel");if(b!=e.current_img_no){e.isVideoPlaying=false;jQuery(v[e.current_img_no]).removeClass("bottomNavButtonON");F(parseInt(b),a,e,v,w,d,x,u,r,l,q)}}});v.mouseup(function(){C=false});v.mouseenter(function(){var b=jQuery(this),c=b.attr("rel");if(a.showPreviewThumbs){t=jQuery('<div class="bottomOverThumb"></div>'); b.append(t);}b.addClass("bottomNavButtonON")});v.mouseleave(function(){var b=jQuery(this),c=b.attr("rel");a.showPreviewThumbs&&t.remove();e.current_img_no!=c&&b.removeClass("bottomNavButtonON")});a.enableTouchScreen&&(b=Math.floor(1E5*Math.random()),d.wrap('<div id="carouselParent_'+b+'" style="position:relative;" />'),jQuery("#carouselParent_"+b).width(a.width+1),jQuery("#carouselParent_"+b).height(a.height), d.css("left","0px"),d.css("position","absolute"),rightVal=parseInt(g.css("right").substring(0,g.css("right").length-2)),d.mousedown(function(){rightVal=parseInt(g.css("right").substring(0,g.css("right").length-2));if(rightVal<0&&!C){g.css("visibility","hidden");f.css("visibility","hidden");g.css("right","0")}}),d.mouseup(function(){C=false;if(rightVal<0){g.css("right",rightVal+"px");g.css("visibility","visible");f.css("visibility","visible")}}),d.draggable({axis:"x",containment:"parent",distance:10, start:function(){origLeft=jQuery(this).css("left")},stop:function(){if(!e.effectIsRunning){finalLeft=jQuery(this).css("left");direction=1;origLeft<finalLeft&&(direction=-1);y(direction,a,e,v,w,d,x,u,r,l,q)}if(rightVal<0){g.css("right",rightVal+"px");g.css("visibility","visible");f.css("visibility","visible")}jQuery(this).css("left","0px")}}));jQuery(v[e.current_img_no]).addClass("bottomNavButtonON");0<a.autoPlay&&1<r&&(e.timeoutID=setTimeout(function(){y(1,a,e,v,w,d,x,u,r,l,q)},1E3*a.autoPlay))})}; D.fn.allinone_carousel.defaults={skin:"attractive",width:664,height:300,autoPlay:4,numberOfVisibleItems:7,elementsHorizontalSpacing:120,elementsVerticalSpacing:20,verticalAdjustment:0,animationTime:0.8,easing:"easeOutQuad",resizeImages:!0,showElementTitle:!0,showAllControllers:!0,showNavArrows:!0,showOnInitNavArrows:!0,autoHideNavArrows:!0,showBottomNav:!0,showOnInitBottomNav:!0,autoHideBottomNav:!0,showPreviewThumbs:!0,enableTouchScreen:!0}})(jQuery);