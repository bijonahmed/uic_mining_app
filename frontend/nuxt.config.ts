// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  ssr: false,
  router: {
    options: {
      hashMode: false,
    },
  },
 
  nitro: {
    prerender: {
      crawlLinks: true,
      failOnError: false,
    },
  },
  
  runtimeConfig: {
    public: {
      baseURL:
        process.env.NODE_ENV === "production"
          ? "https://api.uicmax.com/api/"
          : "http://127.0.0.1:8000/api/",
    },
  },
  pages: true,
  devtools: { enabled: false },
  experimental: {
    payloadExtraction: true,
  },
  //css: ["~/assets/css/main.css"],

  // postcss: {
  //   plugins: {
  //     tailwindcss: {},
  //     autoprefixer: {},
  //   },
  // },
  plugins: [
    // Specify the path to your plugin file
    "~/plugins/axios.js",
    "~/plugins/jquery.js",
   // "~/plugins/google-analytics.js",
    "~/plugins/navMenu.js",
    "~/plugins/bootstrap.js",
    "~/plugins/echo.client.js",
    // Add other plugins as needed
  ],
  modules: [
    "nuxt-icon",
    "nuxt-lodash",
    "@pinia/nuxt",
    "@pinia-plugin-persistedstate/nuxt",
    "@vite-pwa/nuxt",
  ],
  pwa: {
    manifest: {
      name: "UIC",
      short_name: "UIC",
      description: "UIC Cryptocurrency Web Apps",
      theme_color: "#32CD32",
      icons: [
        {
          src: "pwa-192x192.png",
          sizes: "192x192",
          type: "image/png",
        },
        {
          src: "pwa-512x512.png",
          sizes: "512x512",
          type: "image/png",
        },
      ],
    },
    devOptions: {
      enabled: true,
      type: "module",
    },
  },

  app: {
    head: {
      charset: "utf-8",
      viewport: "width=device-width, initial-scale=1, maximum-scale=1",
      // Add CSS file
      link: [
        //Fronend 
        { rel: "stylesheet", href: "https://fonts.googleapis.com/css?family=Nunito:300,400,600,700,900", },
        // { rel: "stylesheet", href: "https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap", },
        { rel: "stylesheet", href: "https://site-assets.fontawesome.com/releases/v6.4.2/css/all.css",},
        { rel: "stylesheet", href: "https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css",},
        { rel: "stylesheet", href: "/assets/css/cryptocoins.css" },
        { rel: "stylesheet", href: "/assets/plugins/c3-chart/c3.css" },
        { rel: "stylesheet", href: "/assets/css/global.style.css" },
        { rel: "stylesheet", href: "/assets/css/swiper.min.css" },
        { rel: "stylesheet", href: "/assets/css/jqcandlestick.css" },
        { rel: "stylesheet", href: "/assets/css/bootstrap.min.css" },
        { rel: "stylesheet", href: "/assets/plugins/turbo-slider/turbo.css" },
      ],
      // Add JavaScript file
      script: [
        { src: "/assets/js/jquery-3.2.1.min.js", type: "text/javascript", },
        { src: "/assets/js/global.script.js", type: "text/javascript", },
        { src:"https://cdn.jsdelivr.net/npm/chart.js", type: "text/javascript",},
        { src:"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js", type: "text/javascript",}
       
      ],
    },
  },
});
