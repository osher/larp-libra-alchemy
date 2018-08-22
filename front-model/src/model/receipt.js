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
      const prod = Product.of(ingr, proc);
      if (2 == this.products.filter(p => p == prod).length) return false;
      this.products.push(prod);
      return true;
  }
  drop(p) {
      const col = p.type == 'si' ? this.specials : this.products;
      const ix = col.indexOf(p);
      if (ix == -1) return;
      col.splice(ix, 1);
  }
  specialize(spec) {
      this.specials.push(SpecialIngredient.find(spec));
  }
}
//--- /Receipt -----------------------