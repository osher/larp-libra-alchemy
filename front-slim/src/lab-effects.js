import { Slim } from 'slim-js';
import { tag, template, useShadow } from 'slim-js/Decorators';

@tag('lab-receipt')
@template(`
<style>
  button[can-duplicate="false"] {
    display: none;
  }
</style>
<ol s:if="receipt">
  <li s:repeat="receipt.products">
    <span>{{data.name}}</span>
    <button bind:can-duplicate="canDuplicate(data)" role="duplicate" s:if="canDuplicate(data)" click="handlePlusClick" bind:data="data">+1</button>
    <button click="handleXClick" bind:data="data">X</button>
  </li>
  
  <li s:repeat="receipt.specials">
    <span>{{data.name}}</span>
    <button click="handleXClick" bind:data="data">X</button>
  </li>
</ol>
`)
@useShadow(true)
class LabEffects extends Slim {
  
  constructor () {
    super();
    this.receipt = null;
  }
  
  canDuplicate (item) {
    return this.receipt.products
      .filter( ({id}) => id === item.id )
      .length < 2
  }
  
  handlePlusClick ({target}) {
    const { data } = target;
    target.remove();
    this.callAttribute('on-duplicate', data);
  }
  
  handleXClick ({target}) {
    const { data } = target;
    this.callAttribute('on-remove', data);
  }
}