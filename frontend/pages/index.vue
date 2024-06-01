<template>
    <div>
        <title>Welcome to UIC</title>
        <div class="wrapper ">
            <div class="nav-menu">
                <nav class="menu">
                    <Sidebar />
                </nav>
            </div>
            <div class="wrapper-inline">
                <Header/>
                <Footer />
                <!-- Page content start -->
                 <Child/>
                <!-- Page content end -->
            </div>
        </div>

      
    </div>
</template>

<script setup>
import $ from 'jquery';
import Child from '/pages/Child.vue'
import Sidebar from "~/layouts/Sidebar.vue";
import Header from "~/layouts/Header.vue";
import { useNuxtApp } from '#app'
const { $navMenuOpen, $navMenuClose } = useNuxtApp()
const navMenuOpen = $navMenuOpen
const navMenuClose = $navMenuClose

</script>

<style>
.serv-item .text {
    color: #4e4e4e;
}

.serv-icon {
    display: flex;
    align-items: center;
    justify-content: center;
}

.serv-icon i {
    color: #1a6ca9;
    font-size: 28px;
}
</style>