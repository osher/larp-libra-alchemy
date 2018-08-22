//--- SpecialIngredient ------------
import byName from '../core/by-name';
import Effect from './effect';
export default class SpecialIngredient {
  constructor(id, precedence, name, description, alterations) {
      if (Array.isArray(id)) return new SpecialIngredient(...id);

      this.type = 'si';
      this.name = name;
      this.id = id;
      this.description = description;
      this.precedence = precedence;
      this.alterations = alterations; //maps id -> id
  }
  appliedAlterations() {
      const {alterations} = this;
      return Object.keys(alterations).map(
        fromId => ({src: Effect.find(fromId), trg: Effect.find(alterations[fromId])})
      )
  }
}
SpecialIngredient.all = byName({instantiate: SpecialIngredient})
//--- /SpecialIngredient -----------