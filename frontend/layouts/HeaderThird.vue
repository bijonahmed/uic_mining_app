<template>
    <header class="no-background set-bg"> <!-- extra class no-background -->

        <a class="go-back-link" href="javascript:history.back();"><i class="fa fa-arrow-left"></i></a>
        <div class="search-button" data-search="open">
            <img src="/assets/img/content/notification1.png" class="not-icon1" alt="">
            <img src="/assets/img/content/notification2.png" class="not-icon2" alt="">
        </div>

        <div class="navi-menu-button" @click="navMenuOpen()">
            <em></em>
            <em></em>
            <em></em>
        </div>
        <NotificationPopup />
    </header>


    <header> <!-- extra class no-background -->
        <a class="go-back-link" href="javascript:history.back();"><i class="fa fa-arrow-left"></i></a>
        <h1 class="page-title">{{ title }}</h1>
        <div class="navi-menu-button" @click="navMenuOpen()">
            <em></em>
            <em></em>
            <em></em>
        </div>
    </header>

</template>

<script setup>

import { useNuxtApp } from '#app'
import NotificationPopup from '~/components/NotificationPopup.vue';
const { $navMenuOpen, $navMenuClose } = useNuxtApp()
const navMenuOpen = $navMenuOpen
const navMenuClose = $navMenuClose


</script>
