import { createApp } from 'vue'
import './style.css'
import App from './App.vue'
import bonjour from './components/bonjour.vue'

createApp(App).mount('#app')
createApp(bonjour).mount('#bonjour')
