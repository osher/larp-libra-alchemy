<template>
  <div>
    <h2>תוצאות</h2>
    <ul>
      <li v-for="(e,ix) in effects" :key="ix" :class="ix > 5 ? 'o' : 'i'">
        {{e.effect.name}} ({{e.level}})
      </li>
    </ul>
    <span v-if="!effects.length">-אין-</span>
  </div>
</template>

<script>
export default {
  props: [ 'effects' ],
}
</script>

<style scoped lang="scss">
  .o {color: gray}
  .i {color: darkgreen}
</style>

