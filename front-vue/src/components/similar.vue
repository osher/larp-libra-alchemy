<template>
  <div>
    <h2>שיקויים דומים</h2>
    <ul>
      <li v-for="(p,ix) in potions" :key="ix">
        <b>{{p.name}}</b><br>
        {{p.description}}
        <ol>
          <li v-for="a in p.effects">{{a.effect.name}} ({{a.level}})</li>
        </ol>
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

<style scoped lang="scss"></style>
