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
