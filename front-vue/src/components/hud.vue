<style scoped lang="scss">
  DIV {
    margin-top: 20px;
    margin-right: 20px;
  }
</style>

<template>
  <div>
    <button @click="reset">חדש</button>
    <button @click="resultsMode">מראה {{effectsTitle}}</button>
  </div>
</template>

<script>
export default {
  data: () => ({
    mode: 1
  }),
  computed: {
    effectsTitle() {
      return ['מלא','מינימלי'][this.mode]
    }
  },
  methods: {
    resultsMode() {
      this.$emit('results-mode', this.mode = (this.mode ? 0 : 1))
    },
    reset() {
      this.$emit('reset')
    }
  }
}
</script>
