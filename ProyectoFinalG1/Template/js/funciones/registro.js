$(function () {
    $("#FormRegistro").validate({
        rules: {
            Identificacion: {
                required: true
            },
            Nombre: {
                required: true
            },
            Correo: {
                required: true,
                email: true
            },
            Password: {
                required: true
            }
        },
        messages: {
            Identificacion: {
                required: "Campo requerido"
            },
            Nombre: {
                required: "Campo requerido"
            },
            Correo: {
                required: "Campo requerido",
                email: "Formato incorrecto"
            },
            Password: {
                required: "Campo requerido"
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