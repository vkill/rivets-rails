rivets = @rivets

# 
# Support of Contenteditable
# http://jsfiddle.net/3yLQY/4/
# 
rivets.binders.content =
  routine: rivets.binders.text
  bind: (el) ->
    self = this
    @callback = ->
      rivets.config.adapter.publish self.model, self.keypath, el.textContent

    el.addEventListener "input", @callback, false

  unbind: (el) ->
    el.removeEventListener "input", @callback, false
