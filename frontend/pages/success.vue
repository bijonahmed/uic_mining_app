<template>
    <div>
        <title>Success</title>

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
                            <h3 class="w-text">Success</h3>
                            <div class="notification">

                            </div>
                        </div>
                    </div>

                    <div class="container">

                        <div class="loading-indicator" v-if="loading" style="text-align: center">
                            <Loader />
                        </div>
                        <center>
                            <h3 class="text-center ">Your request has been successfull.</h3>
                        </center>
                        <div class="text-center">
                            <nuxtLink to="/" class="text-primary">Back to home</nuxtLink>
                        </div>

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
    }, 1000); // 10000 milliseconds = 10 seconds
};

// Call the function to show loader initially
showLoaderForTenSeconds();

</script>
