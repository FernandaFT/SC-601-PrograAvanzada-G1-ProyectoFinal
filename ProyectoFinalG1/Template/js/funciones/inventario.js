$(document).ready(function () {
    $("#FormInventario").validate({
        rules: {
            fecha: {
                required: true,
                date: true
            },
            observaciones: {
                maxlength: 300
            }
        },
        messages: {
            fecha: {
                required: "La fecha es requerida.",
                date: "Formato de fecha inválido."
            },
            observaciones: {
                maxlength: "Las observaciones no pueden superar los 300 caracteres."
            }
        },

        errorElement: "span",
        errorClass: "text-danger",

        highlight: function (element) {
            $(element).addClass("is-invalid");
        },
        unhighlight: function (element) {
            $(element).removeClass("is-invalid");
        }
    });
});