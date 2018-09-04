const src = process.argv[2];
if (!src) return console.error('Error: no source\nplease provide the path to the source for conversion\n\n');

const trg = process.argv[3] || process.argv[2] + '.converted.sql'
const txt = require('../lib')({src, trg})

console.log('converted from %s to %s, total %s statements', src, trg, txt.split(';').length);