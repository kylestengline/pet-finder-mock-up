"use strict";

$(document).ready(function(){


  var atags = $(".navbar-right li");
  var adoptLi = $(".about-dog-adoption");
  var careLi = $(".dog-care");
  var ourDogs = $(".our-pets");
  var helpLi = $(".help-dogs");

  helpLi.hide();
  careLi.hide();
  ourDogs.hide();
  adoptLi.hide();

  atags.hover(
    function(){
      $(this).children('a').addClass("hover");
      $(this).children('ul').show();
    }, function() {
      $(this).children('a').removeClass("hover");
      $(this).children('ul').hide();
    }
  );

});
    

