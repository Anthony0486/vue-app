<template>
  <header>
    <div class="logo">
      <img src="./public/Assets/logo-red.svg" alt="logoRouge">
      <h1>Full Set collection</h1>
    </div>
    <nav class="navbar">
      <!--DROPDOWN MENU PRINCIPAL-->
      <div class="dropDown" 
      @click.stop="toggleDropdown" ref="dropdownRef">
        <button id="menuBtn" class="dropBtn">Menu</button>
          <ul v-if="open" class="dropdownMenu">
          <li><a href="#">Consoles</a></li>
          <li><a href="#">Jeux</a></li>
          <li><a href="#">Accessoires</a></li>
          </ul>
        </div>
    </nav>
    </header>
   </template>

<script setup>

import {ref, watch} from 'vue';
const open = ref(false);
const dropdownRef = ref(null);

const toggleDropdown = () => {
  open.value = !open.value;
};

function closeOnOutsideClick(e) {
  if (!dropdownRef.value.contains(e.target)) {
    open.value = false;
  }
}

watch(open, (val) => {
  if (val) {
    document.addEventListener("click", closeOnOutsideClick);
  }  else {
    document.removeEventListener("click", closeOnOutsideClick);
  }
});

</script>



<style>
:root{
    --primary-color: #f6f0f0  ;
    --secondary-color: #D10000 ;
    --text-color: #333333;
    --box-color :#f7f2f2; 
    --box-shadow : 0 4px 10px rgba(0,0,0,0.08);
    --bg-color: #f1ebeb ;
    --border-color: rgba(23, 21, 21, 0.08);
    --hover-color:#eb5b4b84;
    --textMenu-color : #333333;
}
.logo h1{ 
  height: 20px;
  margin-left: 5px;
  text-transform: uppercase;
  letter-spacing: 3px;
  font-size: 2vh;
  text-shadow: -3px 7px 3px var(--text-color);
  color: var(--secondary-color);
} 
.dropDown {
  position: relative;
  cursor: pointer;
}

.dropBtn{
  background: var(--secondary-color);
  border: solid 2px;
  border-radius: 20px;
  color: var(--primary-color);
  width: 60px;
  font-size: 1.5vh;
  letter-spacing: 1.8px;
  padding: 3px 3px;
  margin-left: 5px;
  align-self: center;
}

.dropBtn:hover{
  background: var(--hover-color);
}

.dropdownMenu {
  display: block;
  overflow: hidden;  
  position: absolute;
  background-color: var(--box-color);
  min-width: 160px;
  box-shadow: var(--box-shadow);
}

.dropdownMenu a {
  text-decoration: none;
  display: block;
  color: var(--textMenu-color);
}

.dropdownMenu a:hover {
  text-decoration: underline;
}

.navbar{
  width: 100%;
  height: 30px;
  background: var(--secondary-color);
  display: flex;
  justify-content: space-between;
  align-items: center;
}

</style>