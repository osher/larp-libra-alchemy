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
  &::before {
    font-size: 55%;
    display: inline-block;
    border-radius: 2px;
    color: white;
    padding: 2px;
    margin: 2px;
    position: relative;
    top: -2px;
    letter-spacing: 1px;
    opacity: 0.8;
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
}
#search {
  position: relative;
}
#suggestions {
  position: absolute;
  background-color: white;
   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  top: 22px;
  right: 38px;
  padding: 3px;
  z-index: 3;
}
</style>

<template>
  <div id="search">
    <div v-if="!halfProduct">
      חפש: <input 
        type="text"
        v-model="query"
        @keyup.up="moveUp"
        @keyup.down="moveDown"
        @keyup.enter="select()"
      />
    </div>
    <div v-if="ingredient">
      חפש: <input 
        type="text"
        v-model="query"
        @keyup.up="moveUp"
        @keyup.down="moveDown"
        @keyup.enter="select()"
      />
      של
      <span :class="halfProduct.type">{{halfProduct.name}}</span>
    </div>
    <div v-if="procedure">
      חפש: <span :class="halfProduct.type">{{halfProduct.name}}</span>
      של
      <input 
        type="text"
        v-model="query"
        @keyup.up="moveUp"
        @keyup.down="moveDown"
        @keyup.enter="select()"
      />
    </div>
    <div id="suggestions" v-if="suggestions.length">
      <span
        v-for="s in suggestions" class="suggestion" :class="itemClass(s)"
        @click="select(s)"
        @mouseover="current(s)"
      >{{s.name}}</span>
    </div>
  </div>
</template>

<script>
import m from 'libra-front-model';
export default {
  data: () => ({
    query: "",
    selectedIndex: 0,
    procedure: null,
    ingredient: null,
    model: m,
  }),
  computed: {
    suggestions() {
      const { query, model, ingredient, procedure } = this;
      
      if (!model || !query) return [];
      
      if (procedure) return model.data.ingredients.byName(query);
      if (ingredient) return model.data.procedure.byName(query);

      return model.data.procedure.byName(query)
      .concat(
        model.data.ingredients.byName(query),
        model.data.specialIngredients.byName(query)
      );
    },
    selected() {
        return this.suggestions[this.selectedIndex];
    },
    halfProduct() {
        return this.procedure || this.ingredient
    }
  },
  methods: {
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
            
        }
        this.query = '';
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
    }
  }
}
</script>


