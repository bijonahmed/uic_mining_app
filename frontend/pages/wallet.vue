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
        <!-- Page content start -->
        <main class="margin mt-0">
          <div class="dash-balance">
            <div class="dash-content relative">
              <h3 class="w-text">My Wallet</h3>
              <div class="notification">
                <a href="#"><i class="fa fa-plus"></i></a>
              </div>
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
                  <h3 class="">Ripple Wallet</h3>
                  <p class="mb-0 font-weight-medium">
                    <i class="txt-red fa fa-arrow-down mr-10"></i>0 XRP
                  </p>
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
          
         <br/>
          <div class="container">
            <div class="row">
              <div class="col-4"></div>
              <div class="col-4">
                <center><button class="btn btn-primary" type="button">Deposit</button></center>

                <form @submit.prevent="submitForm">
      <div class="mb-3">
        <label for="amount" class="form-label">Amount</label>
        <input type="text" class="form-control" id="amount" v-model="amount">
      </div>
      <div class="mb-3">
        <label for="currency" class="form-label">Currency</label>
        <select class="form-select" id="currency" v-model="currency">
          <option value="USDT (TRC20)">USDT (TRC20)</option>
          <!-- Add more currency options here if needed -->
        </select>

        <img src="/assets/qrcode.png" alt="QR Code">
        
        <label>Input the Txid</label>
        <input type="text" v-model="name" class="form-control"/>

      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
    
    </form>
   
    <br/> <br/>  <br/> <br/>
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

import { ref, watchEffect } from "vue";
import { useUserStore } from "~~/stores/user";
import { storeToRefs } from "pinia";
import axios from "axios";
const userStore = useUserStore();
const { isLoggedIn } = storeToRefs(userStore);
const loading = ref(true);
const maximum_supply = ref(0);
const total_supply = ref(0);
const available_balance = ref(0);

const fetchData = async () => {
  try {
    const response = await axios.get("/user/getBalance");
    console.log("Response available_balance", response.data.available_balance);
    available_balance.value = response.data.available_balance;

  } catch (error) {
    console.error("Error fetching data:", error);
  }
};

fetchData();







</script>