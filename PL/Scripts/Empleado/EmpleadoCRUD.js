// <reference path="SubCategoriaCRUD.js" />
$(document).ready(function () {
    GetAll();
});

function GetAll() {
    $.ajax({
        type: 'GET',
        url: 'http://localhost:10038/api/empleado/GetAll',
        success: function (result) {//200 OK
            $('#tblEmpleado tbody').empty();
            $.each(result.Objects, function (i, empleado) {
                //var filas =
                //    '<tr>'
                //    + '<td class="text-center"> '
                //    + '<a class="glyphicon glyphicon-edit" href="#" onclick="CreateRow(' + empleado.IdEmpleado + ')">'

                //    + '</a> '
                //    + '</td>'
                //    + "<td  id='id' class='text-center'>" + empleado.IdEmpleado + "</td>"
                //    + "<td class='text-center'>" + empleado.NumeroNomina + "</td>"
                //    + "<td class='text-center'>" + empleado.Nombre + " " + empleado.ApellidoPaterno + " " + empleado.ApellidoMaterno +"</td>"
                //    + "<td class='text-center'>" + empleado.Estado.IdEstado + "</td>"

                //        + '<td class="text-center"> <button class="btn btn-danger" onclick="Eliminar(' + empleado.IdEmpleado + ')"><span class="glyphicon glyphicon-trash" style="color:#FFFFFF"></span></button></td>'

                //    + "</tr>";

                
                //$("#tblEmpleado tbody").append(filas);

                CreteRow(empleado);
            });
        },
        error: function (result) {
            alert('Error en la consulta.' + result.responseJSON.ErrorMessage);

        }
    });
}

function CatEntidadFederativaGetAll() {
    $("#ddlEstados").empty();
    $.ajax({
        type: 'GET',
        url: 'http://localhost:10038/api/catentidadfederativa/GetAll',
        success: function (result) {
            $("#ddlEstados").append('<option value="' + 0 + '">' + 'Seleccione una opción' + '</option>');
            $.each(result.Objects, function (i, estado) {
                $("#ddlEstados").append('<option value="'
                                           + estado.IdEstado + '">'
                                           + estado.Estado + '</option>');
            });
        },
        error: function (result) {
            alert('Error en la consulta.' + result.responseJSON.ErrorMessage);

        }
    });
}

function Add(empleado) {

    $.ajax({
        type: 'POST',
        url: 'http://localhost:10038/api/empleado/add',
        dataType: 'json',
        data: empleado,
        success: function (result) {
            $('#ModalForm').modal('hide');
            $('#myModal').modal();

            CatEntidadFederativaGetAll();
          
        },
        error: function (result) {
            alert('Error en la consulta.' + result.responseJSON.ErrorMessage);
        }
    });
}

function GetById(IdEmpleado) {
    $.ajax({
        type: 'GET',
        url: 'http://localhost:10038/api/empleado/' + IdEmpleado,
        success: function (result) {
            $('#txtIdEmpleado').val(result.Object.IdEmpleado);
            $('#txtNumeroNomina').val(result.Object.NumeroNomina);
            $('#txtNombre').val(result.Object.Nombre);
            $('#txtApellidoPaterno').val(result.Object.ApellidoPaterno);
            $('#txtApellidoMaterno').val(result.Object.ApellidoMaterno);
            $('#ddlEstados').val(result.Object.Estado.IdEstado);

            $('#ModalForm').modal('show');
            $('#lblTitulo').modal('Modificar Empleado');
        },
        error: function (result) {
            alert('Error en la consulta.' + result.responseJSON.ErrorMessage);
        }

    });

}

function CreteRow(empleado) {
                var filas =
                    '<tr>'
                    + '<td class="text-center"> '
                    + '<a class="glyphicon glyphicon-edit" href="#" onclick="GetById(' + empleado.IdEmpleado + ')">'
                    + '</a> '
                    + '</td>'
                    + "<td  id='tblIdEmpleado' class='text-center'>" + empleado.IdEmpleado + "</td>"
                    + "<td id='tblNumeroNomina' class='text-center'>" + empleado.NumeroNomina + "</td>"
                    + "<td id='tblNombre' class='text-center'>" + empleado.Nombre + " " + empleado.ApellidoPaterno + " " + empleado.ApellidoMaterno +"</td>"
                    + "<td id='tblIdEmpleado'class='text-center'>" + empleado.Estado.IdEstado + "</td>"

                        + '<td class="text-center"> <button class="btn btn-danger" onclick="Eliminar(' + empleado.IdEmpleado + ')"><span class="glyphicon glyphicon-trash" style="color:#FFFFFF"></span></button></td>'

                    + "</tr>";

                $("#tblEmpleado tbody").append(filas);
   
}

function InitializeControls() {

    $('#txtIdEmpleado').val('');
    $('#txtNumeroNomina').val('');
    $('#txtNombre').val('');
    $('#txtApellidoPaterno').val('');
    $('#txtApellidoMaterno').val('');
    $('#ddlEstados').val(0);

    $('#ModalForm').modal('show');

}

function ShowModal() {

    $('#ModalForm').modal('show');

    CatEntidadFederativaGetAll();

    InitializeControls();
    $('#lblTitulo').modal('Agregar Empleado');

}

function Update(empleado) {
    $.ajax({
        type: 'PUT',
        url: 'http://localhost:10038/api/empleado/update/',
        dataType: 'json',
        data: empleado,
        success: function (result) {

            $('#ModalForm').modal();
            $('#myModal').modal();

            CatEntidadFederativaGetAll();
            Console(respond);
        },
        error: function (result) {
            alert('Error en la consulta.' + result.responseJSON.ErrorMessage);
        }
    });

};

function Guardar() {

    var empleado = {
        IdEmpleado: $('#txtIdEmpleado').val(),
        NumeroNomina: $('#txtNumeroNomina').val(),
        Nombre: $('#txtNombre').val(),
        ApellidoPaterno: $('#txtApellidoPaterno').val(),
        ApellidoMaterno: $('#txtApellidoMaterno').val(),
        Estado: {
            IdEstado: $('#ddlEstados').val()
        }
    }
    if ($('#txtIdEmpleado').val() == "")
    {
        Add(empleado);
    }
    else
    {
        Update(empleado);
    }

}

function Eliminar(IdEmpleado) {

    if (confirm("¿Estas seguro de eliminar al Empleado seleccionado?")) {
        $.ajax({
            type: 'DELETE',
            url: 'http://localhost:10038/api/empleado/' + IdEmpleado,
            success: function (result) {
                $('#myModal').modal();
                GetAll();
            },
            error: function (result) {
                alert('Error en la consulta.' + result.responseJSON.ErrorMessage);
            }
        });

    };
};