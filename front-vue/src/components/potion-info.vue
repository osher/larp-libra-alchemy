<style>
.source {
  background-color: lightyellow;
  color: darkblue;
  padding: 10px 20px 20px 20px;
}
.source H2 { color: darkred }
</style>
<template>
  <div class="source">
    <h2>שיקוי קיים</h2>
    <b>{{potion.name}}</b><br>
    <p>{{potion.description}}</p>
    <i>{{potion.creator}}</i>
  </div>
</template>
<script>
export default {
  props: ['potion']
}
</script>