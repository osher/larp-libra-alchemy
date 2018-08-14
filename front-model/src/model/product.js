//--- Product -----------------------
import byName from "../core/by-name";
import Ingredient from "./ingredient";
import Procedure from "./procedure";
import Effect from "./effect";

export default class Product {
  constructor(id, ingredient, procedure, mainEffect, effects) {
    if (Array.isArray(id)) return new Product(...id);

    this.type = 'prod';
    this.name = null;
    this.id = null;
    this.ingredient = Ingredient.all.byId(ingredient);
    this.procedure = Procedure.all.byId(procedure);
    this.mainEffect = Effect.all.byId(mainEffect);
    effects = effects.reduce(
      (r, e) => {
        if (!r.ix[e]) {
          r.ix[e] = 1;
          r.l.push(e);
        }
        return r;
      },
      { ix: {}, l: [] }
    ).l;
    this.effects = Effect.all.fromIds(effects);

    this.id = this.ingredient.id * 1e3 + this.procedure.id;
    this.name = `${this.procedure.name} של ${this.ingredient.name}`;
  }
}
Product.all = byName({ instantiate: Product });
Product.of = (ingr, proc) => {
  const [ingredient, procedure] = [Ingredient.find(ingr), Procedure.find(proc)];
  return Product.all.byId(ingredient.id * 1e3 + procedure.id);
};
//--- /Product ----------------------
