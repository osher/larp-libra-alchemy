<style lang="scss">
body { padding: 0 ; margin: 0; overflow: hidden }
#app {
  display: flex;
  flex-direction: row;
  font-family: Arial;
}
#index {
  display: flex;
  min-width: 20%;
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
#results #saveForm {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  width: 100%;
  margin-top: 20px;
}
#saveForm INPUT {
  flex-grow: 1
} 
#results TEXTAREA {
  width: 100%;
  height: 100px;
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
              :effects="effects"
            />
            <div v-if="effects.length && !potions.source" id="saveForm">
              <input v-model="pubName"/><button @click="publish">פרסם</button>
              <textarea v-model="pubDescr"></textarea>
              יוצר: <input v-model="pubCreator"/>
            </div>
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
      receipt: r,
      pubName: '',
      pubDescr: '',
      pubCreator: '',
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
    },
    publish() {
      const { 
        pubName: name,
        pubDescr: descr,
        pubCreator: by,
        effects 
      } = this;

      const data = { 
        name,
        by,
        descr,
        effects:  
          effects.map(
            ({level, effect: { id: effectId }}) => ({effectId, level})
          )
      };
      
      console.log('publish clicked', data)
      
      const reject =
        !name && "יש להזין שם שיקוי"
        || descr.length < 20 && "תיאור השיקוי קצר מדיי"
        || !by && "יש להזין את שם דמות יוצר השיקוי"
      ;
      if (reject) {
          return alert(reject);
      }
      
      //TBD: indicate sending with loader
      fetch('http://localhost:3030/potion', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
      })
      .then(() => { /* indicate success */ })
      .catch((e) => { /* indicate error */ })
    }
  }
 }
</script>

