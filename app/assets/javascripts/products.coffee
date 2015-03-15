# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org

$(document).on 'ready page:load', ->
  starCaptions = 
    1: 'Very Poor'
    2: 'Poor'
    3: 'OK'
    4: 'Good'
    5: 'Very Goog'
  $('#rating_value').rating
    min: 0
    max: 5
    step: 1
    size: 'xs'
    starCaptions: starCaptions

  $('#products').dataTable
    pagingType: 'full_numbers'
    bSearchable: false
  $('#products_filter').css("display", "none")  
  return
  