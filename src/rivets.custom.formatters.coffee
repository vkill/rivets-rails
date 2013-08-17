rivets = @rivets

# 
# from https://github.com/mikeric/rivets/wiki/Example-formatters
# 
rivets.formatters.shortdate = (value) ->
  moment(value).format "YYYY-MM-DD"

rivets.formatters.number = (value) ->
  +value

rivets.formatters.string = (value) ->
  String value

# Boolean negation
rivets.formatters.negate = (value) ->
  not value

# data-class-disabled="model.valid | negate"

# Equals
rivets.formatters.eq = (value, args) ->
  value is args

# data-class-disable="model.foo | number | eq 4"

# Not equal
rivets.formatters.not_eq = (value, args) ->
  value isnt args

# data-class-disable="model.foo | not_eq 4"

# Greater than
rivets.formatters.gt = (value, arg) ->
  value > arg

# data-class-disable="model.foo | gt 4"

# Lower than
rivets.formatters.lt = (value, arg) ->
  value < arg

# data-class-disable="model.foo | lt 4"

# Blank
rivets.formatters.blank = (value) ->
  not value? or value is ""

# data-hide="model.foo | blank"

# Event handler preventDefault
rivets.formatters.preventDefault = (value) ->
  (e) ->
    e.preventDefault()
    value.call this, e
    false

# data-on-submit="model:save | preventDefault"



# 
# custom
# 
rivets.formatters.length = (value) ->
  value.length

# data-length="model.foo | length"


# 
# from http://rivetsjs.com/
# 
rivets.formatters.mask = (value, left, right, mask) ->
  formatted = value.substring(0, left)
  formatted + mask
  formatted += value.substring(value.length - right)
  formatted

# <span data-text="billing.cardNumber | mask 4 4 ********"></span>

