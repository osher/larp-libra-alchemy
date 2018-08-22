import Effect from "./effect";
import Ingredient from "./ingredient";
import Procedure from "./procedure";
import Product from "./product";
import Potion from "./potion";
import Receipt from "./receipt";
import lab from "./lab";
import SpecialIngredient from "./special-ingredient";
require('../core/shims');
const byNameSort = ({name:a}, {name:b}) => a > b ? 1 : a == b ? 0 : -1;

export default {
  data: {
    effects: Effect.all,
    specialIngredients: SpecialIngredient.all,
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
  },
  byNameSort,
};
