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
      Rails.fire($(this).closest('form').get(0), 'submit')
      return