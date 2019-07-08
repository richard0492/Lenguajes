function hide(id) {
    document.getElementById(id).style.display = 'none';

}
function show(id) {
    document.getElementById(id).style.display = 'block';
}



function showModalState() {
    $(document).ready(function () {
        $("#exampleModalState").modal({ backdrop: 'static', keyboard: false });
    });
}
function showModal() {
    $(document).ready(function () {
        $("#exampleModalCenter").modal({backdrop: 'static', keyboard: false});
    });
}

function showModalChange() {
    $(document).ready(function () {
        $("#exampleModal").modal({ backdrop: 'static', keyboard: false });
    });
}

function showModaOrders() {
    $(document).ready(function () {
        $("#exampleModalCenterOrder").modal({ backdrop: 'static', keyboard: false });
    });
}


function showModaUpdateU() {
    $(document).ready(function () {
        $("#exampleModalU").modal({ backdrop: 'static', keyboard: false });
    });
}

function showModaUpdate() {
    $(document).ready(function () {
        $("#exampleModalCenterU").modal({ backdrop: 'static', keyboard: false });
    });
}

function agregarFila() {
    document.getElementById("tablaprueba").insertRow(-1).innerHTML = '<td></td><td></td><td></td><td></td>';
}

function eliminarFila() {
    var table = document.getElementById("tablaprueba");
    var rowCount = table.rows.length;
    //console.log(rowCount);

    if (rowCount <= 1)
        alert('No se puede eliminar el encabezado');
    else
        table.deleteRow(rowCount - 1);
}



