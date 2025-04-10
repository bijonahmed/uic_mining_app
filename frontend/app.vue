<template>
    <!-- <CommonHeader /> -->
    <VitePwaManifest />
    <NuxtPage />

</template>
 
<script setup>
import { useIdleLogout } from '~/composables/watchIdleLogout';
console.log('Default layout loaded'); // Log when the layout is loaded
// Initialize idle logout with a 2-minute idle time
useIdleLogout(300000); // 5 minutes = 300000 ms
</script>