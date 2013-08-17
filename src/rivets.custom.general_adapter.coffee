rivets = @rivets

rivets.configure
  adapter:
    subscribe: (obj, keypath, callback) ->
      if obj.on?
        obj.on "change:" + keypath, callback

    unsubscribe: (obj, keypath, callback) ->
      if obj.off?
        obj.off "change:" + keypath, callback

    read: (obj, keypath) ->
      obj[keypath]

    publish: (obj, keypath, value) ->
      obj[keypath] = value

