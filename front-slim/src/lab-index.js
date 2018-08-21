import {Slim} from "slim-js"
import {tag, template, useShadow} from "slim-js/Decorators"

@tag("lab-index")
@template(
`
 <h4>מרכיבים</h4>
  <span
    s:repeat="ingredients as data" 
    bind:ingredient="data"
    click="click"
    mtype="i" 
  >{{data.name}}</span>
 <h4>תהליכים</h4>
  <span 
    s:repeat="procedures" 
    bind:procedure="data"
    click="click"
    mtype="p"
  >{{data.name}}</span>
 <hr>
 <h4>מיוחדים</h4>
  <span
    s:repeat="specialEffects"
    bind:special="data"
    click="click"
    mtype="si"
  >{{data.name}}</span>
 <style>
  :host {
    display: flex;
    padding: 10px;
    flex-direction: column;
    background: lightgrey;
  }

  span:hover {
    background: var(--result-hover);
    cursor: pointer;
  }
  span::before {
    font-size: 55%;
    display: inline-block;
    border-radius: 2px;
    color: white;
    padding: 2px;
    margin: 2px;
    position: relative;
    top: -2px;
    letter-spacing: 1px;
    opacity: 0.8;
  }
  span[mtype="si"] {
    color: var(--color-sp);
  }
  span[mtype="si"]::before {
    content: "מיוחד";
    background: var(--color-sp);
  }
  span[mtype="i"] {
    color: var(--color-ing);
  }
  span[mtype="i"]::before {
    content: "מרכיב";
    background: var(--color-ing);
  }
  span[mtype="p"] {
    color: var(--color-pr);
  }
  span[mtype="p"]::before {
    content: "תהליך";
    background: var(--color-pr);
  }
 </style> 
`
)
@useShadow(true)
class LabIndex extends Slim {
  click({currentTarget, target}) {
    const { ingredient, procedure, special } = currentTarget;
    this.labSearch.fromIndex(
      ingredient && ingredient.name
      || procedure && procedure.name
      || special && special.name);
  }
}