<template>
    <div>
        <title>Holders</title>

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
                <Header />
                <!-- Footer menu -->
                <Footer />
                <!-- Page content start -->
                <!-- Page content start -->
                <main class="margin mt-0">

                    <div class="dash-balance">
                        <div class="dash-content relative">
                            <h3 class="w-text">Holders</h3>
                            <div class="notification">
                                <!-- <a href="#"><i class="fa fa-plus"></i></a> -->
                            </div>
                        </div>
                    </div>

                    <section class="bal-section container">

                        <div class="resources-card-wrapper">
                            <div class="wallet-card mr-10 round">
                                <div class="flex-column flex-md-row">
                                    <h3 class="">Total Holders</h3>
                                    <p class="mb-0 font-weight-medium"><i class="txt-green fa fa-arrow-up mr-10"></i>{{
                                        totalHolders }}&nbsp; Users </p>
                                </div>
                            </div>

                            <div class="wallet-card ml-10">
                                <div class="flex-column flex-md-row">
                                    <h3 class="">Circulating Supply</h3>
                                    <p class="mb-0 font-weight-medium"><i class="txt-red fa fa-arrow-down mr-10"></i>{{
                                        miningAmountSum }}&nbsp; UIC</p>
                                </div>
                            </div>
                        </div>

                    </section>

                    <center>
                        <div class="loading-indicator" v-if="loading" style="text-align: center">
                            <Loader />
                        </div>
                    </center>

                    <section class="container">
                        <h4 class="title-main mt-5">Top Members</h4>
                        <ul class="transaction-list list-unstyled pb-4">
                            <li v-for="(v, index) in data" :key="v.id" class="rm_bg">
                                <div class="item_bg">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div class="ml-10">
                                            <small class="text-muted">
                                                <span style="padding-right: 0px;border: none;margin-right: 5px;">{{
                                                    index +
                                                    1 }}.
                                                </span>{{ v.uic_address }}</small>
                                        </div>
                                        <div>
                                            <small class="d-block mb-0 txt-green">{{ v.mining_amount }} <span
                                                    class="text-muted">UIC</span></small>
                                        </div>
                                    </div>
                                </div>
                                <BannerAds style="width: 100%;text-align: center;"  v-if="(index + 1) % 5 === 0" />
                            </li>

                        </ul>
                    </section>

                </main>
                <!-- Page content end -->
            </div>
        </div>
    </div>
</template>

<script setup>
import Sidebar from "~/layouts/Sidebar.vue";
import Header from "~/layouts/Header.vue";
import HeaderSecond from "~/layouts/HeaderSecond.vue";
import Swal from "sweetalert2";
import BannerAds from '~/components/BannerAds.vue'; // Adjust import path as needed
import axios from "axios";
const router = useRouter();
const loading = ref(false);
const data = ref([]);
const totalHolders = ref(0);
const miningAmountSum = ref(0);
const circulatingSupply = ref(0);

const fetchData = async () => {
    try {
        loading.value = true;
        const response = await axios.get("/user/allTopUicHolders");
        data.value = response.data.users;
        totalHolders.value = response.data.totalHolders;

        // miningAmountSum.value = response.data.users
        // .map(user => parseFloat(user.mining_amount))
        // .reduce((acc, curr) => acc + curr, 0);
        const total = response.data.users
            .map(user => parseFloat(user.mining_amount))
            .reduce((acc, curr) => acc + curr, 0);
        miningAmountSum.value = parseFloat(total.toFixed(2));


    } catch (error) {
        console.error("Error fetching data:", error);
    } finally {
        loading.value = false;
    }
};

const supplyInformation = async () => {
    try {
        const response = await axios.get("/settingrowClient");
        circulatingSupply.value = response.data.circulatingSupply;

    } catch (error) {
        console.error("Error fetching data:", error);
    }
};

onMounted(async () => {
    fetchData();
    supplyInformation();
});

</script>

