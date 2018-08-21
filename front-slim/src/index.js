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
<div role="main">
  <div role="index">
    <lab-index
      s:id="labIndex"
      on-index-selection="indexSelection"
    ></lab-index>
  </div>
  <div role="content">
  
    <lab-search
      s:id="labSearch"
      bind:model="model"
      on-selection="addSelection"
    ></lab-search>
    
    <h3>מתכון</h3>
    <lab-receipt s:id="labReceipt"
      on-duplicate="receiptDuplicate"
      on-remove="receiptRemove"
    ></lab-receipt>
    
    <h3>השפעות</h3>
    <ol s:if="appliedEffects.length">
      <li s:repeat="appliedEffects as applied">
        {{applied.effect.name}} - (רמה {{applied.level}})
      </li>
    </ol>
    <div role="empty" s:if="!appliedEffects.length">
      אין השפעות
    </div>
    
    <h3>שיקויים דומים</h3>
    <ol s:if="similarPotions.length">
      <li s:repeat="similarPotions as similarPotion">
        {{similarPotion.name}}
      </li>
    </ol>
    <div role="empty" s:if="!similarPotions.length">
      אין שיקויים דומים
    </div>
  </div>
</div>
<style>
  div[role="main"] {
    display: flex;
    flex-direction: row;
  }

  div[role="content"] {
    display: flex;
    padding: 20px; 
    flex-direction: column;
  }

  div[role="empty"] {
    color: darkblue
  }

  @import url(https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.1/css/materialize.min.css);
</style>
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
      this.receipt = window.receipt = model.receipt();
  }
  
  receiptDuplicate (item) {
      const collection = 
        item.type == 'si'
          ? this.receipt.specials
          : this.receipt.products
        ;
      collection.push(item);
      collection.sort(({name:a}, {name:b}) => a > b ? 1 : a == b ? 0 : -1);
      this.update();
  }
  
  receiptRemove (item) {
      this.receipt.drop(item)
      this.labReceipt.receipt = { products: [], specials: [] };
      this.update();
  }

  update() {
      this.labReceipt.receipt = this.receipt;
      this.appliedEffects = this.receipt.effects = this.model.lab.execute(this.receipt);
  }
  
  addSelection ({ingredient, procedure, specialIngredient}) {
      if (specialIngredient) {
          this.receipt.specialize(specialIngredient)
      } else {
          this.receipt.produce(ingredient, procedure);
      }
      this.update()
  }

  onCreated() {
      this.labIndex.labSearch = this.labSearch;

      fetch('http://localhost:3030/model')
      .then( res => res.json() )
      .then( data => model.init(data))
      .then( () => 
        console.log('model initiated',  window.model = model ) 
        || this.populate(model.data)
      );
  }
  populate({ingredients, procedure: procedures, specialEffects}) {
    
      assign(this.labIndex, {ingredients, procedures, specialEffects});
  }
}