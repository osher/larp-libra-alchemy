import Vue from 'vue'
import model from 'libra-front-model'
import App from './app.vue'
import store from './store'
import io from 'socket.io-client';

//const {SVR} = {SRV: '/api'} //require('./config').get(location.hostname)
const SVR = window.SRV = location.hash ? location.hash.substr(1) : location.href + '/api';
require('./index.scss')

const socket = io(`${SVR}`);
socket.on('potion-published', potion => 
  console.log('potion-published', potion)
  || model.data.potions.addEntity(potion)
);

fetch(`${SVR}/model`)
.then( res => res.json() )
.then( data => model.init(data))
.then( () => console.log('model initiated',  window.model = model ));

Vue.config.productionTip = false;

const app = window.app = new Vue({
  store,
  render: h => h(App)
}).$mount('#app')

console.log('app', app.$children[0].drop)
