<template>
  <div id="app">
    <LabIndex 
      @on-selection="indexSelection"
    />
    <div id="content">
      <Search 
        ref="search"
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
      <Similar
        :potions="potions"
      />
    </div>
  </div>
</template>

<style lang="scss">
body { padding: 0 ; margin: 0; overflow: hidden }
#app {
  display: flex;
  flex-direction: row;
  font-family: Arial;
}

#content {
  display: flex;
  flex: 3;
  padding: 20px;
  flex-direction: column;
  height: 95vh;
  overflow-y: auto;
}
</style>

<script>
import Search from './components/search.vue'
import Receipt from './components/receipt.vue'
import Results from './components/results.vue'
import Similar from './components/similar.vue'
import LabIndex from './components/lab-index.vue'
import model from 'libra-front-model'

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
    LabIndex,
    Search,
    Receipt,
    Results,
    Similar
  },

  computed: {
    effects() {
      return model.lab.execute(this.receipt)
    },
    potions() {
      return model.lab.similar(this.effects)
    }
  },

  methods: {
    addProduct({ingredient, procedure}) {
      if (!this.receipt.produce(ingredient, procedure))
          console.warn('לא ניתן להוסיף את אותו תוצר פעם שלישית');
    },
    addSpecialIngredient(specialIngr) { 
      this.receipt.specialize(specialIngr);
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
    },
    indexSelection(item) {
      this.$refs.search.select(item)
    }
  }
 }
</script>

