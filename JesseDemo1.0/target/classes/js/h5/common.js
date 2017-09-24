/**
 * rem布局
 * @param doc
 * @param win
 */
(function (doc, win) {
       var docEl = doc.documentElement,
           resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
           recalc = function () {
               var clientWidth = docEl.clientWidth;
               if (!clientWidth) return;
               if(clientWidth>=750){
                   docEl.style.fontSize = '100px';
               }else{
                   docEl.style.fontSize = 100 * (clientWidth / 750) + 'px';
               }
           };
 
       if (!doc.addEventListener) return;
       win.addEventListener(resizeEvt, recalc, false);
       doc.addEventListener('DOMContentLoaded', recalc, false);
   })(document, window);

/*点击奔达康集团logo跳到首页*/
var url=$("#url").val();

$(".qk_header .c_img").click(function(){
	 window.location.href=url+"/period/periodical.do";
});
