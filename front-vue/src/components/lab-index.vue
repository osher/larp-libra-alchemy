<style lang="scss">
  .index {
    display: flex;
    flex: 1;
    flex-direction: column;
    background: lightgrey;
    overflow: auto;
    height: 100vh;
    direction: ltr;
  }
  .index .scrolled {
    padding: 10px 10px 40px 10px;
    display: flex;
    flex-direction: column;
    direction: rtl;
  }
  .index span:hover{
    background: var(--result-hover);
    cursor: pointer;
  }
  .index span::before {
    font-size: 55%;
    display: inline-block;
    border-radius: 2px;
    color: white;
    padding: 2px;
    margin: 2px;
    position: relative;
    top: -2px;
    letter-spacing: 1px;
    opacity: 0.8;
  }
  span[mtype="si"] {
    color: var(--color-sp);
  }
  span[mtype="si"]::before {
    content: "מיוחד";
    background: var(--color-sp);
  }
  span[mtype="i"] {
    color: var(--color-ing);
  }
  span[mtype="po"] {
    color: var(--color-po);
  }
  span[mtype="i"]::before {
    content: "מרכיב";
    background: var(--color-ing);
  }
  span[mtype="p"] {
    color: var(--color-pr);
  }
  span[mtype="p"]::before {
    content: "תהליך";
    background: var(--color-pr);
  }
  span[mtype="po"]::before {
    content: "שיקוי";
    background: var(--color-po);
  }
  
</style>

<template>
  <div class="index">
    <div class="scrolled">
      <h4>תהליכים</h4>
        <span
          v-for="p in procedure"
          @click="select(p)"
          mtype="p"
          >{{p.name}}</span>
        <h4>מרכיבים</h4>
        <span
          v-for="i in ingredients"
          @click="select(i)"
          mtype="i"
          >{{i.name}}</span>
      <h4>מיוחדים</h4>
        <span
          v-for="si in specialIngredients"
          @click="select(si)"
          mtype="si"
          >{{si.name}}</span>
      <h4>שיקויים</h4>
        <span
          v-for="p in potions"
          @click="select(p)"
          mtype="po"
          >{{p.name}}</span>
      &nbsp;
    </div>
  </div>
</template>

<script>
const byName = ({name:a}, {name:b}) => a > b ? 1 : a == b ? 0 : -1;
import model from 'libra-front-model';

export default {
  data: () => model.data,
  methods: {
    select(selected) {
      this.$emit('on-selection', selected);
    }
  }
}
</script>

