<template>
  <div class="app">
    <h1>📝 Ma To-Do List</h1>

    <div class="add-task">
      <input
        v-model="nouvelleTache"  
        placeholder="Ajouter une tâche..."
        @keyup.enter="ajouterTache"
      /> 
      <button @click="ajouterTache">Ajouter</button>
    </div>

    <ul>
      <li
        v-for="(tache, index) in taches" 
        :key="index"
        :class="{ done: tache.terminee }"
      >
        <span @click="basculerTache(index)">
          {{ tache.texte }}
        </span>
        <button class="delete" @click="supprimerTache(index)">❌</button>
      </li>
    </ul>
  </div>
</template>

<script>
export default { // Composant principal de l'application
  data() { // Données pour la nouvelle tâche et la liste des tâches
    return {
      nouvelleTache: "",
      taches: JSON.parse(localStorage.getItem("taches") || "[]")
    };
  },
  watch: { // Surveille les changements dans 'taches' pour les sauvegarder dans localStorage
    taches: {
      handler(nouvellesTaches) {
        localStorage.setItem("taches", JSON.stringify(nouvellesTaches));
      },
      deep: true
    }
  },
  methods: { // Méthodes pour ajouter, basculer et supprimer des tâches
    ajouterTache() { 
      const texte = this.nouvelleTache.trim(); // Supprime les espaces inutiles
      if (texte) { // Ajoute la tâche si le texte n'est pas vide
        this.taches.push({ texte, terminee: false }); // Nouvelle tâche non terminée
        this.nouvelleTache = ""; // Réinitialise le champ d'entrée
      }
    },
    basculerTache(index) {
      this.taches[index].terminee = !this.taches[index].terminee; // Bascule l'état de la tâche
    },
    supprimerTache(index) {
      this.taches.splice(index, 1); // Supprime la tâche de la liste
    }
  }
};
</script>

<style>
.app {
  max-width: 400px;
  margin: 60px auto;
  text-align: center;
  font-family: "Avenir", sans-serif;
}
.add-task {
  display: flex;
  justify-content: center;
  gap: 10px; /* Espace entre l'input et le bouton */
  margin-bottom: 20px;
}
input {
  padding: 8px;
  flex: 1;
}
button {
  padding: 8px 12px;
  border: none;
  border-radius: 6px;
  background-color: #42b883;
  color: white;
  cursor: pointer;
}
button:hover {
  background-color: #2c8c6c;
}
ul {
  list-style: none;
  padding: 0;
}
li {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: #f4f4f4;
  margin: 8px 0;
  padding: 8px 12px;
  border-radius: 6px;
}
li.done span {
  text-decoration: line-through;
  color: rgb(67, 129, 67);
}
.delete {
  background: #e74c3c;
}
.delete:hover {
  background: #c0392b;
}
</style>
