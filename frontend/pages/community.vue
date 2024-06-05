<template>
    <div>
        <title>Community</title>

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
                            <h3 class="w-text">Community</h3>
                            <div class="notification">

                            </div>
                        </div>
                    </div>
                    <div class="container">

                       
                        <form id="settingsForm">
                            <div class="list-box" v-for="comm in communitys" :key="comm.id">
                                <div class="list-item">
                                    <span class="list-item-title">
                                        <small style="margin-right: 15px;">1.</small>
                                        <nuxt-link to="#" @click="checkSlug(comm.slug)"><small>{{ comm.name }} </small></nuxt-link>
                                        
                                    </span>

                                    <div class="sweet-check d-none">
                                        <input type="checkbox" name="chart" value="1">
                                        <div class="outline">
                                            <span></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
 

                            <div class="form-divider"></div>
                            <div class="form-row mb-70">
                                <a href="#" class="button circle block orange" id="getCheckedButton">
                                    <i class="fa fa-crown" style="color: rgb(255, 217, 0);margin-right: 10px;"></i>
                                    Premium Community
                                </a>
                            </div>
                            <div class="form-divider"></div>

                        </form>

                    </div>
                    <div class="col-md-12 adv" id="techyar-adv-cont" accesskey="27423529011101" lang="eng" data="10012">
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
import axios from "axios";
import { useRouter } from 'vue-router';
const router = useRouter();
const communitys = ref([]);
const username = ref();
const onlyName = ref();

const checkSlug = (slug) => {
    router.push({
        path: '/chatbox/messages',
        query: { 
            slug,
            username: username.value,
            name: onlyName.value,
        }
    });
};
const fetchData = async () => {
    try {
        const response = await axios.get("/user/getCommunity");
        communitys.value = response.data;
        getuserDetails();

    } catch (error) {
        console.error("Error fetching data:", error);
    }
};


const getuserDetails = async () => {
    try {
        const response = await axios.post("/auth/me");
        console.log("response:" + response.data.email);
        username.value = response.data.email;
        onlyName.value = response.data.name;

    } catch (error) {
        console.error("Error fetching data:", error);
    }
};



onMounted(() => {
    fetchData();
});


</script>


<style scoped>
.dash-balance {
    background: url(/assets/img/content/dash-bg.png) no-repeat center center;
    background-size: cover;
    position: relative;
    overflow: hidden;
    padding: 15px 20px 10px;
}
</style>