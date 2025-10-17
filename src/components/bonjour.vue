<template>
  <div>
    <h1><h1>{{ message }}</h1></h1>
  </div>
</template>

<script>
export default {
  name: 'bonjour',
  data() {
    return {
      message: 'Hello Vue !'
    }
  }
}
</script>

<style>
h1 {
  color: r#42b983;
}
</style>