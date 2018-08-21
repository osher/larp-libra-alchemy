<style scoped lang="scss">
  .proc {color: darkmagenta}
  .effects {
    display: flex;
    flex-direction: row;
  }
  .effect {
    margin: 3px;
    padding: 2px;
    color: darkgray;
    border: 1px solid darkgray;
    display: inline-block;
    border-radius: 2px;
  }
  .main {
    font-weight: bold
  }
  .si {color: green}
</style>

<template>
  <div>
    <h2>מתכון</h2>
    <ul>
      <li v-for="(p,ix) in products" :key="'p-' + ix" class="proc">
        {{p.name}}
        <button @click="drop(p)">x</button>
        <button 
          v-if="1 == products.filter(({id}) => id == p.id).length"
          @click="duplicate(p)"
        >+1</button>
        <div class="effects">
          <span v-for="e in appliedEffects(p)" class="effect" :class="isMain(p, e)">{{e.name}}</span>
        </div>
      </li>
      <li v-for="(s,ix) in specials" :key="'i-' + ix" class="si">
        {{s.name}}
        <button @click="drop(s)">-</button>
      </li>
    </ul>
    <span v-if="!products.length">המתכון ריק - חפש חומרים להוספה</span>
  </div>
</template>

<script>
import m from 'libra-front-model';
export default {
  props: [ 'products', 'specials' ],
  methods: {
    drop(item) {
      console.log('drop', item, item.type || 'prod');
      this.$emit('drop', item);
    },
    duplicate(item) {
        this.$emit('duplicate', item);
    },
    isMain(product, item) {
        return product.mainEffect == item ? "main" : "additional"
    },
    appliedEffects(product) {
      return this.products.filter((p) => p == product).length > 1
        ? [ product.mainEffect ]
        : product.effects
    }
  }
}
</script>