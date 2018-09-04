<style scoped lang="scss">
#saveForm {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  width: 100%;
  margin-top: 20px;
}
#saveForm INPUT {
  flex-grow: 1;
  font-weight: bold;
}
#saveForm .cr {
  font-style: italic;
  font-weight: normal;
} 
#results TEXTAREA {
  width: 100%;
  height: 100px;
  font-family: arial;
}
#results .reject {
  color: red
}
#results .reject {
  color: darkgreen;
  background-color: lightgreen;
}
</style>

<template>
  <div>
    <div v-if="reject" class="reject">{{reject}}</div>
    <div v-if="success" class="OK">{{success}}</div>
    <div v-if="!success" id="saveForm">
      <input v-model="pubName"/><button @click="publish">פרסם</button>
      <textarea v-model="pubDescr"></textarea>
      יוצר: <input class="cr" v-model="pubCreator"/>
    </div>
  </div>
</template>

<script>
export default {
  data: () => ({
      pubName: '',
      pubDescr: '',
      pubCreator: '',
      reject: '',
      success: ''
  }),
  methods: {
    err(msg) {
      this.reject = msg;
    },
    ok(msg) {
      this.success = msg;
      return new Promise(
        (accept) => setTimeout(() => {
          this.reset(); 
          accept();
        }, 2000)
      )
    },
    reset() {
      this.pubName = this.pubDescr = this.pubCreator = this.reject = this.success = '';
    },
    publish() {
      const { 
        pubName:    name,
        pubDescr:   descr,
        pubCreator: by
      } = this;

      this.reject =
        !name && "יש להזין שם שיקוי"
        || descr.length < 20 && "תיאור השיקוי קצר מדיי"
        || !by && "יש להזין את שם דמות יוצר השיקוי"
        || ''
      ;
      if (this.reject) return;
      this.$emit('new-potion', {name, by, descr});
    }
  }
}
</script>
