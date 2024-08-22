<template>
    <div ref="BannerAds" class="ad-container"></div>
  </template>
  
  <script setup>
  import { onMounted, ref } from 'vue';
  
  const BannerAds = ref(null);
  
  const BannderAdsFunc = () => {
    if (BannerAds.value) {
      BannerAds.value.id = 'container-1e720467957b6f71f9feef1acc515088';
      window.atOptions = {
        'key': '1e720467957b6f71f9feef1acc515088',
        'format': 'iframe',
        'height': 50,
        'width': 320,
        'params': {}
      };
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
    BannderAdsFunc();
  });
  </script>
  
  <style scoped>
  .ad-container {
    width: 320px; /* Match the ad width */
    height: 50px; /* Match the ad height */
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
  