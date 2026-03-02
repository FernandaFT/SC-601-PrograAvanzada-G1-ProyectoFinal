$(function () {

    var $form = $("#FormInicioSesion");
    if ($form.length === 0) return;

    $form.validate({

        rules: {
            Correo: {
                required: true,
                email: true
            },
            Password: {
                required: true
            }
        },

        messages: {
            Correo: {
                required: "Campo requerido",
                email: "Formato incorrecto"
            },
            Password: {
                required: "Campo requerido"
            }
        },

        errorElement: "span",
        errorClass: "text-danger d-block",

        errorPlacement: function (error, element) {
            var $floating = element.closest(".form-floating");
            if ($floating.length) {
                error.insertAfter($floating);
            } else {
                error.insertAfter(element);
            }
        },

        highlight: function (element) {
            $(element).addClass("is-invalid");
        },

        unhighlight: function (element) {
            $(element).removeClass("is-invalid");
        }
    });

});