<template>
  <div>
    <h2>השפעות התוצאה</h2>
    <ul v-if="effects.length">
      <li v-for="(e,ix) in effects" :key="ix" :class="ix > 5 ? 'o' : 'i'">
        {{e.effect.name}} ({{e.level}})
      </li>
    </ul>
    <span class="empty" v-if="!effects.length">-אין-</span>
  </div>
</template>

<script>
export default {
  props: [ 'effects' ],
}
</script>

<style scoped lang="scss">
  .o {color: gray}
  .i {color: darkorange}
</style>

