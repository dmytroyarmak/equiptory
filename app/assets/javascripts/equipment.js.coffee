# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#equipment_type_id').change (event) ->
    $('.additional_attribute').hide()
      .find('.destroy').val('1')
    $('.type-'+$(this).val()).show()
      .find('.destroy').val('0')
  .change()

  $(".date_picker").datepicker({"format": "dd.mm.yyyy", "weekStart": 1, "startView" : 2, "autoclose": true, "language": "uk" })