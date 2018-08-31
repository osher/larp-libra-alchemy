<style scoped lang="scss">
.source {
  background-color: lightyellow;
  color: darkblue;
  padding: 10px 20px 20px 20px;
}
.source H2 { color: darkred }
.a {
  color: darkorange;
}
.similar {
  margin-bottom: 20px;
}
.descr {
  margin-top: 35px;
}
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
    <div>
      <div v-for="(p,ix) in potions" :key="ix" class="similar">
        <ul>
          <li v-for="a in p.sortedEffects()" class="a">{{a.effect.name}} ({{a.level}})</li>
        </ul>
        <div class="descr">
          <b :potion="p.id">{{p.name}}</b><br>
          <p>{{p.description}}</p>
          <i>{{p.creator}}</i>
        </div>
      </div>
    </div>
    <span v-if="!potions.length">-אין-</span>
  </div>
</template>

<script>
export default {
  props: [ 'potions' ],
}
</script>
