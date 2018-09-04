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
    <PotionInfo
      v-if="potions.source"
      :potion="potions.source"
    ></PotionInfo>
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
import PotionInfo from './potion-info';
export default {
  props: [ 'potions' ],
  components: { 
    PotionInfo
  }
}
</script>
