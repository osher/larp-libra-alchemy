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
      </li>
      <li v-for="(s,ix) in specials" :key="'i-' + ix" class="si">
        {{s.name}}
        <button @click="drop(s)">-</button>
      </li>
    </ul>
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
    }
  }
}
</script>

<style scoped lang="scss">
  .proc {color: darkmagenta}
  .si {color: green}
</style>

