$(document).one('focus.autoExpand', 'textarea.autoExpand', ->
  savedValue = @value
  @value = ''
  @baseScrollHeight = @scrollHeight
  @value = savedValue
  return
).on 'input.autoExpand', 'textarea.autoExpand', ->
  @rows = @getAttribute('data-min-rows') | 1
  lineHeight = @baseScrollHeight / 3
  @rows += Math.ceil((@scrollHeight - (@baseScrollHeight)) / lineHeight)
  return

# $(document).on "turbolinks:load", ->
#   $('#click-link').click ->
#     alert "Clicked!"