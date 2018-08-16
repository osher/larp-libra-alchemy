require('./index.scss')
const {assign} = Object;
import {Slim} from "slim-js"
import {tag, template, useShadow} from "slim-js/Decorators"
import model from "libra-front-model"
require('./lab-index')
require('./lab-search')
require('./lab-effects');
require('./extension-enterkey')

@tag('alchemy-lab')
@template(
`
<style>
  div[role="main"] {
    display: flex;
    flex-direction: row;
  }
  
  div[role="content"] {
    display: flex;
    flex-direction: column;
  }
  
  @import url(https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.1/css/materialize.min.css);
</style>

<div role="main">
  <div role="index">
    <lab-index s:id="labIndex"></lab-index>
  </div>
  <div role="content">
  
    <lab-search bind:model="model" on-selection="addSelection"></lab-search>
    
    <h3>מתכון</h3>
    <lab-receipt s:id="labReceipt"
      on-duplicate="receiptDuplicate"
      on-remove="receiptRemove"
    ></lab-receipt>
    
    <h3>השפעות</h3>
    <ol s:if="appliedEffects.length">
      <li s:repeat="appliedEffects as appliedEffect">
        {{appliedEffect.effect.name}}
      </li>
    </ol>    
    
    <h3>שיקויים דומים</h3>
    <ol s:if="similarPotions.length">
      <li s:repeat="similarPotions as similarPotion">
        {{similarPotion.name}}
      </li>
    </ol>
  </div>
</div>
`
)
@useShadow(true)
class AlchemyLab extends Slim {
  
  model;
  receipt;
  effects = [];
  
  constructor () {
    super();
    this.model = model;
    this.receipt = model.receipt();
  }
  
  receiptDuplicate (item) {
      const collection = 
        item.type == 'si'
          ? this.receipt.specials
          : this.receipt.products
        ;
      collection.push(item);
      collection.sort(({name:a}, {name:b}) => a > b ? 1 : a == b ? 0 : -1);
    this.labReceipt.receipt = this.receipt;
  }
  
  receiptRemove (item) {
    this.receipt.drop(item)
    this.labReceipt.receipt = this.receipt;
  }
  
  addSelection ({ingredient, procedure, specialIngredient}) {
    if (specialIngredient) {
      this.receipt.specialize(specialIngredient)
    } else {
      this.receipt.produce(ingredient, procedure);
    }
    this.labReceipt.receipt = this.receipt;
    this.appliedEffects = this.model.lab.execute(this.receipt);
  }
  
  onCreated() {
      fetch('http://localhost:3030/model')
      .then( res => res.json() )
      .then( data => model.init(data))
      .then( () => console.log('model initiated',  window.model = model ) || this.populate(model.data));
  }
  populate({ingredients, procedure: procedures, specialEffects}) {
    
      assign(this.labIndex, {ingredients, procedures, specialEffects});
  }
}