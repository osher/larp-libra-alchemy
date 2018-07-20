import Effect from './Effect';
import SpecialEffect from './special-ingredient';
import Ingredient from './ingredient';
import Procedure from './procedure';
import Product from './product';
import Receipt from './receipt';
import lab from './lab';

export default {
  data: {
    effects: Effect.all,
    specialEffects: SpecialEffect.all,
    ingredients: Ingredient.all,
    procedure: Procedure.all,
    products: Product.all,
  },
  lab,
  init: ({a}) => 1
}


