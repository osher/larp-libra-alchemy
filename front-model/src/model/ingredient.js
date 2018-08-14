//--- Ingredient -------------------
import byName from '../core/by-name';
export default class Ingredient {
  constructor(id, name) {
      if (Array.isArray(id)) return new Ingredient(...id);

      this.type = 'i';
      this.id = id;
      this.name = name;
  }
};
Ingredient.all = byName({instantiate: Ingredient})
//--- /Ingredient -------------------