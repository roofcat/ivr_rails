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

    setDefaultDates();
    setDateTimePicker( '#date_from' );
    setDateTimePicker( '#date_to' );

  });

  function setDefaultDates() {
    $('#date_from').val(moment().subtract(7, 'days').format('YYYY-MM-DD'));
    $('#date_to').val(moment().format('YYYY-MM-DD'));
  };

  function setDateTimePicker ( selector ) {
    $( selector ).bootstrapMaterialDatePicker({
      time: false,
      format: 'YYYY-MM-DD',
      lang: 'es',
      weekStart: 1,
      cancelText: 'Cancelar',
      okText: 'Ok',
    });
  };

  $('#showMenu').on('click', function() {
    $('#menuModal').modal('show', true);
  });

  $('#run_search').on('click', function() {
    $('#closeMenuModal').click();
    $('#loadingModal').modal('show', true);
    $('#closeLoadingModal').click();

    exportLink = baseUrl + exportUrl + date_from + '/' + date_to + '/';
    $('#btnGenerateReport').show();
  });

});
