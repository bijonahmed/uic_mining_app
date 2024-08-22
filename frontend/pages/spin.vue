<template>
    <div>
        <title>Tap Tap</title>

        <div class="wrapper">
            <div class="nav-menu">
                <nav class="menu">
                    <!-- Menu navigation start -->
                    <Sidebar />
                    <!-- Menu navigation end -->
                </nav>
            </div>
            <div class="wrapper-inline">
                <!-- Header area start -->
                <HeaderSecond />
                <!-- Page content start -->
                <main class="margin coin_pagebg mt-0 " style="min-height: 90vh;">
                    <div class="dash-balance">
                        <div class="dash-content relative">
                            <h3 class="w-text">Spin Wheel</h3>
                            <div class="notification">
                                <!-- <a href="#"><i class="fa fa-plus"></i></a> -->
                            </div>
                        </div>
                    </div>


                    <div class="loading-indicator" v-if="loading" style="text-align: center">
                        <Loader />
                    </div>

                    <!-- <section class="bal-section container">
                        <div class="ref-card c1">
                            <div class="d-flex align-items-center">
                                <div class="d-flex flex-grow">
                                    <div class="mr-auto">
                                        <h1 class="b-val" style="font-weight: 600;">{{ userCoin }}</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section> -->

                    <section class="container">
                        <div class="Wheel_posi">
                            <div class="wheel">
                                <div class="inner">
                                    <div class="slice" v-for="(prize, index) in prizes" :key="index"
                                        :style="{ transform: `rotate(${index * -30}deg)` }">
                                        <span class="prize">{{ prize }}</span>
                                    </div>
                                </div>
                            </div>
                            <svg id="svg-arrow" xmlns="http://www.w3.org/2000/svg">
                                <path style="fill:#ff2e52; stroke:#012e52; stroke-width:4; stroke-linejoin:round"
                                    d="M 81.540414,49.378716 H 121.51935 L 101.4866,69.420346 Z" />
                            </svg>
                            <button @click="spin" :disabled="activeBtn" class="text-gold"
                                style="color: #000;">SPIN</button>
                        </div>
                        <h2 class="text-center">Spin to Earn</h2>
                    </section>
                    <section class="bal-section supply_container container my-2">
                        <div class="resources-card-wrapper mb-5">
                            <NativeAds />

                        </div>

                    </section>
                </main>
                <!-- Page content end -->
                <br /><br /><br />
                <!-- Footer menu -->
                <Footer />
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import Sidebar from '~/layouts/Sidebar.vue';
import HeaderSecond from '~/layouts/HeaderSecond.vue';
import SocialFooter from '~/components/SocialFooter.vue';
import NativeAds from '~/components/NativeAds.vue'; // Adjust import path as needed
import axios from 'axios';
import { useRouter } from 'vue-router';
import Swal from "sweetalert2";
const router = useRouter();
const loading = ref(false);
definePageMeta({
    middleware: 'is-logged-out',
})



// Define your reactive state variables
const userCoin = ref(30); // Initial user coins
const spinlist = ref([]);
const prizes = ref([]);
const activeBtn = ref(false);
const deg = ref(0);
const prize = ref(null);
// Fetch data and populate spinlist and prizes when the component is mounted
onMounted(async () => {
    try {
        const response = await axios.get('/mining/getSpinList');
        spinlist.value = response.data;
        prizes.value = spinlist.value.map(item => Number(item.name));
        console.log(prizes.value);
    } catch (error) {
        console.error("Error fetching spinlist data:", error);
    }
});
// Define the spin function
const spin = () => {
    if (prizes.value.length === 0) {
        console.error("Prizes array is not populated yet.");
        return;
    }

    activeBtn.value = true;
    setTimeout(() => (activeBtn.value = false), 5100);

    let spins = Math.floor(Math.random() * 7) + 9;
    console.log("spins: " + spins);

    let wheelAngle = Math.floor(Math.random() * 12) * 30;
    console.log("wheelAngle: " + wheelAngle);

    let sectorAngle = Math.floor(Math.random() * 14) + 1;
    sectorAngle *= Math.floor(Math.random() * 2) === 1 ? 1 : -1;
    console.log("sectorAngle: " + sectorAngle);

    deg.value += 360 * spins + wheelAngle + sectorAngle;
    document.querySelector(".inner").style.transform = `rotate(${deg.value}deg)`;

    setTimeout(() => (deg.value -= sectorAngle), 100);

    let index = Math.floor((deg.value - sectorAngle) / 30) % 12;
    prize.value = prizes.value[index];

    console.log("prize index:" + index);
    console.log("you will win: " + prize.value);

    // Select the corresponding span element
    const prizeSpans = document.querySelectorAll(".slice .prize");
    if (index >= 0 && index < prizeSpans.length) {
        const selectedPrizeSpan = prizeSpans[index];
        console.log("Selected prize amount from span:", selectedPrizeSpan.textContent);

        // Insert API call
        axios.get('/mining/inserspin', {
            params: {
                spinAmount: selectedPrizeSpan.textContent,
            }
        })
            .then(response => {
                // console.log("API response:", response.data);
            })
            .catch(error => {
                console.error("Error updating coins:", error);
            });

    } else {
        console.error("Could not find the corresponding prize span element.");
    }
};



