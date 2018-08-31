<style scoped lang="scss">
.selected {
  background-color: yellow;
}

.suggestion {
  display: flex;
  &.i {
    color: darkblue
  }
  &.p {
    color: darkred
  }
  &.si {
    color: darkgreen
  }
  &.po {
    color: darkorange
  }
  &.e {
    color: darkmagenta
  }
  &::before {
    font-size: 55%;
    display: inline-block;
    border-radius: 2px;
    color: white;
    padding: 2px;
    margin: 2px;
    position: relative;
    letter-spacing: 1px;
    opacity: 0.8;
    height: 10px;
    width: 32px;
    text-align: center;
  }
  &.i::before {
    content: "מרכיב";
    background: var(--color-ing);
  }
  &.p::before {
    content: "תהליך";
    background: var(--color-pr);
  }
  &.si::before {
    content: "מיוחד";
    background: var(--color-sp);
  }
  &.po::before {
    content: "שיקוי";
    background: darkorange;
  }
  &.e::before {
    content: "השפעה";
    color: darkmagenta;
    background: #EEEEEE;
    border: solid 1px darkmagenta;
  }
}
#search {
  position: relative;
  padding-top: 20px;
  padding-right: 20px;
  padding-bottom: 0px;
  background-color: white;
  z-index: 12;
}
#suggestions {
  position: absolute;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  top: 42px;
  right: 58px;
  padding: 3px;
  z-index: 13;
  background-color: white;
  width: 220px;
}
#potionInfo, #effectInfo {
  position: absolute;
  top: 62px;
  right: 80px;
  width: 380px;
  z-index: 13;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  
  border-radius: 8px;
  border: solid 1px darkmagenta;
  padding: 5px;
  padding-bottom: 27px;
  background-color: lightyellow;
}
.x {
  position: absolute;
  top: 5px; left: 5px;
  text-align: left;
}
</style>

<template>
  <div id="search">
    <div>
      חפש: 
      <span  v-if="procedure" class="p">{{procedure.name}} של</span>
      <input
        type="text"
        ref="q"
        v-model="query"
        @keyup.up="moveUp"
        @keyup.down="moveDown"
        @keyup.enter="select()"
        @blur="focus"
      />
      <span  v-if="ingredient" class="si">{{ingredient.name}}</span>
    </div>
    <div id="suggestions" v-if="suggestions.length">
      <span
        v-for="s in suggestions" class="suggestion" :class="itemClass(s)"
        @click="select(s)"
        @mouseover="current(s)"
      >{{s.name}}</span>
    </div>
    <div
      v-if="info && info.type == 'po'"
      id="potionInfo"
    >
      <div class='x'><button @click="closeInfo">x</button></div>
      <PotionInfo 
        :potion="info"
      ></PotionInfo>
      <ul>
         <li v-for="a in info.sortedEffects()" class="a">{{a.effect.name}} ({{a.level}})</li>
      </ul>
    </div>
    <div
      v-if="info && info.type == 'e'"
      id="effectInfo"
    >
      <div class='x'><button @click="closeInfo">x</button></div>
      <h2>{{info.name}}</h2>
      <p><b>קדימות: </b>{{info.precedence}}</p>
      <b>ניגודים</b>
      <ul v-if="info.antigens.length">
        <li v-for="e in info.antigens">{{e.name}} (קדימות: {{e.precedence}})</li>
      </ul>
      <span v-if="!info.antigens.length">אין</span>
      <b>אפקט ראשי של:</b>
      <ul v-if="productsByMain(info).length">
        <li v-for="p in productsByMain(info)">{{p.name}}</li>
      </ul>
      <b>אפקט משני של:</b>
      <ul v-if="productsBy(info).length">
        <li v-for="p in productsBy(info)">{{p.name}} (+{{p.effects.length - 1}} נוספים)</li>
      </ul>

      
    </div>
  </div>
</template>

<script>
import m from 'libra-front-model';
import PotionInfo from './potion-info';
export default {
  data: () => ({
    query:          "",
    selectedIndex:  0,
    procedure:      null,
    ingredient:     null,
    info:           null,
    model:          m,
  }),
  components: {
    PotionInfo
  },
  computed: {
    suggestions() {
      const { query, model, ingredient, procedure } = this;
      
      if (!model || !query) return [];
      
      if (procedure) return model.data.ingredients.byName(query);
      if (ingredient) return model.data.procedure.byName(query);

      const suggestions = model.data.procedure.byName(query)
      .concat(
        model.data.ingredients.byName(query),
        model.data.specialIngredients.byName(query),
        model.data.potions.byName(query)
      );
      
      return query.length < 2
        ? suggestions
        : suggestions.concat(
            model.data.effects.byName(query)
          );

      
    },
    selected() {
        return this.suggestions[this.selectedIndex];
    },
  },
  methods: {
    closeInfo() {
        this.info = null;
    },
    moveDown() {
        this.selectedIndex = Math.min(this.suggestions.length - 1, this.selectedIndex+1)
    },
    moveUp() {
        this.selectedIndex = Math.max(0, this.selectedIndex - 1)
    },
    current(s) {
        this.selectedIndex = this.suggestions.indexOf(s)
    },
    select(selected = this.selected) {
        console.log('select', selected)
        switch( selected.type ) {
          case 'p':
            this.procedure = selected
            this.checkProduct()
            break;
          case 'i': 
            this.ingredient = selected
            this.checkProduct();
            break;
          case 'si': 
            this.$emit('special-ingr', selected);
          case 'po':
          case 'e':
            this.info = selected;
            break;
            
        }
        this.query = '';
    },
    focus() {
      //setTimeout(() => this.$refs.q.focus(), 100);
    },
    click(e) {
      console.log('click', e)
    },
    itemClass(s) {
      return [s.type, s === this.selected ? 'selected' : ''];
    },
    checkProduct() {
        const {procedure, ingredient} = this;

        if (!procedure || !ingredient) return;

        if (procedure && ingredient) {
            this.$emit('product', { ingredient, procedure } )
            this.procedure = this.ingredient = null;
        }
    },
    productsByMain({id}) {
        return this.model.data.products
        .filter(p => p.mainEffect.id == id)
        .sort((a,b) => a.effects.length - b.effects.length)
    },
    productsBy({id}) {
        return this.model.data.products
        .filter(p => p.effects.some(e => e.id == id))
        .sort((a,b) => a.effects.length - b.effects.length)
    }
  }
}
</script>


