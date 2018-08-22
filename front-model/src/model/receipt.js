//--- Receipt ------------------------
import Product from './product';
import SpecialIngredient from './special-ingredient';
const byName = ({name:a}, {name:b}) => a > b ? 1 : a == b ? 0 : -1;

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
      this.products.sort(byName);
      return true;
  }
  drop(p) {
      const col = p.type == 'si' ? this.specials : this.products;
      const ix = col.indexOf(p);
      if (ix == -1) return;
      col.splice(ix, 1);
  }
  specialize(spec) {
      if (this.specials.includes(spec)) return false;
      this.specials.push(SpecialIngredient.find(spec));
      this.specials.sort(byName);
      return true;
  }
}
//--- /Receipt -----------------------