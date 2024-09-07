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
                <!-- Footer menu -->
                <Footer />
                <!-- Page content start -->
                <main class="margin coin_pagebg mt-0">
                    <div class="loading-indicator" v-if="loading" style="text-align: center">
                        <Loader />
                    </div>
                    <div class="dash-balance">
                        <div class="dash-content relative">
                            <h3 class="w-text">Tap Tap</h3>
                            <div class="notification">
                                <!-- <a href="#"><i class="fa fa-plus"></i></a> -->
                            </div>
                        </div>
                    </div>

                    <section class="bal-section container">
                        <div class="ref-card c1">
                            <div class="d-flex align-items-center">
                                <div class="d-flex flex-grow">
                                    <div class="mr-auto">
                                        <h1 class="b-val" style="font-weight: 600;">{{ userCoin }}</h1>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section class="container">
                        <button type="button" class="btn_tap_coin" @click="miningCoin">
                            <transition-group name="float-up" tag="ul" class="plus_coin_list">
                                <li v-for="coin in plusCoins" :key="coin.id" class="plus_coin">+{{ levelCoin }}
                                </li>
                            </transition-group>
                            <img src="/assets/img/uic.png" alt="" class="img-fluid btn_tap_coin_img">
                        </button>
                        <h2 class="text-center fw-bold">Tap to Earn</h2>
                    </section>

                    <section class="bal-section supply_container container my-2">
                        <div class="resources-card-wrapper mb-5">
                            <!-- Insert BannerAds component here -->
                            <NativeAds />
                        </div>
                    </section>

                </main>
                <!-- Page content end -->
            </div>
        </div>
    </div>
</template>


<script setup>
import { ref, reactive, onMounted } from 'vue';
import axios from 'axios';
import { useRouter } from 'vue-router';
import Swal from "sweetalert2";
const router = useRouter();
const loading = ref(false);
definePageMeta({
    middleware: 'is-logged-out',
})
import Sidebar from "~/layouts/Sidebar.vue";
import HeaderSecond from "~/layouts/HeaderSecond.vue";
import SocialFooter from "~/components/SocialFooter.vue";
import NativeAds from "~/components/NativeAds.vue";


const levelCoin = ref(10);  // Example: level of coins per click
const userCoin = ref(0);    // Initial user coins
const plusCoins = ref([]);  // To handle the animation effect

onMounted(async () => {
    await fetchData();
});


const fetchData = async () => {
    loading.value = true;
    try {
        const response = await axios.get("/auth/showProfileData");
        console.log("Response data:", response.data.taptap_coin); // Log the response data
        userCoin.value = response.data.taptap_coin;
    } catch (error) {
        console.error("Error fetching data:", error);
    } finally {
        loading.value = false;
    }
};


const miningCoin = async () => {
    const level = levelCoin.value;
    const user = userCoin.value;

    // Button animation effect
    const button = document.querySelector(".btn_tap_coin");
    if (button) {
        button.classList.add("click");
        setTimeout(() => {
            button.classList.remove("click");
        }, 50);
    }
    userCoin.value = user + level;
    const newCoins = Array(level).fill(null).map((_, index) => ({
        id: Date.now() + index,
    }));
    plusCoins.value = [...plusCoins.value, ...newCoins];

    // Clear the animation effect after a short delay
    setTimeout(() => {
        plusCoins.value = [];
    }, 1000);

    // Send the updated coin value to the server via API call
    try {
        const response = await axios.get("/mining/insertaptap", {
            params: {
                userCoins: userCoin.value,
            }
        });
        console.log("API response:", response.data);
    } catch (error) {
        console.error("Error updating coins:", error);
    }
};
</script>



<style>
.coin_pagebg {
    background-image: linear-gradient(140deg, #c6a8ff8f 18%, #f5d36da1 60%, #ceb4ff6e 82%);
    min-height: 90vh;

}

.btn_tap_coin {
    background-color: transparent;
    border: none !important;
    outline: 0 !important;
    width: 100%;
    height: 300px;
    position: relative;
}

.btn_tap_coin img {
    height: 100%;
    /* filter: drop-shadow(2px 4px 6px #adadad); */
}

.btn_tap_coin.click img {
    /* transform: skew(.6deg,.6deg); */
    transform: scale(1.1);
}

.plus_coin_list {
    list-style: none;
    padding: 0;
}

.plus_coin {
    position: absolute;
    left: 50%;
    top: 50%;
    font-size: 20px;
    transform: translate(-50%, 50%);
    color: #1e4c9b;
    animation: floatUp .8s ease-out forwards;
}

.border-radius {
    border-radius: 30px;
    font-size: 10px;
    padding: 1px 10px;
    text-align: center;
}

@keyframes floatUp {
    0% {
        transform: translate(-50%, 10%);
        opacity: 1;
    }

    100% {
        transform: translate(-50%, -200%);
        opacity: 0;
    }
}
</style>