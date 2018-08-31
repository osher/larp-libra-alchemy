<style scoped lang="scss">
  .comp {
    color: darkmagenta;
    &::before {
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
    &.si::before {
      content: "מיוחד";
      background: var(--color-sp);
    }
    &.proc::before {
      content: "תוצר";
      background: var(--color-prod);
    }
  }
  .effects, .antigens, .alterations{
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    background-color: white;
  }
  .effects b, .antigens b, .alterations b {
    position: relative;
    top: 6px;
    width: 40px;
    font-size: 65%;
    display: inline-block;
  }
  .effects b { color: gray }
  .antigens b { color: red }
  .alterations b { color: gray }
  .effect, .alteration, .antigen {
    margin: 3px;
    padding: 2px;
    display: inline-block;
    border-radius: 2px;
    font-size: 65%;
  }
  .effect {
    color: darkgray;
    border: 1px solid darkgray;
  }
  .alteration {
    color: darkgray;
    border: 1px solid darkgray;
  }
  .antigen {
    color: red;
    border: 1px solid red;
  }
  .main {
    font-weight: bold;
    background-color: #EEEEEE;
    color: darkmagenta;
  }
  .si {color: green}
  LI { margin-top: 8px; background-color: #DDDDDD; }
  BUTTON { float: left; height: 20px; }
  
</style>

<template>
  <div>
    <h2>מתכון</h2>
    <ol>
      <li v-for="(p,ix) in products" :key="'p-' + ix" class="comp proc">
        <span>
          {{p.name}}
          <button @click="drop(p)">X</button>
          <button 
            v-if="1 == products.filter(({id}) => id == p.id).length"
            @click="duplicate(p)"
          >+1</button>
        </span>
        <div v-if="viewMode()" class="effects">
          <b>השפעות:</b> <span v-for="e in appliedEffects(p)" class="effect" :class="isMain(p, e)">{{e.name}}</span>
        </div>
        <div v-if="viewMode()" class="antigens">
          <b>ניגודים:</b><span v-for="ae in p.antigens(canDuplicate(p))" class="antigen">{{ae.name}}</span>
        </div>
      </li>
      <li v-for="(s,ix) in specials" :key="'i-' + ix" class="comp si">
        {{s.name}}
        <button @click="drop(s)">X</button>
        <div v-if="viewMode" class="alterations">
          <b>החלפות: </b><span v-for="a in s.appliedAlterations()" class="alteration">{{a.src.name}} -> {{a.trg.name}}</span>
        </div>
      </li>
    </ol>
    <span v-if="!products.length">המתכון ריק - חפש חומרים להוספה</span>
  </div>
</template>

<script>
import m from 'libra-front-model';
export default {
  props: [ 'products', 'specials' ],
  data: () => ({mode: 1}),
  methods: {
    drop(item) {
      console.log('drop', item, item.type || 'prod');
      this.$emit('drop', item);
    },
    duplicate(item) {
        this.$emit('duplicate', item);
    },
    canDuplicate(product) {
        return 2 > this.products.filter((p) => p == product).length
    },
    isMain(product, item) {
        return product.mainEffect == item ? "main" : "additional"
    },
    appliedEffects(product) {
      return (this.products.filter((p) => p == product).length > 1
        ? [ product.mainEffect ]
        : product.effects
      )//.sort(m.byNameSort)
    },
    viewMode(mode) {
      return 'undefined' == typeof mode
        ? this.mode
        : this.mode = mode;
    }
  }
}
</script>