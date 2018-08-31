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
  display: flex;
  flex-direction: row;
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
      <HUD
        @results-mode="resultsMode"
        @reset="reset"
      />
      </div>
      <div id="workspace">
        <Receipt
          ref="receipt"
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
              :mode="resultsModeCode"
            />
            <SavePotion v-if="sortedEffects.length && !potions.source" 
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
import HUD from './components/hud.vue'
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
      effects: [],
      receipt: r,
      pubName: '',
      pubDescr: '',
      pubCreator: '',
      reject: '',
      resultsModeCode: 1
    }
  },

  components: {
    LabIndex,
    Search,
    HUD,
    Receipt,
    Results,
    SavePotion,
    Similar
  },

  computed: {
    sortedEffects() {
      return this.receipt.effects.concat().sort((a,b) => b.id - a.id)
    },
    potions() {
      return model.lab.similar(this.effects)
    }
  },

  methods: {
    resultsMode(code) {
        this.$refs.receipt.viewMode( this.resultsModeCode = code);
    },
    reset() {
        const r = this.receipt = window.receipt = model.receipt();
        this.products = r.products;
        this.specials = r.specials;
        this.effects = r.effects;
    },
    addProduct({ingredient, procedure}) {
      console.log('app.addProduct', ingredient, procedure)
      const effects = this.receipt.produce(ingredient, procedure);
      effects
        ? this.effects = effects
        : console.warn('לא ניתן להוסיף את אותו תוצר פעם שלישית');
    },
    addSpecialIngredient(specialIngr) { 
        console.log('app.addSpecialIngredient', specialIngr)
        this.effects = this.receipt.specialize(specialIngr);
    },
    drop(item) {
        console.log('app.drop', item.type || 'prod', item)
        this.effects = this.receipt.drop(item);
    },
    duplicate(item) {
        console.log('app.duplicate', item)
        const effects = this.receipt.duplicate(item);
        effects
          ? this.effets = effects
          : console.warn('לא ניתן להוסיף את אותו תוצר פעם שלישית');
    },
    indexSelection(item) {
        console.log('app.indexSelection', item)
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
        .then(() => this.reset());
      })
    }
  }
 }
</script>

