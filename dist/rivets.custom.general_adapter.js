(function() {
  var rivets;

  rivets = this.rivets;

  rivets.configure({
    adapter: {
      subscribe: function(obj, keypath, callback) {
        if (obj.on != null) {
          return obj.on("change:" + keypath, callback);
        }
      },
      unsubscribe: function(obj, keypath, callback) {
        if (obj.off != null) {
          return obj.off("change:" + keypath, callback);
        }
      },
      read: function(obj, keypath) {
        return obj[keypath];
      },
      publish: function(obj, keypath, value) {
        return obj[keypath] = value;
      }
    }
  });

}).call(this);
