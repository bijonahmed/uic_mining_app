<template>
    <div>
        <title>Add Withdraw</title>

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
                            <h3 class="w-text">Add Withdraw</h3>
                            <div class="notification">
                            </div>
                        </div>
                    </div>

                    <center>
                            <div class="loading-indicator" v-if="loading" style="text-align: center">
                                <BulkLoader />
                            </div>
                        </center>


                    <div class="container">
                       

                        <form @submit.prevent="submitForm" id="formrest">
                            <div class="mb-3">
                                <label for="amount" class="form-label">Method</label>
                                <input type="text" class="form-control" v-model="insertdata.name" readonly disabled/>
                                <span class="text-danger" v-if="errors.name">{{ errors.name[0] }}</span>
                               
                            </div>
                            <div class="mb-3">
                                <label for="amount" class="form-label">TRC-20 Address</label>
                                <input type="text" class="form-control"   v-model="insertdata.account_number"/>
                                <span class="text-danger" v-if="errors.account_number">{{ errors.account_number[0] }}</span>
                            </div>
                            <button type="submit" class="btn btn-primary" :disabled="buttonClicked">Submit</button>
                       </form>

                        <hr/>
                        <table class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Account No</th>
                                    <!-- <th>Status</th> -->
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="val in list" :key="val.id">
                                    <td>{{ val.name }}</td>
                                    <td>{{ val.account_number }}</td>
                                    <!-- <td>Status</td> -->
                                </tr>
                                <!-- Add more rows as needed -->
                            </tbody>
                        </table>
                        <br/><br/>

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
const { isLoggedIn } = storeToRefs(userStore);
const loading = ref(true);
const buttonClicked = ref(false);

const list = ref([]);
const errors = ref({});


const fetchData = async () => {
  loading.value = true;
  try {
    const response = await axios.get("/deposit/getWithMethodList");
    console.log("Response: ", response.data);
    list.value = response.data;
   
  } catch (error) {
    console.error("Error fetching data:", error);
  } finally{
    loading.value = false;
  }
}; 
 

const insertdata = reactive({
  name: "USDT TRC-20",
  account_number: "",
});

const submitForm = () => {
  buttonClicked.value = true;
  const formData = new FormData();
  formData.append("name", insertdata.name);
  formData.append("account_number", insertdata.account_number);
  const headers = {
    "Content-Type": "multipart/form-data",
  };
  axios
    .post("/deposit/addWithDrawMethod", formData, { headers })
    .then((res) => {
        fetchData()
      document.getElementById("formrest").reset();
      success_noti();
      router.push('/withdraw');
    })
    .catch((error) => {
      if (error.response && error.response.status === 422) {
        buttonClicked.value = false;
        errors.value = error.response.data.errors;


      } else {
        // Handle other types of errors here
        console.error("An error occurred:", error);
      }
    });
};

const success_noti = () => {
  const Toast = Swal.mixin({
    toast: true,
    position: "top-end",
    showConfirmButton: false,
    timer: 1000,
    timerProgressBar: true,
    didOpen: (toast) => {
      toast.onmouseenter = Swal.stopTimer;
      toast.onmouseleave = Swal.resumeTimer;
    },
  });
  Toast.fire({
    icon: "success",
    title: "Your request has been successfull.",
  });
};



onMounted(async () => {
    fetchData();
});




</script>

<style scoped>
.dash-balance {
  
    background-size: auto;
  background-size: cover;
  position: relative;
  overflow: hidden;
  padding: 10px 10px 10px;
}
</style>