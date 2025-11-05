<template>
  <div>
    <h1 class="title">{{ message }}</h1>
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
.title {
  color: r#42b983;
  text-align: center;
}
</style>