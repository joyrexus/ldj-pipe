// Generated by CoffeeScript 1.6.3
(function() {
  var pipe, split, stdin, stdout, trans;

  split = require('split')();

  trans = require('stream').Transform({
    decodeStrings: false
  });

  stdin = process.stdin, stdout = process.stdout;

  process.stdout.on('error', process.exit);

  pipe = {};

  pipe.through = function(filter) {
    trans._transform = function(data, enc, done) {
      if (data) {
        data = JSON.parse(data);
        this.push(JSON.stringify(filter(data)) + "\n");
      }
      return done();
    };
    return stdin.pipe(split).pipe(trans).pipe(stdout);
  };

  module.exports = pipe;

}).call(this);