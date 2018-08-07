//--- SpecialIngredient ------------
import byName from '../core/by-name';
export default class SpecialIngredient {
  constructor(id, precedence, name, description, alterations) {
      if (Array.isArray(id)) return new SpecialIngredient(...id);

      this.name = name;
      this.id = id;
      this.description = description;
      this.precedence = precedence;
      this.alterations = alterations; //maps id -> id
  }
}
SpecialIngredient.all = byName({instantiate: SpecialIngredient})
//--- /SpecialIngredient -----------