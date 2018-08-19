import { Slim } from 'slim-js';
import { tag, template, useShadow } from 'slim-js/Decorators';

@tag('lab-search')
@template(`

<style>
  :host {
    display: flex;
    flex-direction: column;
  }
  
  search-result {
    cursor: pointer;
    display: inline-block;    
  }
  
  search-result[is-selected="true"] {
    background: var(--result-hover);
  }
  
  @import url(https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.1/css/materialize.min.css);
</style>

<span>
  <label>{{getPrefix(ingredient, procedure, specialIngredient)}}</label>
  <input s:id="queryInput" type="text" input="handleInput">
  <label>{{getPostfix(ingredient, procedure, specialIngredient)}}</label>
</span>

<search-result
  s:repeat="results as result"
  click="handleItemClick"
  mousemove="itemMouseDetector"
  bind:is-selected="isSelected(result, currentSelection)"
  bind:result-type="result.type"
></search-results>

`)
@useShadow(true)
class LabSearch extends Slim {
  
  model;
  ingredient;
  prodecure;
  specialIngredient;
  results;
  currentSelection;
  
  isSelected (item, currentSelection) {
    return currentSelection === item;
  }
  
  itemMouseDetector ({currentTarget}) {
    this.currentSelection = currentTarget.result;
  }
  
  connectedCallback () {
    // native from the browser
    this.addEventListener('keyup', ({key}) => {
      if (!this.results.length) {
        return
      };
      let targetIndex = Math.max(0, this.results.indexOf(this.currentSelection));
      switch (key) {
        case 'ArrowUp':
          targetIndex = Math.max(0, targetIndex - 1);
        break;
        case 'ArrowDown':
          targetIndex = Math.min(this.results.length - 1, targetIndex + 1);
        break;
        case 'Enter':
          this.submit();
          break;
      }
      this.currentSelection = this.results[targetIndex];
    });
  }
  
  getPostfix () {
    const { ingredient } = this;
    return ingredient ? 'של ' + ingredient.name : '';
  }
  
  getPrefix () {
    const { procedure } = this;
    return procedure ? procedure.name + ' של': 'חפש';
  }
  
  onRender () {
    this.handleInput({target: this.queryInput});
  }
  
  submit () {
    this.handleItemClick({
      currentTarget: {
        result: this.currentSelection
      }
    });
  }
  
  handleItemClick ({currentTarget}) {
    const { result } = currentTarget;
    switch (result.type) {
      case 'i':
        this.ingredient = result;
      break;
      case 'si':
        this.specialIngredient = result;
      break;
      case 'p':
        this.procedure = result;
      break;
    }
    this.queryInput.value = '';
    this.checkAndNotify();
    this.handleInput();
  }
  
  checkAndNotify () {
    const { ingredient, procedure, specialIngredient } = this;
    if ((ingredient && procedure) || specialIngredient) {
      this.callAttribute('on-selection', this);
      this.ingredient = this.procedure = this.specialIngredient = null;
    }
  }
  
  handleInput () {
    const {value: query} = this.queryInput;
    const { model, ingredient, procedure } = this;
      
      if (!model || !query) return this.results = [];
      
      if (procedure) return this.results = model.data.ingredients.byName(query);
      if (ingredient) return this.results = model.data.procedure.byName(query);
      
      this.results = model.data.procedure.byName(query)
        .concat(
          model.data.ingredients.byName(query),
          model.data.specialEffects.byName(query)
        );
  }
  
}


@tag('search-result')
@template(`
<style>

  :host([result-type="i"]) {
    color: var(--color-ing);
  }
  
  :host([result-type="p"]) {
    color: var(--color-pr);
  }
  
  :host([result-type="si"]) {
    color: var(--color-sp);
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
  span[type="si"]::before {
    content: "מיוחד";
    background: var(--color-sp);
  }
  span[type="i"]::before {
    content: "מרכיב";
    background: var(--color-ing);
  }
  span[type="p"]::before {
    content: "תהליך";
    background: var(--color-pr);
  }
</style>
<span bind:type="result.type">{{result.name}}</span>
`)
@useShadow(true)
class LabSearchResults extends Slim {}