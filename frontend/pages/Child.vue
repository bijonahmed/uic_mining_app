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
            <div class="ml-auto align-self-end"  v-if="isLoggedIn">
              <nuxt-link class="profile-av m-auto" to="/profile"><img src="/assets/img/content/avatar/user-4.png" class="img-fluid" /></nuxt-link>
              <p class="text-white" >{{ userStore.email }}</p>
            </div>
            <div class="ml-auto align-self-end" v-else>
              <nuxt-link class="profile-av m-auto" to="#"><img src="/assets/img/content/avatar/user-4.png" class="img-fluid" /></nuxt-link>
            </div>
          </div>
        </div>
      </div>

      <section class="bal-section  container">
        <div class="resources-card-wrapper">
          <div class="wallet-card mr-10 round">
            <div class="flex-column flex-md-row">
              <!-- <img src="/assets/img/5001578.png" class="max50" alt="" /> -->
              <h3 class="">Maximum Supply</h3>
              <p class="mb-0 font-weight-medium">
                {{ maximum_supply }} UIC
              </p>

            </div>
          </div>

          <div class="wallet-card ml-10">
            <div class="flex-column flex-md-row">
              <!-- <img src="/assets/img/1027961.png" class="max50" alt="" /> -->
              <h3 class="">Total Supply</h3>
              <p class="mb-0 font-weight-medium">
                {{ total_supply }} UIC
              </p>

            </div>
          </div>
        </div>
        <div class="resources-card-wrapper mt-15">
          <div class="wallet-card mr-10">
            <div class="flex-column flex-md-row">
              <!-- <img src="/assets/img/return-on-investment.png" class="max50" alt="" /> -->
              <h3 class="">Circulating Supply</h3>
              <p class="mb-0 font-weight-medium">
                {{ circulatingSupply }} UIC
              </p>
             
            </div>
          </div>

          <div class="wallet-card ml-10">
            <div class="flex-column flex-md-row">
              <!-- <img src="/assets/img/2422796.png" class="max50" alt="" /> -->
              <h3 class="">Market Cap</h3>
              <p class="mb-0 font-weight-medium">
                ${{ marketCap }}
              </p>
           
            </div>
          </div>
        </div>
      </section>
      <!-- <nuxt-link to="/buy-mining-service" class="btn btn-default">Buy</nuxt-link> -->

      <div class="container">
        <center class="d-none">
          <span v-if="isLoggedIn">
            <nuxt-link to="/buy-mining-service" class="btn btn-link btn-lg button custom-btn">Buy Mining
              Machine</nuxt-link>
          </span>
          <span v-else>
            <nuxt-link to="/login" class="btn btn-link btn-lg button custom-btn">Buy Mining Machine</nuxt-link>
          </span>
        </center>
 

        <div class="row">
          <div class="col text-center">
            <span v-if="category_1 === 1">
              <Start />
            </span>
            <span v-else class="text-center">
              <nuxt-link to="/buy-mining-service" v-if="isLoggedIn" class="m_icon serv-icon mt-3"><img
                  src="/assets/img/platinum.png" style="width: 40px" alt="" /></nuxt-link>
              <nuxt-link to="/login" v-if="!isLoggedIn" class="m_icon serv-icon mt-3"><img
                  src="/assets/img/platinum.png" style="width: 40px" alt="" /></nuxt-link>
              <p class="text mt-2">Start</p>
            </span>
          </div>

          <div class="col text-center" v-if="category_2 === 2">
            <Fast />
          </div>
          <div v-else class="text-center col">
            <nuxt-link to="/buy-mining-service" v-if="isLoggedIn" class="m_icon serv-icon mt-3"><img
                src="/assets/img/platinum.png" style="width: 40px" alt="" /></nuxt-link>
            <nuxt-link to="/login" v-if="!isLoggedIn" class="m_icon serv-icon mt-3"><img src="/assets/img/platinum.png"
                style="width: 40px" alt="" /></nuxt-link>
            <p class="text mt-2">Fast</p>
          </div>

          <div class="col" v-if="category_3 === 3">
            <Super />
          </div>

          <div v-else class="text-center col serv-item">
            <nuxt-link to="/buy-mining-service" v-if="isLoggedIn" class="m_icon serv-icon mt-3"><img
                src="/assets/img/platinum.png" style="width: 40px" alt="" /></nuxt-link>
            <nuxt-link to="/login" v-if="!isLoggedIn" class="m_icon serv-icon mt-3"><img src="/assets/img/platinum.png"
                style="width: 40px" alt="" /></nuxt-link>
            <p class="text mt-2">Super</p>
          </div>

          <div class="col" v-if="category_4 === 4">
            <Platinum />
          </div>


          <div v-else class="text-center col">
            <div class="serv-item">
              <nuxt-link to="/buy-mining-service" v-if="isLoggedIn" class="m_icon serv-icon mt-3"><img
                  src="/assets/img/platinum.png" style="width: 40px" alt="" /></nuxt-link>
              <nuxt-link to="/login" v-if="!isLoggedIn" class="m_icon serv-icon mt-3"><img
                  src="/assets/img/platinum.png" style="width: 40px" alt="" /></nuxt-link>

              <p class="text mt-2">Platinum</p>
            </div>
          </div>

        </div>
      </div>

      <section class="bal-section supply_container container mt-30">
    <!-- <h4 class="title-main mt-0">Circulating Supply</h4> -->
    <div class="resources-card-wrapper">
      <div class="resources-card mr-10 w-100">
        <!-- <iframe src="https://api.uicmax.com/chart" frameborder="0" width="100%" height="400" style="min-height: 400px;"></iframe> -->
        <canvas id="dailyChart" style="width: 100%; height: 400px;"></canvas>
      </div>
    </div>
  </section>
      <br /><br /><br /><br />
    </main>
  </div>
