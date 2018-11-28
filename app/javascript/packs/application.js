/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
//= require jquery

$(document).ready(function(){
  $('.category-checkbox').each(function () {
    this.checked ? $(this).parent().addClass("active") : $(this).parent().removeClass("active");
  });


  $(".category-checkbox").click(function(){
    $(this).parent().toggleClass("active");
  });
});

// $('input:checkbox').change(function(){
//     if($(this).is(":checked")) {
//       $(`#label-${this.id}`).addClass("active");
//       console.log(`#label-${this.id}`)
//     } else {
//       $(`#label-${this.id}`).removeClass("active");
//       console.log(`#label-${this.id}`)
//     }
// });

