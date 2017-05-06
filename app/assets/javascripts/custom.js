"use strict";

$(document).ready(function(){
  console.log("loaded");

  var atags = $(".page-scroll");
  var adoptLi = $(".about-dog-adoption");
  var careLi = $(".dog-care");
  var helpLi = $(".help-dogs");

  function dropdown() {
    adoptLi.fadeIn(500);
/*    careLi.fadeIn(500);
    helpLi.fadeIn(500); */
  }

  function removeDropdown() {
    adoptLi.fadeOut(500);
   /* careLi.fadeOut(500);
    helpLi.fadeOut(500);*/
  }

  atags.hover(
    dropdown, removeDropdown
  );

});
    

