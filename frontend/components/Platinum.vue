<template>
    <form @submit.prevent="startProgress()" id="formrest" enctype="multipart/form-data">
        <div class="serv-item">
            <center>
                <div class="loading-indicator" v-if="loading" style="text-align: center">
                    <BulkLoader />
                </div>
            </center>
                <!-- add components -->
                <CountdownTimerPlatinum/>
                <!-- end components -->
                <button type="submit" class="serv-icon btnsize" 
                    :disabled="buttonClicked">
                    <img src="/assets/img/platinum.png" style="width: 40px" alt="" />
                </button>
            <!-- {{ currentassets }} -->
            <!-- End Progressbar  -->
            <span class="text">Platinum</span>
        </div>
    </form>
</template>
<script setup>
import { storeToRefs } from 'pinia';
import { useStartStore } from '~/stores/super';
const startStore = useStartStore()

import { ref, onMounted } from "vue";
import axios from "axios";
const router = useRouter();
const notifyMsg = ref("");
const mining_id = ref(null);
const buttonClicked = ref(false);
const loading = ref(false);
const errors = ref({});
const mining_category_id = ref(4);
let timerId = null;

const startProgress = () => {
    buttonClicked.value = true;
    loading.value = true; 
    startStore.setData(mining_category_id.value);
    const formData = new FormData();
    formData.append("mining_category_id", mining_category_id.value);
    
    const headers = {
        "Content-Type": "multipart/form-data",
    };
    axios.post("/mining/miningProcess", formData, { headers })
        .then((res) => {
            notifyMsg.value = res.data.notify;
            mining_id.value = res.data.mining_id;
            console.log("check status: ", res.data.status);
            if(res.data.status == 1){
                router.push('/success-mining');
            }else{
                router.push('/error-mining');
            }
           
        })
        .catch((error) => {
            if (error.response && error.response.status === 422) {
                errors.value = error.response.data.errors;
            } else {
                // Handle other types of errors here
                console.error("An error occurred:", error);
            }
        }).finally(() => {
            // Actions to perform after the request, regardless of success or failure
            setTimeout(() => {
                // Actions to perform after 10 seconds, regardless of success or failure
                loading.value = false; // Example: Stop loading spinner
            }, 8000); // 10 seconds delay
        });
};

onBeforeUnmount(() => {
    clearInterval(timerId);
});
</script>
<style>
.btnsize {
    box-shadow: 0px 2px 8px 2px #1a6ca960;
    background-color: #1a6ca9;
}
</style>
