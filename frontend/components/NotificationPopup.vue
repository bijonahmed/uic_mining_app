<template>
    <!--NOTIFICATION BOX CONTENT START-->
    <div class="search-form">
        <span class="close-search-form" data-search="close"><i class="fa fa-times"></i> </span>
       
        <ul class="notification-list list-unstyled">
            <li>
                <div class="d-flex align-items-center justify-content-between">
                    <div class="d-flex align-items-center">
                        <div class="">
                            <h5 class="coin-name">You have {{ count }} notifications</h5>
                        </div>
                    </div>
                    <div>
                        <!-- <a href="#"><small class="text-muted d-block">mark all as read</small></a> -->
                    </div>
                </div>
            </li>
            <li v-for="v in data" :key="v.id">
                <div class="d-flex align-items-center justify-content-between">
                    <div class="d-flex align-items-center">
                        <div class="notice-icon available">
                            <i class="fa fa-check"></i>
                        </div>
                        <div class="ml-10">
                            <h4 class="coin-name">{{ v.name }}</h4>
                            <small class="text-muted">{{ v.created_at }}</small>
                        </div>
                    </div>
                </div>
            </li>
           
            <!-- <li>
                <div class="d-flex align-items-center justify-content-between">
                    <div class="d-flex align-items-center">
                        <a href="" class="text-muted">Read all notifications</a>
                    </div>
                </div>
            </li> -->

        </ul>
    </div>
    <!--NOTIFICATION BOX CONTENT END-->
</template>


<script setup>
import Sidebar from "~/layouts/Sidebar.vue";
import Header from "~/layouts/Header.vue";
import HeaderSecond from "~/layouts/HeaderSecond.vue";
import Swal from "sweetalert2";
import axios from "axios";
const router = useRouter();
const loading = ref(false);
const data = ref([]);
const count = ref(0);
 

const fetchData = async () => {
    try {
        loading.value = true;
        const response = await axios.get("/user/allNotification");
        data.value = response.data.notification;
        count.value = response.data.count;
    } catch (error) {
        console.error("Error fetching data:", error);
    } finally {
        loading.value = false;
    }
};

 

onMounted(async () => {
    fetchData();
});


</script>


<style>
.notification-list{
    margin-top: 80px;
}
</style>