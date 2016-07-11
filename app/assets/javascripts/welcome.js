$(function() {

  var baseUrl = document.location.href;
  // urls busquedas
  var queryUrl = '/search/';
  // urls exportar reportes
  var exportUrl = '/export/';
  // urls para modal detalle de email
  var callDetailUrl = 'calls/';
  // link dinamico para las rutas de exportar
  var exportLink = '';

  $(document).ready(function() {
    baseUrl = baseUrl.split('/');
    delete baseUrl[4];
    //delete baseUrl[3];
    baseUrl = baseUrl.join('/')
    baseUrl = baseUrl.substring(0, baseUrl.length - 1);
    console.log(baseUrl);

    setDefaultDates();
    $('#menuModal').modal('show', true);
  });

  function setDefaultDates() {
    $('#date_from').val(moment().subtract(7, 'days').format('YYYY-MM-DD'));
    $('#date_to').val(moment().format('YYYY-MM-DD'));
  };

  $('#showMenu').on('click', function() {
    $('#menuModal').modal('show', true);
  });

  $('#run_search').on('click', function() {
    $('#closeMenuModal').click();
    $('#loadingModal').modal('show', true);
    var date_from = $('#date_from').val();
    var date_to = $('#date_to').val();
    date_from = date_to_timestamp(date_from);
    date_to = date_to_timestamp(date_to);
    var link = baseUrl + queryUrl + date_from + '/' + date_to + '/';
    drawJTables(link);
    $('#closeLoadingModal').click();
    exportLink = baseUrl + exportUrl + date_from + '/' + date_to + '/';
    $('#btnGenerateReport').show();
  });

  function drawJTables(urlSource) {
    var table = $('#tableCall').dataTable({
      "ajaxSource": urlSource,
      "destroy": true,
      "lengthChange": false,
      "ordering": false,
      "pageLength": 50,
      "paging": true,
      "processing": true,
      "scrollCollapse": true,
      "scrollX": "100%",
      "scrollY": "450px",
      "searching": false,
      "serverSide": true,
      "columns": [{
        'data': 'pk',
        'title': 'Detalle',
        'render': function(data, type, row, meta) {
          if (data != null) {
            var html = '';
            html +=
              '<span style="font-size:16px;color:#2196f3;align:center;cursor:pointer;" title="Click para ver más detalle." class="glyphicon glyphicon-info-sign" id="spanDetail" data-pk="' +
              data + '"></span>';
            return html;
          } else {
            return "";
          };
        },
      }, {
        'data': 'timeStamp',
        'title': 'Fecha',
        'render': function(data, type, row, meta) {
          return (!data) ? "" : moment(data).format(
            'DD-MM-YYYY H:mm:ss');
        },
      }, {
        'data': 'beginCall',
        'title': 'Inicio llamada',
        'render': function(data, type, row, meta) {
          return (!data) ? "" : moment(data).format(
            'DD-MM-YYYY H:mm:ss');
        },
      }, {
        'data': 'origin',
        'title': 'Nº que llama',
      }, {
        'data': 'callAnswered',
        'title': 'Contestó IVR',
        'render': function(data, type, row, meta) {
          var html = '';
          if (data) {
            html =
              '<div align="center"><span class="glyphicon glyphicon-ok"></span></div>';
          } else {
            html =
              '<div align="center"><span class="glyphicon glyphicon-remove"></span></div>';
          };
          return html;
        },
      }, {
        'data': 'IVRSel',
        'title': 'Nº Anexo',
      }, {
        'data': 'dialIntentBegin1',
        'title': 'Fecha Inicio',
        'render': function(data, type, row, meta) {
          return (!data) ? "" : moment(data).format(
            'DD-MM-YYYY H:mm:ss');
        },
      }, {
        'data': 'dialIntentCaller1',
        'title': 'Nº que llama',
      }, {
        'data': 'dialIntentCalled1',
        'title': 'Nº donde se transfiere',
      }, {
        'data': 'dialIntentEnd1',
        'title': 'Fecha término',
        'render': function(data, type, row, meta) {
          return (!data) ? "" : moment(data).format(
            'DD-MM-YYYY H:mm:ss');
        },
      }, {
        'data': 'dialIntentAnswered1',
        'title': 'Transferencia contestada',
        'render': function(data, type, row, meta) {
          var html = '';
          if (data) {
            html =
              '<div align="center"><span class="glyphicon glyphicon-ok"></span></div>';
          } else {
            html =
              '<div align="center"><span class="glyphicon glyphicon-remove"></span></div>';
          };
          return html;
        },
      }, {
        'data': 'endDial',
        'title': 'Término llamada',
        'render': function(data, type, row, meta) {
          return (!data) ? "" : moment(data).format(
            'DD-MM-YYYY H:mm:ss');
        },
      }, ],
      "language": {
        "emptyTable": "No se encontraron registros.",
        "info": "Página _PAGE_ de _PAGES_",
        "infoEmpty": "No se encontraron registros.",
        "infoFiltered": "(Filtrado de _MAX_ registros).",
        "loadingRecords": "Cargando...",
        "paginate": {
          "previous": "Anterior",
          "next": "Siguiente",
        },
        "processing": "Proceso en curso.",
        "search": "Buscar",
        "zeroRecords": "No se encontraron registros.",
      },
    });
    table.removeClass('display');
    table.addClass(
      'table table-hover table-striped table-condensed table-responsive'
    );
  };
});
