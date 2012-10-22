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
    # alert $(this).val()
    # $(this).prev('input[type=hidden]').val('1')
    # $(this).closest('.control-group').hide()
    # event.preventDefault()

  # $('form').on 'click', '.add_fields', (event) ->
  #   time = new Date().getTime()
  #   regexp = new RegExp($(this).data('id'), 'g')
  #   $(this).closest('.control-group').before($(this).data('fields').replace(regexp, time))
  #   event.preventDefault()