$(document).ready(function () {

    $("#FormInventario").validate({

        rules: {
            fecha: {
                required: true,
                date: true
            },
            observaciones: {
                maxlength: 250
            }
        },

        messages: {
            fecha: {
                required: "La fecha es obligatoria",
                date: "Debe ingresar una fecha válida"
            },
            observaciones: {
                maxlength: "Máximo 250 caracteres"
            }
        },

        errorElement: "span",
        errorClass: "text-danger",

        errorPlacement: function (error, element) {
            error.insertAfter(element);
        },

        highlight: function (element) {
            $(element).addClass("is-invalid");
        },

        unhighlight: function (element) {
            $(element).removeClass("is-invalid");
        }

    });

});