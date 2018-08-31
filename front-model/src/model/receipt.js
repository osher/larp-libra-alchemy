//--- Receipt ------------------------
import Product from './product';
import SpecialIngredient from './special-ingredient';
import lab from './lab';
const byName = ({name:a}, {name:b}) => a > b ? 1 : a == b ? 0 : -1;

export default class Receipt {
  constructor() {
      this.products = [];
      this.specials = [];
      this.effects = [];
  }
  produce(ingr, proc) {
      const prod = Product.of(ingr, proc);
      if (2 == this.products.filter(p => p == prod).length) return false;
      this.products.push(prod);
      this.products.sort(byName);
      return this.calcEffects();
  }
  specialize(spec) {
      if (this.specials.includes(spec)) return false;
      this.specials.push(SpecialIngredient.find(spec));
      this.specials.sort(byName);
      return this.calcEffects();
  }
  duplicate(item) {
      return item.type == 'si'
        ? this.specialize(item)
        : this.produce(item.ingredient, item.procedure);
  }
  calcEffects() {
      return this.effects = lab.execute(this);
  }
  drop(p) {
      const col = p.type == 'si' ? this.specials : this.products;
      const ix = col.indexOf(p);
      if (ix == -1) return;
      col.splice(ix, 1);
      return this.calcEffects();
  }
}
//--- /Receipt -----------------------