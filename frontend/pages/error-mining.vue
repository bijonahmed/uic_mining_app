<template>
    <div>
        <title> Mining</title>

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
                <main >
                    <div class="dash-balance mb-3">
                        <div class="dash-content relative">
                            <h3 class="w-text">Mining Runing</h3>
                            <div class="notification">

                            </div>
                        </div>
                    </div>

                    <div class="container">

                        <div class="loading-indicator" v-if="loading" style="text-align: center">
                    <BulkLoader />
                </div>
                                <center><h3 class="text-center text-danger">Sorry, your mining is already running.</h3></center>

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

const loading = ref(false);
// Function to show loader for 10 seconds
const showLoaderForTenSeconds = () => {
    loading.value = true; // Show loader
    setTimeout(() => {
        loading.value = false; // Hide loader after 10 seconds
    }, 3000); // 10000 milliseconds = 10 seconds
};

// Call the function to show loader initially
showLoaderForTenSeconds();

</script>
