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

}).call(this);
