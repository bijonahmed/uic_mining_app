<template>
    <div>
        <title>Team -2 History</title>

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
                            <h3 class="w-text">Team -2 History</h3>
                            <div class="notification">
                            </div>
                        </div>
                    </div>

                    <div class="container">

                        <center>
                            <div class="loading-indicator" v-if="loading" style="text-align: center">
                                <BulkLoader />
                            </div>
                        </center>


                        <table class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Register Date</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="level in resonseData" :key="level.id">
                                    <td>{{ level.name }}</td>
                                    <td>{{ level.email }}</td>
                                    <td>{{ formatDate(level.created_at) }}</td>
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
const resonseData = ref([]);




const formatDate = (dateString) => {
  const date = new Date(dateString);
  return date.toLocaleString('en-US', {
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
    // hour: '2-digit',
    // minute: '2-digit',
    // second: '2-digit',
    hour12: false
  });
}

const fetchData = async () => {
    try {
        loading.value = true;
        const response = await axios.get("/user/checkLevelHistory");
        resonseData.value = response.data.level_2;
    } catch (error) {
        console.error("Error fetching data:", error);
    } finally {
        loading.value = false;
    }
};



onMounted(async () => {
    fetchData();
});
// Call the function to show loader initially


</script>
