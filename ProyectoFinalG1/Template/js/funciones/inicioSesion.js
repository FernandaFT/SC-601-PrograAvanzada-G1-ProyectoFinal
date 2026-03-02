$(function () {
    $("#FormInicioSesion").validate({
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