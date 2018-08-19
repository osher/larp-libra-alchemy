import { Slim } from 'slim-js';
import { tag, template, useShadow } from 'slim-js/Decorators';

@tag('lab-receipt')
@template(`
<ol>
  <li s:repeat="receipt.products">
    <span>{{data.name}}</span>
    <button
      bind:can-duplicate="canDuplicate(data, receipt)"
      click="duplicateItem"
      role="duplicate"
    >+1</button>
    <button click="removeItem" bind:data="data">X</button>
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
    this.receipt = null;
  }

  isEmpty({products, specials}) {
      return 0 == (products.length + specials.length)
  }

  canDuplicate (item) {
    return this.receipt.products
      .filter( ({id}) => id === item.id )
      .length < 2
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