$(document).one('focus.autoExpand', 'textarea.autoExpand', ->
  savedValue = @value
  @value = ''
  @baseScrollHeight = @scrollHeight
  @value = savedValue
  return
).on 'input.autoExpand', 'textarea.autoExpand', ->
  @rows = @getAttribute('minrows') | 0
  lineHeight = @baseScrollHeight / 3
  @rows += Math.ceil((@scrollHeight - (@baseScrollHeight)) / lineHeight)
  return

jQuery ->
  $('#datepick').datepicker
    dateFormat: 'M d, yy'
    onClose: (strDate, datepicker) ->
      # $('form#dateform').trigger 'submit.rails'
      Rails.fire($(this).closest('form').get(0), 'submit')
      return
      
# $('form').submit(function() {  
#     var valuesToSubmit = $(this).serialize();
#     $.ajax({
#         type: "POST",
#         url: $(this).attr('action'), //sumbits it to the given url of the form
#         data: valuesToSubmit,
#         dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
#     }).success(function(json){
#         console.log("success", json);
#     });
#     return false; // prevents normal behaviour
# });