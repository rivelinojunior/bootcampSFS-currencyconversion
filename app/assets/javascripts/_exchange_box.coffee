$(document).ready ->
  $('#quantity').on 'change', ->
    send_async()

  $("#currency").on 'change', ->
    send_async()

  $("#currency_destination").on 'change', ->
    send_async()

  send_async = ->
    if($("#currency").val() != '')
      $("#result").focus()
      $("#loading-result").addClass 'show'
      $.ajax '/exchange',
        type: 'POST'
        dataType: 'json'
        data: {
          currency: $("#currency").val(),
          currency_destination: $("#currency_destination").val(),
          quantity: $("#quantity").val()
        }
        error: (jqXHR, textStatus, errorThrown) ->
          $("#loading-result").removeClass 'show'
          alert textStatus
        success: (data, text, jqXHR) ->
          $('#result').val(data.value)
          $("#loading-result").removeClass 'show'

  $("#btn-toggle").on 'click', ->
    currency = $("#currency").val().toString()
    currency_destination = $("#currency_destination").val().toString()
    $("#currency").val(currency_destination)
    $("#currency_destination").val(currency)
    send_async()