</template>

<script setup>
import { Chart, registerables } from 'chart.js';
import { ref, watchEffect } from "vue";
import { useUserStore } from "~~/stores/user";
import { storeToRefs } from "pinia";
import axios from "axios";
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


// start chart 
Chart.register(...registerables);

const chartRef = ref(null);
let dailyChart;

const fetchChartData = async () => {
  try {
    const response = await axios.get('/chart-data');
    const labels = Object.keys(response.data);
    const dataValues = Object.values(response.data).map(value => parseFloat(value));

    // Update chart data
    dailyChart.data.labels = labels;
    dailyChart.data.datasets[0].data = dataValues;
    dailyChart.update();
  } catch (error) {
    console.error('Error fetching data:', error);
  }
};

onMounted(() => {
  const ctx = document.getElementById('dailyChart').getContext('2d');
  dailyChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: [], // Initially empty, will be populated by fetched data
      datasets: [{
        label: 'Circulating Supply',
        data: [],
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
        borderColor: 'rgba(75, 192, 192, 1)',
        borderWidth: 1,
        fill: true,
      }]
    },
    options: {
      responsive: true,
      scales: {
        y: {
          beginAtZero: true
        }
      },
      plugins: {
        tooltip: {
          callbacks: {
            label: function(tooltipItem) {
              if (tooltipItem.dataset) {
                return tooltipItem.dataset.data[tooltipItem.dataIndex].toFixed(10);
              }
              return '';
            }
          }
        }
      }
    }
  });

  // Fetch chart data initially
  fetchChartData();

  // Update chart data every 10 seconds
  setInterval(fetchChartData, 10000); // 10 seconds interval (10000 milliseconds)
});
//end chart 

const fetchData = async () => {
  try {
    const response = await axios.get("/settingrowClient");
    console.log("Response data:", response.data.maximum_supply);
    maximum_supply.value = response.data.maximum_supply;
    total_supply.value = response.data.total_supply;
    //
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
//getGraphHistory();

watchEffect(async () => {
  // Create a promise that resolves after 5 seconds
  const delay = new Promise((resolve) => setTimeout(resolve, 3000));
  try {
    await delay; // Wait for 5 seconds
    await userStore.getUser(); // Wait for the user data to be fetched
  } catch (error) {
    //console.error(error);
  } finally {
    loading.value = false; // Hide the loading indicator after all operations are complete
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
@media(max-width: 576px){
  .resources-card canvas{
    height: 300px !important;
  }
}
</style>