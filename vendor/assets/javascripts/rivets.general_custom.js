// rivets.custom_by_vkill.js
// version: 0.1.1
// author: vkill
// license: MIT
(function() {
  var rivets;

  rivets = this.rivets;

  rivets.configure({
    prefix: 'bind'
  });

}).call(this);

(function() {
  var rivets;

  rivets = this.rivets;

  rivets.binders.content = {
    routine: rivets.binders.text,
    bind: function(el) {
      var self;

      self = this;
      this.callback = function() {
        return rivets.config.adapter.publish(self.model, self.keypath, el.textContent);
      };
      return el.addEventListener("input", this.callback, false);
    },
    unbind: function(el) {
      return el.removeEventListener("input", this.callback, false);
    }
  };

  rivets.binders.color = function(el, value) {
    return el.style.color = value;
  };

}).call(this);

(function() {
  var rivets;

  rivets = this.rivets;

  rivets.formatters.shortdate = function(value) {
    return moment(value).format("YYYY-MM-DD");
  };

  rivets.formatters.number = function(value) {
    return +value;
  };

  rivets.formatters.string = function(value) {
    return String(value);
  };

  rivets.formatters.negate = function(value) {
    return !value;
  };

  rivets.formatters.eq = function(value, args) {
    return value === args;
  };

  rivets.formatters.not_eq = function(value, args) {
    return value !== args;
  };

  rivets.formatters.gt = function(value, arg) {
    return value > arg;
  };

  rivets.formatters.lt = function(value, arg) {
    return value < arg;
  };

  rivets.formatters.blank = function(value) {
    return (value == null) || value === "";
  };

  rivets.formatters.preventDefault = function(value) {
    return function(e) {
      e.preventDefault();
      value.call(this, e);
      return false;
    };
  };

  rivets.formatters.length = function(value) {
    return value.length;
  };

  rivets.formatters.mask = function(value, left, right, mask) {
    var formatted;

    formatted = value.substring(0, left);
    formatted + mask;
    formatted += value.substring(value.length - right);
    return formatted;
  };

}).call(this);

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
