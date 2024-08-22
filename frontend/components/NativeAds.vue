<template>
    <div ref="adContainer" class="ad-container"></div>
</template>

<script setup>
import { ref, onMounted } from 'vue';

const adContainer = ref(null);

onMounted(() => {

    // Create the script element
    const script = document.createElement('script');
    script.type = 'text/javascript';
    script.async = true;
    script.src = '//pl24037578.highratecpm.com/53518525b4cb5cce3c056d5c4815aa16/invoke.js';

    // Append the script to the document head
    document.head.appendChild(script);

    // Create the container div element
    const containerDiv = document.createElement('div');
    containerDiv.id = 'container-53518525b4cb5cce3c056d5c4815aa16';

    // Append the container div to the adContainer ref
    if (adContainer.value) {
        adContainer.value.appendChild(containerDiv);
    }
});
</script>

<style scoped>
.ad-container {
    width: 468px;
    /* Set the width based on your ad's requirements */
    height: 60px;
    /* Set the height based on your ad's requirements */
}
</style>