import Vue from 'vue'
import model from 'libra-front-model'
import App from './app.vue'
import store from './store'
require('./index.scss')

fetch('http://localhost:3030/model')
.then( res => res.json() )
.then( data => model.init(data))
.then( () => console.log('model initiated',  window.model = model ));

Vue.config.productionTip = false;

new Vue({
  store,
  render: h => h(App)
}).$mount('#app')
