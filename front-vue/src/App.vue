<template>
  <div id="app">
    <Search 
      @product="addProduct"
      @special-ingr="addSpecialIngredient"
    />
    <Receipt
      :products="products"
      :specials="specials"
      @drop="drop"
      @duplicate="duplicate"
    />
    <Results 
      :effects="effects"
    />
  </div>
</template>

<script>
import Search from './components/search.vue'
import Receipt from './components/receipt.vue'
import Results from './components/results.vue'
import model from 'libra-front-model'


const byName = ({name:a}, {name:b}) => a > b ? 1 : a == b ? 0 : -1;

export default {
  name: 'app',

  data: () => {
    const r = model.receipt();

    window.receipt = r;

    return { 
      step: 0,
      products: r.products,
      specials: r.specials,
      receipt: r
    }
  },

  components: {
    Search,
    Receipt,
    Results
  },

  computed: {
    effects() {
      return model.lab.execute(this.receipt)
    }
  },

  methods: {
    addProduct({ingredient, procedure}) {
      this.receipt.produce(ingredient, procedure);
      this.receipt.products.sort(byName);
    },
    addSpecialIngredient(specialIngr) { 
      this.receipt.specialize(specialIngr);
      this.receipt.specials.sort(byName);
    },
    drop(item) {
        console.log('app.drop', item.type || 'prod', item)
        this.receipt.drop(item);
    },
    duplicate(item) {
        const collection = 
          item.type == 'si'
            ? this.receipt.specials
            : this.receipt.products
          ;
        collection.push(item);
        collection.sort(({name:a}, {name:b}) => a > b ? 1 : a == b ? 0 : -1);
    }
  }
 }
</script>

<style lang="scss">
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
