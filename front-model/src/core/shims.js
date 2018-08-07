//--- shims ------------------------
global.assign = Object.assign;

Number.is = v => v && 'number' == typeof v;
String.is = v => v && 'string' == typeof v;
Object.is = v => v && 'object' == typeof v;
Function.is = v => 'function' == typeof v;

assign(Array.prototype, {
  into(id, sep = '') { $e(id).innerHTML = this.join(sep) },
  first() { return this[0] },
  last() { return this[this.length -1] } 
});
//--- /shims -----------------------