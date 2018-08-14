<template>
  <div id="app">
    <Search 
      @product="addProduct"
      @special-ingr="addSpecialIngredient"
    />
    <Receipt
      :products="products"
      :specials="specials"
    />
  </div>
</template>

<script>
import Search from './components/search.vue'
import Receipt from './components/receipt.vue'
import model from 'libra-front-model'

export default {
  name: 'app',

  data: () => {
    const r = model.receipt();
    
    return { 
      step: 0,
      products: r.products,
      specials: r.specials,
      receipt: r
    }
  },

  components: {
    Search,
    Receipt
  },

  methods: {
    addProduct({ingredient, procedure}) {
      this.receipt.produce(ingredient, procedure);
    },
    addSpecialIngredient(specialIngr) { 
      this.receipt.specialize(specialIngr);
    }
  }
 }
</script>

<style lang="scss">
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
