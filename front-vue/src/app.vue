<style lang="scss">
body { padding: 0 ; margin: 0; overflow: hidden }
#app {
  display: flex;
  flex-direction: row;
  font-family: Arial;
}
#index {
  display: flex;
  min-width: 220px;
}
#content {
  display: flex;
  flex: auto;
  flex-direction: column;
  height: 100vh;
}
#search {
  height: 40px;
}
#workspace {
  padding: 0px 20px 40px 20px;
  flex: 1;
  overflow-y: auto;
}
#results {
  display: flex;
  flex-direction: row;
}
#results .h {
  flex: 1;
  display: flex;
  flex-wrap: wrap;
  flex-direction: column;
}
</style>


<template>
  <div id="app">
    <div id="index">
      <LabIndex 
        @on-selection="indexSelection"
      />
    </div>
    <div id="content">
      <div id="search">
      <Search 
        ref="search"
        @product="addProduct"
        @special-ingr="addSpecialIngredient"
      />
      </div>
      <div id="workspace">
        <Receipt
          :products="products"
          :specials="specials"
          @drop="drop"
          @duplicate="duplicate"
        />
        <div id="results">
          <div class="h">
            <Results 
              ref="results"
              :effects="sortedEffects"
            />
            <SavePotion v-if="effects.length && !potions.source" 
              ref="saveForm"
              @new-potion="publish"
            />
          </div>
          <div class="h">
            <Similar
              :potions="potions"
            />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Search from './components/search.vue'
import Receipt from './components/receipt.vue'
import Results from './components/results.vue'
import SavePotion from './components/save-potion.vue'
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
      effects: r.effects,
      receipt: r,
      pubName: '',
      pubDescr: '',
      pubCreator: '',
      reject: ''
    }
  },

  components: {
    LabIndex,
    Search,
    Receipt,
    Results,
    SavePotion,
    Similar
  },

  computed: {
    sortedEffects() {
      return this.effects.concat().sort((a,b) => b.id - a.id)
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
    },
    publish({name, by, descr, effects}) {
      const data = {
        name,
        by,
        descr,
        effects: this.sortedEffects.slice(0,5).map(
          ({level, effect: { id: effectId }}) => ([effectId, level])
        )
      };

      //TBD: indicate sending with loader
      fetch('http://localhost:3030/potion', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
      })
      .catch((e) => { 
        this.$refs.saveForm.err("הפרסום לא הצליח :(")
      })
      .then(() => { 
        /* indicate success */
        this.$refs.saveForm.ok("הפרסום הצליח")
        .then(() => this.products.concat(this.specials).forEach(item => this.receipt.drop(item)));
      })
    }
  }
 }
</script>

