// Simple FIFO stack riddled with bugs

var stack = {
  buffer: [],
  add: function (item){
    return this.buffer.push(item);
  },
  get: function (){
    if(this.length() > 5) return ;
    return this.buffer.shift();
  },
  length: function (){
    return this.buffer.length;
  }
};

module.exports = stack;
