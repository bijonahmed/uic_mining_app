<template>
  <div>
    <title>Wallet</title>

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
        <div class="loading-indicator" v-if="loading" style="text-align: center">
        <Loader />
      </div>
        <!-- Page content start -->
        <main class="margin mt-0">
          <div class="dash-balance">
            <div class="dash-content relative">
              <h3 class="w-text">My Wallet</h3>
               
            </div>
          </div>

          <section class="bal-section container">
            <div class="resources-card-wrapper">
              <div class="wallet-card mr-10 round">
                <div class="flex-column flex-md-row">
                  <h3 class="">My Assets</h3>
                  <p class="mb-0 font-weight-medium">
                    <i class="txt-green fa fa-arrow-up mr-10"></i>0.8224 BTc
                  </p>
                </div>
              </div>

              <div class="wallet-card ml-10">
                <div class="flex-column flex-md-row">
                  <h3 class="">Assets (USD)</h3>
                  <p class="mb-0 font-weight-medium">
                    <i class="txt-red fa fa-arrow-down mr-10"></i>{{ available_balance }}
                  </p>
                </div>
              </div>
            </div>
            <div class="resources-card-wrapper mt-15">
              <div class="wallet-card mr-10">
                <div class="flex-column flex-md-row">
                  <h3 class="">USDT Wallet</h3>
                  <nuxt-link to="/transaction-history"><p class="mb-0 font-weight-medium">
                    <i class="txt-red fa fa-arrow-down mr-10"></i>{{ depositamount }} USDT
                  </p></nuxt-link>
                </div>
              </div>

              <div class="wallet-card ml-10">
                <div class="flex-column flex-md-row">
                  <h3 class="">Dash Wallet</h3>
                  <p class="mb-0 font-weight-medium">
                    <i class="txt-green fa fa-arrow-up mr-10"></i>0 DASH
                  </p>
                </div>
              </div>
            </div>
          </section>

          <br />
          <div class="container">
            <div class="row">
              <div class="col-4"></div>
              <div class="col-4">
                <center>
                  <button class="btn btn-primary" type="button">Deposit</button>
                </center>

                <form @submit.prevent="submitForm" id="formrest">
                  <div class="mb-3">
                    <label for="amount" class="form-label">Amount</label>
                    <input type="text" class="form-control"   v-model="insertdata.deposit_amount" @keypress="isNumber($event)"/>
                    <span class="text-danger" v-if="errors.deposit_amount">{{ errors.deposit_amount[0] }}</span>
                    <span class="text-danger" v-if="errors.errors_amount">{{ errors.errors_amount[0] }}</span>
                  </div>
                  <div class="mb-3">
                    <label for="currency" class="form-label">Currency</label>
                    <select class="form-select" v-model="insertdata.payment_method">
                      <option value="USDT (TRC20)">USDT (TRC20)</option>
                    </select>
                    <span class="text-danger" v-if="errors.payment_method">{{ errors.payment_method[0] }}</span>
                    <img src="/assets/qrcode.png" alt="QR Code" />
                    <label>Input the Txid</label>
                    <input type="text" v-model="insertdata.trxId" class="form-control" />
                    <span class="text-danger" v-if="errors.trxId">{{ errors.trxId[0] }}</span>
                  </div>
                  <button type="submit" class="btn btn-primary" :disabled="buttonClicked">Submit</button>
                </form>
                <br />
                <br />
                <br />
                <br />
              </div>
              <div class="col-4"></div>
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

const errors_amount = ref('');
const depositamount = ref(0);
const available_balance = ref(0);

const errors = ref({});


const fetchData = async () => {
  loading.value = true;
  try {
    const response = await axios.get("/user/getBalance");
    console.log("Response: ", response.data);
    available_balance.value = response.data.available_balance;
    depositamount.value = response.data.deposit_amount;
  } catch (error) {
    console.error("Error fetching data:", error);
  } finally{
    loading.value = false;
  }
}; 

const isNumber = (evt) => {
    evt = evt ? evt : window.event;
    var charCode = evt.which ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode !== 46) {
        evt.preventDefault();
    } else {
        return true;
    }
};

const insertdata = reactive({
  deposit_amount: "",
  payment_method: "",
  trxId: "",
});

const submitForm = () => {
  buttonClicked.value = true;
  const formData = new FormData();
  formData.append("deposit_amount", insertdata.deposit_amount);
  formData.append("payment_method", insertdata.payment_method);
  formData.append("trxId", insertdata.trxId);
  const headers = {
    "Content-Type": "multipart/form-data",
  };
  axios
    .post("/deposit/depositRequest", formData, { headers })
    .then((res) => {
      document.getElementById("formrest").reset();
      success_noti();
      router.push('/success-deposit');
    })
    .catch((error) => {
      if (error.response && error.response.status === 422) {

        console.log("errors " + error.response.data.errors.deposit_amount);
        errors_amount.value =  error.response.data.errors.deposit_amount;
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
    title: "Your deposit has been successfull.",
  });
};



onMounted(async () => {
    fetchData();
});




</script>