<template>
  <div>
    <bonjour/><!-- On utilise ici les composant enfant -->
    <todoList />
  </div>
</template>

<script>

import todoList from './components/todoList.vue'
import bonjour from './components/bonjour.vue'

export default {
  name: 'App',
  components: {
    todoList,
    bonjour, // déclaration des composant enfant
  },
}
</script>
<style>
h1 {
  text-align: center;
  color: #42b983;
}
</style>
