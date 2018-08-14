import Effect from "./effect";
import SpecialEffect from "./special-ingredient";
import Ingredient from "./ingredient";
import Procedure from "./procedure";
import Product from "./product";
import Potion from "./potion";
import Receipt from "./receipt";
import lab from "./lab";
import SpecialIngredient from "./special-ingredient";
require('../core/shims');

export default {
  data: {
    effects: Effect.all,
    specialEffects: SpecialEffect.all,
    ingredients: Ingredient.all,
    procedure: Procedure.all,
    products: Product.all,
    potions: Potion.all
  },
  receipt: () => new Receipt(),
  lab,
  init: ({ effects, specials, ingredients, procedures, products, potions }) => {
    Effect.all.init(effects);
    SpecialIngredient.all.init(specials);
    Ingredient.all.init(ingredients);
    Procedure.all.init(procedures);
    Product.all.init(products);
    Potion.all.init(potions);
  }
};
