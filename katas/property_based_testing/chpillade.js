// Simple FIFO stack riddled with bugs

var stack = function(){
  return {
    buffer: [],
    add: function (item){
      return this.buffer.push(item);
    },
    get: function (){
      return this.buffer.shift();
    },
    length: function (){
      return this.buffer.length;
    }
  };
};

module.exports = stack;
