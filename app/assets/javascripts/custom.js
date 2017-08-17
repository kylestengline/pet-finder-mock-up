"use strict";

$(document).ready(function(){

  var atags = $(".navbar-right li");
  var dogSearch = $(".dog-search");
  var adoptLi = $(".about-dog-adoption");
  var careLi = $(".dog-care");
  var ourDogs = $(".our-pets");
  var helpLi = $(".help-dogs");
  var navLinks = [ adoptLi, careLi, ourDogs, helpLi ];

  dogSearch.hide();
  helpLi.hide();
  careLi.hide();
  ourDogs.hide();
  adoptLi.hide();

  atags.hover(
    function(){
      $(this).children('a').addClass("hover")
      for (var i = 0; i < navLinks.length; i++) {
        navLinks[i].css("background-color", "black");
        navLinks[i].css("padding-top", "10px");
        navLinks[i].css("padding-bottom", "10px");
      }
      $(this).children('ul').show();
    }, function() {
      $(this).children('a').removeClass("hover");
      $(this).children('ul').hide();
    }
  );

  // Remove Flash Messages after 5 seconds
  setTimeout(function(){
    $('.alert').fadeOut(3500);
  }, 5000);
});
