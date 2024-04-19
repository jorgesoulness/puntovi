jQuery(document).ready(function($){
  // $('#closeModal').click(function(e){
  //   e.preventDefault();
  //   TweenMax.to($overlay, 0.1, { delay: 0.55, autoAlpha: 0 });
  //   TweenMax.to($modalGen, 0.55, { top: '300%', ease:Power3.easeInOut, force3D: true });
  // });
  // Validate form
  var $urlSitio = siteURL;
  $("#frmcontact").validate({
    errorElement: "div",
    errorClass: "error-line",
    rules: {
      nombreFrm: "required",
      companyFrm: "required",
      telFrm: {
        required: true,
        number: true,
      },
      emailFrm: {
        required: true,
        email: true    
      },
      mensajeFrm: "required",
      acceptFrm: "required",
    },
    messages: {
      nombreFrm: "<i class='fa fa-exclamation-triangle'><i>",
      companyFrm: "<i class='fa fa-exclamation-triangle'><i>",
      telFrm: {
        required: "<i class='fa fa-exclamation-triangle'><i>",
        number: "<i class='fa fa-exclamation-triangle'><i>",
      },
      emailFrm: {
        required: "<i class='fa fa-exclamation-triangle'><i>",
        email: "<i class='fa fa-exclamation-triangle'><i>"    
      },
      mensajeFrm: "<i class='fa fa-exclamation-triangle'><i>",
      acceptFrm: "<i class='fa fa-exclamation-triangle'><i>",
    },
    // submitHandler: function(form) {
    //   var dataForm = $('#formContacto').serialize();
    //   if (grecaptcha.getResponse() == ''){
    //     $( '#reCaptchaError' ).html( '<p>Por favor, debes verificar el reCaptcha</p>' ).fadeOut(5000);

    //   } else {
    //   $.ajax({
    //     url: $urlSitio + 'contactoScript.php',
    //     type: 'POST',
    //     data: dataForm,
    //     beforeSend: function(xhr) {
    //       $('.btnSend').addClass('loadBtn');
    //     },
    //     complete: function(xhr, textstatus) {
    //       $('.btnSend').removeClass('loadBtn');
    //     },
    //     success: function(data) {
    //       console.log(data);
    //       $("#formContacto").each (function(){
    //         this.reset();
    //       });
    //       $('#modalCongrats').removeClass('hideMo').addClass('showMo');
    //       setTimeout(function(){
    //         $('#modalCongrats').removeClass('showMo').addClass('hideMo');
    //       }, 5000);
    //       grecaptcha.reset();
    //     },
    //     error: function(e) {
    //       console.log(e);
    //     }
    //   });
    //   }
    // }
  });

  // Formulario servicios
  $("#serviciosfrm").validate({
    errorElement: "div",
    errorClass: "error-line",
    rules: {
      nombreServFrm: "required",
      telServFrm: {
        required: true,
        number: true,
      },
      emailServFrm: {
        required: true,
        email: true    
      },
      mensajeServFrm: "required",
      acceptServFrm: "required",
    },
    messages: {
      nombreServFrm: "<i class='fa fa-exclamation-triangle'><i>",
      telServFrm: {
        required: "<i class='fa fa-exclamation-triangle'><i>",
        number: "<i class='fa fa-exclamation-triangle'><i>",
      },
      emailServFrm: {
        required: "<i class='fa fa-exclamation-triangle'><i>",
        email: "<i class='fa fa-exclamation-triangle'><i>"    
      },
      mensajeServFrm: "<i class='fa fa-exclamation-triangle'><i>",
      acceptServFrm: "<i class='fa fa-exclamation-triangle'><i>",
    },
    // submitHandler: function(form) {
    //   var dataForm = $('#formContacto').serialize();
    //   if (grecaptcha.getResponse() == ''){
    //     $( '#reCaptchaError' ).html( '<p>Por favor, debes verificar el reCaptcha</p>' ).fadeOut(5000);

    //   } else {
    //   $.ajax({
    //     url: $urlSitio + 'contactoScript.php',
    //     type: 'POST',
    //     data: dataForm,
    //     beforeSend: function(xhr) {
    //       $('.btnSend').addClass('loadBtn');
    //     },
    //     complete: function(xhr, textstatus) {
    //       $('.btnSend').removeClass('loadBtn');
    //     },
    //     success: function(data) {
    //       console.log(data);
    //       $("#formContacto").each (function(){
    //         this.reset();
    //       });
    //       $('#modalCongrats').removeClass('hideMo').addClass('showMo');
    //       setTimeout(function(){
    //         $('#modalCongrats').removeClass('showMo').addClass('hideMo');
    //       }, 5000);
    //       grecaptcha.reset();
    //     },
    //     error: function(e) {
    //       console.log(e);
    //     }
    //   });
    //   }
    // }
  });
});