const fetchData = async () => {
    loading.value = true;
    try {
        const response = await axios.get("/mining/getSpinList");
        console.log("Response data:", response.data); // Log the response data
        spinlist.value = response.data;
    } catch (error) {
        console.error("Error fetching data:", error);
    } finally {
        loading.value = false;
    }
};


onMounted(async () => {
    await fetchData();
});

</script>


<style scoped>
.Wheel_posi {
    position: relative;
    width: fit-content;
    margin: auto;
    min-height: 400px;
}

.wheel {
    position: absolute;
    width: 350px;
    height: 350px;
    top: calc(50% - 350px / 2);
    left: calc(50% - 350px / 2);
    border-radius: 50%;
    border: 8px solid #fff;
    margin: 0px;
    box-shadow: 0 0 6px 6px #000;
    overflow: hidden;
}

.wheel:before {
    content: "";
    position: absolute;
    width: 100%;
    height: 100%;
    border-radius: 50%;
    box-shadow: 0 0 5px 10px rgba(0, 0, 0, 0.4) inset;
    z-index: 1;
}

.wheel .inner {
    width: 100%;
    height: 100%;
    transition: 5s;
}

.wheel .inner .slice {
    position: absolute;
    width: 0;
    height: 0;
    left: 115px;
    top: -15px;
    border-width: 180px 50px 0 50px;
    border-style: solid;
    transform-origin: 50% 100%;
}

.wheel .inner .slice .prize {
    position: relative;
    display: block;
    transform: rotateZ(90deg);
    left: 8px;
    text-align: center;
    font-size: 28px;
    margin-top: -160px;
    margin-left: -15px;
    color: #fff;
    text-shadow: -1px -1px 0 #585651, 1px -1px 0 #585651, -1px 1px 0 #585651, 1px 1px 0 #585651;
}

.slice:nth-child(1) {
    border-color: #16a085 transparent;
    transform: rotate(0deg);
}

.slice:nth-child(2) {
    border-color: #962bc0 transparent;
    transform: rotate(-30deg);
}

.slice:nth-child(3) {
    border-color: #34495e transparent;
    transform: rotate(-60deg);
}

.slice:nth-child(4) {
    border-color: #d35400 transparent;
    transform: rotate(-90deg);
}

.slice:nth-child(5) {
    border-color: #f39c12 transparent;
    transform: rotate(-120deg);
}

.slice:nth-child(6) {
    border-color: #c02b58 transparent;
    transform: rotate(-150deg);
}

.slice:nth-child(7) {
    border-color: #2980b9 transparent;
    transform: rotate(-180deg);
}

.slice:nth-child(8) {
    border-color: #50c556 transparent;
    transform: rotate(-210deg);
}

.slice:nth-child(9) {
    border-color: #d31313 transparent;
    transform: rotate(-240deg);
}

.slice:nth-child(10) {
    border-color: #800055 transparent;
    transform: rotate(-270deg);
}

.slice:nth-child(11) {
    border-color: #c2b503 transparent;
    transform: rotate(-300deg);
}

.slice:nth-child(12) {
    border-color: #008000 transparent;
    transform: rotate(-330deg);
}

.wheel-outer {
    position: absolute;
    width: 500px;
    height: 500px;
    top: calc(50% - 500px / 2);
    left: calc(50% - 500px / 2);
    border-radius: 50%;
    box-shadow: 0 0 5px 5px #000, 0 0 115px 101px rgba(58, 68, 89, 0.2) inset;
}

#svg-arrow {
    position: absolute;
    top: calc(50% - 235px);
    left: calc(50% - 101px);
    z-index: 1;
}

#svg-dotted {
    position: absolute;
    width: 540px;
    height: 540px;
    top: calc(50% - 540px / 2);
    left: calc(50% - 540px / 2);
}

#svg-dotted #circle-dotted {
    fill: transparent;
    stroke: #c8c8c8;
    stroke-width: 4;
    stroke-dasharray: 0.1 23;
    stroke-dashoffset: 19.5;
    stroke-linecap: round;
}

button {
    position: absolute;
    width: 50px;
    height: 50px;
    top: calc(50% - 50px / 2);
    left: calc(50% - 50px / 2);
    border-radius: 50%;
    border: none;
    outline: none;
    box-shadow: 0 0 5px 2px #000;
    z-index: 10;
    background: linear-gradient(to bottom, #fcfff4 0%, #dfe5d7 30%, #b3bead 100%);
}

button:active {
    transform: scale(0.9);
}
</style>