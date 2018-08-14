import Vue from 'vue'
import model from 'libra-front-model'
import App from './App.vue'
import store from './store'

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


fetch('http://localhost:3030/model')
.then( res => res.json() )
.then( data => model.init(data))
.then( () => console.log('model initiated',  window.model = model ));

Vue.config.productionTip = false

new Vue({
  store,
  render: h => h(App)
}).$mount('#app')
