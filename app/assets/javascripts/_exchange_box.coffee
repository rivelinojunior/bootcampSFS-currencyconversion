$(document).ready ->
  $('form').submit ->
    if $('form').attr('action') == '/exchange'
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
      return false;