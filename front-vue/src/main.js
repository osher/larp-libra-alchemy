import Vue from 'vue'
import model from 'libra-front-model'
import App from './app.vue'
import store from './store'
import io from 'socket.io-client';

const {SVR} = require('./config')(location.hostname)
require('./index.scss')

//const socket = io(`${SVR}/socket`);

fetch(`${SVR}/model`)
.then( res => res.json() )
.then( data => model.init(data))
.then( () => console.log('model initiated',  window.model = model ));

Vue.config.productionTip = false;

new Vue({
  store,
  render: h => h(App)
}).$mount('#app')
