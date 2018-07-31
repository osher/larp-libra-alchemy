//--- Receipt ------------------------
import Product from './product';
import SpecialIngredient from './special-ingredient';
export default class Receipt {
  constructor() {
      this.products = [];
      this.specials = [];
      this.effects = null;
  }
  produce(ingr, proc) {
      this.products.push(Product.of(ingr, proc));
  }
  specialize(spec) {
      this.specials.push(SpecialIngredient.find(spec))
  }
}
//--- /Receipt -----------------------