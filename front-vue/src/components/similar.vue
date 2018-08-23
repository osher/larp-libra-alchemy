<style scoped lang="scss">
.source {
  background-color: lightyellow;
  color: darkblue;
}
.source H2 { color: darkred }
.a {color: darkorange}
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
      <div v-for="(p,ix) in potions" :key="ix">
        <ul>
          <li v-for="a in p.effects" class="a">{{a.effect.name}} ({{a.level}})</li>
          <p class="descr">
            <b>{{p.name}}</b><br>
            <p>{{p.description}}</p>
            <i>{{p.creator}}</i>
          </p>
        </ul>
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
