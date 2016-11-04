$(document).on('change', '#company_country', function(){
	$.ajax({
		method: 'GET',
		url: "/companies/get_cities_by_country_code",
		data: { code: this.value }
	});
});

$(document).on('change', '#user_country', function(){
	$.ajax({
		method: 'GET',
		url: "/users/get_cities_by_country_code",
		data: { code: this.value }
	});
});

$(document).on('click', '.navigation-view', function(){ 	
	id = this.href.split("#")[1]	
    $('html, body').animate({
      scrollTop: $("#nav-"+id).offset().top - 60
    }, 1000);
});

function countChar(val) {	
    var len = val.value.length;
    if (len >= 400) {
      val.value = val.value.substring(0, 400);
    } else {      
      $(".count-word").text(400 - len);
    }
  };


  $(document).on('click', '.company-search', function(){	
  	$('input.select-region').val($(".typeahead__filter .typeahead__filter-button").text())
  })  

  $(document).on('click', 'ul.typeahead__list li', function(){ 
    $(this.children).attr("href", $(this.children).attr("href")+$(".typeahead__filter .typeahead__filter-button").text());
  })

  $(document).on("change", "#company_background_image", function(){
    var output = this;
    output.src = URL.createObjectURL(event.target.files[0]);
    $(".img-container img").attr("src",output.src);
    
    if ($(".img-preview.preview-lg img").size()!=0){
      $(".img-preview.preview-lg img").attr("src",output.src);
    }
    $("#img-cropp").modal("show");
  })

  $(document).on('click', '.crop-button', function(){
    $(".dimenstion").click()
    $("#img-cropp").modal("hide");
  })

  $(document).on("change", "#user_background_image", function(){
    var output = this;
    output.src = URL.createObjectURL(event.target.files[0]);
    $(".img-container img").attr("src",output.src);
    
    if ($(".img-preview.preview-lg img").size()!=0){
      $(".img-preview.preview-lg img").attr("src",output.src);
    }
    $("#usrimg-cropp").modal("show");
  })

  $(document).on('click', '.crop-button', function(){
    $(".dimenstion").click()
    $("#usrimg-cropp").modal("hide");
  })

