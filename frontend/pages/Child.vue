<template>
  <div>
    <center v-if="isLoggedIn">
      <div class="loading-indicator" v-if="loading" style="text-align: center">
        <Loader />
      </div>
    </center>

    <main class="margin mt-0">
      <div class="dash-balance">
        <div class="d-flex align-items-center mt-30">
          <div class="d-flex flex-grow">
            <div class="mr-auto">
              <h1 class="b-val" v-if="isLoggedIn">${{ availablebalance }}</h1>
              <p class="g-text mb-0" v-if="isLoggedIn">
                <p style="color: white">CURRENT PRICE</p>
              </p>
            </div>
            <div class="ml-auto align-self-end" v-if="isLoggedIn">
              <nuxt-link class="profile-av m-auto" to="/profile">
                <img src="/assets/img/content/avatar/user-4.png" class="img-fluid" />
              </nuxt-link>
              <p class="text-white">{{ userStore.email }}</p>
            </div>
            <div class="ml-auto align-self-end" v-else>
              <nuxt-link class="profile-av m-auto" to="#">
                <img src="/assets/img/content/avatar/user-4.png" class="img-fluid" />
              </nuxt-link>
            </div>
          </div>
        </div>
      </div>

      <section class="bal-section container">
        <div class="resources-card-wrapper">
          <div class="wallet-card mr-10 round">
            <div class="flex-column flex-md-row">
              <h3 class="">Maximum Supply</h3>
              <p class="mb-0 font-weight-medium">{{ maximum_supply }} UIC</p>
            </div>
          </div>

          <div class="wallet-card ml-10">
            <div class="flex-column flex-md-row">
              <h3 class="">Total Supply</h3>
              <p class="mb-0 font-weight-medium">{{ total_supply }} UIC</p>
            </div>
          </div>
        </div>
        <div class="resources-card-wrapper mt-15">
          <div class="wallet-card mr-10">
            <div class="flex-column flex-md-row">
              <h3 class="">Circulating Supply</h3>
              <p class="mb-0 font-weight-medium">{{ circulatingSupply }} UIC</p>
            </div>
          </div>

          <div class="wallet-card ml-10">
            <div class="flex-column flex-md-row">
              <h3 class="">Market Cap</h3>
              <p class="mb-0 font-weight-medium">${{ marketCap }}</p>
            </div>
          </div>
        </div>
      </section>

      <div class="container">
        <center class="d-none">
          <span v-if="isLoggedIn">
            <nuxt-link to="/buy-mining-service" class="btn btn-link btn-lg button custom-btn">Buy Mining Machine</nuxt-link>
          </span>
          <span v-else>
            <nuxt-link to="/login" class="btn btn-link btn-lg button custom-btn">Buy Mining Machine</nuxt-link>
          </span>
        </center>

        <div class="row">
          <div class="col text-center">
            <span class="text-center">
              <nuxt-link to="/login" v-if="!isLoggedIn" class="m_icon serv-icon mt-3">
                <img src="/assets/img/mining.png" style="width: 40px" alt="" />
              </nuxt-link>
              <p class="text" style="margin-top: 20px;" v-if="isLoggedIn && !isMiningDisabled">
                <Start /> Mining
              </p>
              <p v-if="!isLoggedIn">Mining</p>
            </span>
          </div>

          <div class="text-center col">
            <nuxt-link to="/spin" v-if="isLoggedIn" class="m_icon serv-icon mt-3">
              <img src="/assets/img/wheel.png" style="width: 40px" alt="" />
            </nuxt-link>
            <nuxt-link to="/login" v-if="!isLoggedIn" class="m_icon serv-icon mt-3">
              <img src="/assets/img/wheel.png" style="width: 40px" alt="" />
            </nuxt-link>
            <p class="text mt-2">Spin</p>
          </div>

          <div class="col" v-if="category_3 === 3">
            <Super />
          </div>

          <div v-else class="text-center col serv-item">
            <nuxt-link to="/taptap" v-if="isLoggedIn" class="m_icon serv-icon mt-3">
              <img src="/assets/img/taptap.png" style="width: 40px" alt="" />
            </nuxt-link>
            <nuxt-link to="/login" v-if="!isLoggedIn" class="m_icon serv-icon mt-3">
              <img src="/assets/img/taptap.png" style="width: 40px" alt="" />
            </nuxt-link>
            <p class="text mt-2">TapTap</p>
          </div>

          <div class="col" v-if="category_4 === 4">
            <Platinum />
          </div>

          <div v-else class="text-center col">
            <div class="serv-item">
              <nuxt-link to="#" v-if="isLoggedIn" class="m_icon serv-icon mt-3">
                <img src="/assets/img/question.png" style="width: 40px" alt="" />
              </nuxt-link>
              <nuxt-link to="/login" v-if="!isLoggedIn" class="m_icon serv-icon mt-3">
                <img src="/assets/img/question.png" style="width: 40px" alt="" />
              </nuxt-link>
              <p class="text mt-2">Special</p>
            </div>
          </div>
        </div>
      </div>

      <section class="bal-section supply_container container my-2">
        <div class="resources-card-wrapper mb-5">
          <!-- Insert BannerAds component here -->
          <BannerAds />          
        </div>        
        <div ref="adContainer" class="ad-container"></div>
      </section>
      <br>
      <br>
      <br>
    </main>
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue';
import { useUserStore } from '~~/stores/user';
import { storeToRefs } from 'pinia';
import axios from 'axios';
import BannerAds from '~/components/BannerAds.vue'; // Adjust import path as needed

const adContainer = ref(null);

const userStore = useUserStore();
const { isLoggedIn } = storeToRefs(userStore);
const loading = ref(true);
const maximum_supply = ref(0);
const circulatingSupply = ref(0);
const marketCap = ref(0);
const currentPrice = ref(0);
const availablebalance = ref(0);
const total_supply = ref(0);
const category_1 = ref(null);
const category_2 = ref(null);
const category_3 = ref(null);
const category_4 = ref(null);

const isMiningDisabled = computed(() => total_supply.value >= circulatingSupply.value);

const fetchData = async () => {
  try {
    const response = await axios.get("/settingrowClient");
    maximum_supply.value = response.data.maximum_supply;
    total_supply.value = response.data.total_supply;
    circulatingSupply.value = response.data.circulatingSupply;
    marketCap.value = response.data.marketCap;
    currentPrice.value = response.data.currentPrice;
    availablebalance.value = response.data.currentPrice_top;
  } catch (error) {
    console.error("Error fetching data:", error);
  }
};

const checkMiningMatching = async () => {
  try {
    const response = await axios.get("/mining/checkMiningInfo");
    category_1.value = response.data.category_1;
    category_2.value = response.data.category_2;
    category_3.value = response.data.category_3;
    category_4.value = response.data.category_4;
  } catch (error) {
    console.error("Error fetching data:", error);
  }
};

fetchData();
checkMiningMatching();

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

watchEffect(async () => {
  const delay = new Promise(resolve => setTimeout(resolve, 3000));
  try {
    await delay;
    await userStore.getUser();
  } catch (error) {
    console.error(error);
  } finally {
    loading.value = false;
  }
});
</script>


<style scoped>
.countdown {
  font-size: 24px;
  margin-top: 20px;
}

button {
  margin-top: 20px;
  padding: 10px 20px;
  font-size: 16px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.custom-btn {
  background-color: #29529e;
  /* Custom background color */
  color: white;
  /* Custom text color */
}

.custom-btn:hover {
  background-color: #29529e;
  /* Custom hover color */
}

@media(max-width: 576px) {
  .resources-card canvas {
      height: 300px !important;
  }
}
</style>