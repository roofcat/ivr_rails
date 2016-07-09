// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


function notificationModal ( t, b ) {
  var title = $( '#notificationTitle' );
  var body = $( '#notificationBody' );
  title.empty().append( t );
  body.empty().append( b );
  $( '#notificationModal' ).modal( 'show', true );
};
function timestamp_to_date ( date ) {
  return moment.unix( date ).format( 'DD-MM-YYYY h:mm:ss a' );
};
function date_to_timestamp ( date, max ) {
  return moment( date, 'DD/MM/YYYY' ).unix();
};
function date_to_format ( date ) {
  return moment( date ).format( 'DD-MM-YYYY H:mm:ss a' );
};
