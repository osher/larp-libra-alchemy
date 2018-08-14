<template>
  <div>
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
    <ul v-if="suggestions.length">
      <li
        v-for="s in suggestions" class="suggestion" :class="itemClass(s)"
        @click="select(s)"
        @mouseover="current(s)"
      >{{s.name}}</li>
    </ul>
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
        model.data.specialEffects.byName(query)
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

<style scoped lang="scss">
.selected {
  background-color: yellow;
}

.suggestion {
  &.i {color: blue}
  &.p {color: red}
  &.si {color: green}
}
</style>

