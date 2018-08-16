import {Slim} from "slim-js"
import {tag, template, useShadow} from "slim-js/Decorators"

@tag("lab-index")
@template(
`
<style>
  :host {
    display: flex;
    flex-direction: column;
    background: grey;
  }
</style>

<ol>
  <li s:repeat="ingredients as i">{{i.name}}</li>
 </ol>
 <hr>
 <ol>
  <li s:repeat="procedures as i">{{i.name}}</li>
 </ol>
 <hr>
 <ol>
  <li s:repeat="specialEffects as i">{{i.name}}</li>
 </ol>
`
)
@useShadow(true)
class LabIndex extends Slim {
  

}