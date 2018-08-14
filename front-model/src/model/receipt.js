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
  drop(p) {
      const col = p.type == 'si' ? this.specials : this.products;
      const ix = col.indexOf(p);
      if (ix == -1) return;
      col.splice(ix, 1);      
  }
  specialize(spec) {
      this.specials.push(SpecialIngredient.find(spec))
  }
}
//--- /Receipt -----------------------