<style scoped lang="scss">
.source {
  background-color: lightyellow;
  color: darkblue;
}
.source H2 { color: darkred }

</style>

<template>
  <div>
    <div v-if="potions.source" class="source">
      <h2>שיקוי קיים</h2>
      <b>{{potions.source.name}}</b><br>
      <p>{{potions.source.description}}</p>
      <i>{{potions.source.creator}}</i>
    </div>
    <h2>שיקויים דומים</h2>
    <ul>
      <li v-for="(p,ix) in potions" :key="ix">
        <b>{{p.name}}</b><br>
        <p>{{p.description}}</p>
        <ol>
          <li v-for="a in p.effects">{{a.effect.name}} ({{a.level}})</li>
        </ol>
        <i>{{p.creator}}</i>
      </li>
    </ul>
    <span v-if="!potions.length">-אין-</span>
  </div>
</template>

<script>
export default {
  props: [ 'potions' ],
}
</script>
