import {Slim} from "slim-js"
import {tag, template, useShadow} from "slim-js/Decorators"

@tag("lab-index")
@template(
`
 <h4>מרכיבים</h4>
  <span s:repeat="ingredients as i" mtype="i">{{i.name}}</span>
 <h4>תהליכים</h4>
  <span s:repeat="procedures as p" mtype="p">{{p.name}}</span>
 <hr>
 <h4>מיוחדים</h4>
  <span s:repeat="specialEffects as si" mtype="si">{{si.name}}</span>
 <style>
  :host {
    display: flex;
    padding: 10px;
    flex-direction: column;
    background: lightgrey;
  }

  span:hover {
    background-color: yellow;
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
  

}