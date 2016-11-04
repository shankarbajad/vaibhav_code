// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require js/lib/jquery/jquery.min
//= require jquery_ujs
//= require jquery.jcrop
//= require companies
//= require users
//= require investments

//= require js/lib/tether/tether.min
//= require js/lib/bootstrap/bootstrap.min

// require js/lib/notie/notie
//= require js/lib/notie/notie-init
//= require js/lib/pnotify/pnotify
//= require js/lib/pnotify/pnotify-init
//= require js/lib/bootstrap-notify/bootstrap-notify.min
//= require js/lib/bootstrap-notify/bootstrap-notify-init

//= require js/lib/html-sortable/html.sortable
//= require js/lib/jquery-tag-editor/jquery.caret.min
//= require js/lib/jquery-tag-editor/jquery.tag-editor.min
//= require js/lib/bootstrap-select/bootstrap-select.min
//= require js/lib/select2/select2.full.min
//= require js/lib/salvattore/salvattore.min

//= require js/lib/typeahead/jquery.typeahead_latest


//= require js/plugins.js
//= require js/app.js
//= require cocoon
//= require custom
//= require cropper
//= require main



$(document).ready(function(){
	$('.sortable').sortable({
		connectWith: 'connected'
	});
});

$(function() {
  $('#tags-editor-textarea').tagEditor();
});


