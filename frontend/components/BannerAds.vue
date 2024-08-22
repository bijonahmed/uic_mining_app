<template>
  <div ref="BannerAds" class="ad-container"></div>
</template>

<script setup>
import { onMounted, ref } from 'vue';

const BannerAds = ref(null);

const loadBannerAds = () => {
  if (BannerAds.value) {
    // Set the container ID if required by your ad provider
    BannerAds.value.id = 'container-1e720467957b6f71f9feef1acc515088';

    // Configure ad options
    window.atOptions = {
      'key': '1e720467957b6f71f9feef1acc515088',
      'format': 'iframe',
      'height': 50,
      'width': 320,
      'params': {}
    };

    // Create and append the ad script
    const script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = '//www.topcreativeformat.com/1e720467957b6f71f9feef1acc515088/invoke.js';
    script.async = true;
    script.onload = () => {
      console.log('Ad script loaded successfully.');
    };
    script.onerror = (error) => {
      console.error('Error loading ad script:', error);
    };

    BannerAds.value.appendChild(script);
  }
};

onMounted(() => {
  loadBannerAds();
});
</script>

<style scoped>
.ad-container {
  width: 320px; /* Ensure this matches the ad dimensions */
  height: 50px; /* Ensure this matches the ad dimensions */
}

iframe {
  box-sizing: border-box;
  width: 100% !important;
  height: 100% !important;
}

iframe a {
  display: block !important;
  width: 100% !important;
}

iframe a img {
  width: 100% !important;
}
</style>
