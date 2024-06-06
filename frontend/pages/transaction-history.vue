<template>
    <div>
        <title>Transaction History</title>

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
                <main>
                    <div class="dash-balance mb-3">
                        <div class="dash-content relative">
                            <h3 class="w-text">Transaction History</h3>
                            <div class="notification">
                            </div>
                        </div>
                    </div>

                    <div class="container">

                        <center><div class="loading-indicator" v-if="loading" style="text-align: center">
                            <BulkLoader />
                        </div></center>

                        <table class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Description</th>
                                    <th>Amount</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="transaction in tranhistory" :key="transaction.id">
                                        <td>{{ transaction.created_at }}</td>
                                        <td>{{ transaction.description }}</td>
                                        <td>
                                            <span v-if="transaction.type == 1" style="color:green; font-weight: bold;;">${{ transaction.amount.toFixed(2) }}</span>
                                            <span v-if="transaction.type == 2" style="color:red; font-weight: bold;;">${{ transaction.amount.toFixed(2) }}</span>
                                            <span v-if="transaction.type == 3" style="color:red; font-weight: bold;;">${{ transaction.amount.toFixed(2) }}</span>
                                        </td>

                                        
                                        <td> 
                                        <span v-if="transaction.type == 1">

                                            <div v-if="transaction.dep_status == 0">
                                                <p style="color: blue; font-weight: bold;">{{ transaction.depositStatus }}</p>
                                            </div>
                                            <div v-if="transaction.dep_status == 1" style="color:green; font-weight: bold;">
                                                {{ transaction.depositStatus }}
                                            </div>


                                            <div v-if="transaction.dep_status == 2" style="color:red; font-weight: bold;">
                                                {{ transaction.depositStatus }}
                                            </div>
                                           


                                        </span>

                                        <span v-else-if="transaction.type == 2">

                                        </span>

                                        <span v-else-if="transaction.type == 3">
                                            {{ transaction.machinestatus }} 
                                        </span>


                                        </td>
                                    </tr>
                                <!-- Add more rows as needed -->
                            </tbody>
                        </table>

                    </div>

                </main>
                <!-- Page content end -->
            </div>
        </div>
    </div>
</template>


<script setup>
import Sidebar from "~/layouts/Sidebar.vue";
import HeaderSecond from "~/layouts/HeaderSecond.vue";
import Swal from "sweetalert2";
import { ref, watchEffect } from "vue";
import { useUserStore } from "~~/stores/user";
import { storeToRefs } from "pinia";
import axios from "axios";
const userStore = useUserStore();
const router = useRouter();
const loading = ref(false);
const tranhistory = ref([]);

const fetchData = async () => {
    try {
        loading.value = true;
        const response = await axios.get("/user/getBalance");
        //console.log("Response: ", response.data);
        tranhistory.value = response.data.transactionhistory;
    } catch (error) {
        console.error("Error fetching data:", error);
    } finally{
        loading.value = false;
    }
};



onMounted(async () => {
    fetchData();
});
// Call the function to show loader initially


</script>
