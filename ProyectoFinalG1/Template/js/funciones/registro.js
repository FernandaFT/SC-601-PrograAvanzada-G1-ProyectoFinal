$(document).ready(function () {
    $("#FormRegistro").validate({
        rules: {
            Identificacion: {
                required: true,
                minlength: 11
            },
            Nombre: {
                required: true
            },
            CorreoElectronico: {
                required: true,
                email: true
            },
            Contrasenna: {
                required: true,
                minlength: 6
            },
            Telefono: {
                required: true,
                digits: true, 
                minlength: 8
            },
            ConsecutivoRol: {
                required: true
            },
            Direccion: {
                required: true,
                maxlength: 255
            }

        },
        messages: {
            Identificacion: {
                required: "Campo requerido",
                minlength: "Debe tener al menos 11 dígitos"
            },
            Nombre: {
                required: "Campo requerido"
            },
            CorreoElectronico: {
                required: "Campo requerido",
                email: "Formato incorrecto"
            },
            Contrasenna: {
                required: "Campo requerido",
                minlength: "Debe tener al menos 6 dígitos"
            },
            Telefono: {
                required: "Campo requerido",
                digits: "Solo números permitidos",
                minlength: "Debe tener al menos 8 dígitos"
            },
            ConsecutivoRol: {
                required: "Campo requerido"
            },
            Direccion: {
                required: "Campo requerido",
                maxlength: "Máximo 255 carácteres"
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