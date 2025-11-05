<template>
    <navbar/>
    <bonjour/><!-- On utilise ici les composant enfant -->
    <todoList/>
</template>

<script>

import todoList from './components/todoList.vue'
import bonjour from './components/bonjour.vue'
import navbar from './components/navbar.vue'

export default {
  name: 'App',
  components: {
    todoList,
    bonjour,
    navbar, // déclaration des composants enfant
  },
}
</script>

