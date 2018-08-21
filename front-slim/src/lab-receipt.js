import { Slim } from 'slim-js';
import { tag, template, useShadow } from 'slim-js/Decorators';

@tag('lab-receipt')
@template(`
<ol>
  <li s:repeat="receipt.products as data">
    <span>{{data.name}}</span>
    <button
      bind:can-duplicate="canDuplicate(data, receipt)"
      click="duplicateItem"
    >+1</button>
    <button click="removeItem" bind:data="data">X</button>
    <lab-prod-effects
      bind:receipt="receipt"
      bind:can-duplicate="canDuplicate(data, receipt)"
      bind:main-effect="data.mainEffect"
      bind:effects="appliedEffects(data, canDuplicate)"
    ></lab-prod-effects>
  </li>
  <li s:repeat="receipt.specials">
    <span>{{data.name}}</span>
    <button click="removeItem" bind:data="data">X</button>
  </li>
</ol>
<div
  role="empty"
  bind:is-empty="isEmpty(receipt)">
השתמש בתיבת החיפוש כדי להוסיף מרכיבים למתכון
</div>
<style>
  button[can-duplicate="false"] {
    display: none;
  }
  div[role="empty"] {
    color: darkblue
  }
  div[is-empty="false"] {
    display: none
  }
</style>
`)
@useShadow(true)
class LabEffects extends Slim {
  receipt;

  constructor () {
    super();
    this.receipt = {products: [], specials: []};
  }

  isEmpty({products, specials}) {
      return 0 == (products.length + specials.length)
  }

  canDuplicate(item) {
    return this.receipt.products
      .filter( ({id}) => id === item.id )
      .length < 2
  }
  
  appliedEffects(item) {
      return this.canDuplicate(item)
        ? item.effects
        : [item.mainEffect]
  }

  duplicateItem ({target}) {
    const { data } = target;
    target.remove();
    this.callAttribute('on-duplicate', data);
  }

  removeItem ({target}) {
    const { data } = target;
    this.callAttribute('on-remove', data);
  }
}

@tag('lab-product')
@useShadow(true)
@template(`
    <span>{{product.name}}</span>
    <button
      bind:can-duplicate="canDuplicate(product, receipt)"
      click="duplicateItem"
    >+1</button>
    <button click="removeItem" bind:product="product">X</button>
    <div role="effects">
      <span
        s:repeat="effects(product, receipt) as effect"
        bind:role="roleOf(effect)"
      >{{effect.name}}</span>
    </div>
`)
class LabProduct extends Slim {
  product;
  receipt;
  onRemove;
  
  effects(product, receipt) {
      return receipt.products.filter(({id}) => id == product.id).length > 1
        ? [ product.mainEffect ]
        : product.effects
  }

  removeItem ({target}) {
    const { product } = target;
    this.callAttribute('on-remove', data);
  }
}

@tag('lab-prod-effects')
@useShadow(true)
@template(`
  <style>
    div {
      display: flex;
      flex-direction: row;
    }
    span[role="main"] { font-weight: bold }
    span {
      margin: 3px;
      padding: 2px;
      color: darkgray;
      border: 1px solid darkgray;
      display: inline-block;
      border-radius: 2px;
    }
    
  </style>
  <div>
    <span
      s:repeat="effects"
      bind:role="roleOf(data)"
    >{{data.name}}</span>
  </div>
`)
class LabProdEffects extends Slim {
  mainEffect;
  effects;
  canDuplicate;

  roleOf(data) {
    return this.mainEffect.id == data.id ? "main" : "sec"
  }
}