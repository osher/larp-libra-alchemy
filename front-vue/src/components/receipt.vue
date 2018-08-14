<template>
  <div>
    <ul>
      <li v-for="p in products" :key="p.id" class="proc">{{p.name}}</li>
      <li v-for="s in specials" :key="s.id" class="si">{{s.name}}</li>
    </ul>
  </div>
</template>

<script>
import m from 'libra-front-model';
export default {
  props: [ 'products', 'specials' ]
}
</script>

<style scoped lang="scss">
  .proc {color: red}
  .si {color: green}
</style>

