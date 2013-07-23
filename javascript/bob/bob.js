// The test has been modified to use local require:
// var Bob = require('./bob');

function Bob() {
  this.hey = function(msg) {
    if (msg.length == 0) return "Fine, be that way."
    if (msg.toUpperCase() === msg) return "Woah, chill out!"
    if (msg.slice(-1) === '?') return "Sure"
    return 'Whatever';
  }
}

module.exports = Bob;
