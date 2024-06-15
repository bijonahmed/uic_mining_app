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
                  <h3 class="">UIC</h3>
                  <p class="mb-0 font-weight-medium">
                    <!-- <i class="txt-green fa fa-arrow-up mr-10"></i> -->
                    {{ mining_amount }} UIC<br />
                    <small><nuxt-link to="/show-uic-address">Show UIC Address</nuxt-link></small>
                  </p>
                </div>
              </div>

              <div class="wallet-card ml-10">
                <div class="flex-column flex-md-row">
                  <h3 class="">Airdrop</h3>
                  <p class="mb-0 font-weight-medium">
                    <!-- <i class="txt-red fa fa-arrow-down mr-10"></i> -->
                    {{ available_balance }} UIC
                  </p>
                </div>
              </div>
            </div>
            <div class="resources-card-wrapper mt-15">
              <div class="wallet-card mr-10">
                <div class="flex-column flex-md-row">
                  <h3 class="">USDT(TRC20)</h3>
                  <nuxt-link to="/transaction-history">
                    <p class="mb-0 font-weight-medium">
                      {{ usdt_amount }} USDT
                    </p>
                  </nuxt-link>
                </div>
              </div>



              <form @submit.prevent="submitFormSwap" id="formrestsweap">
              <div class="wallet-card ml-10">
                <div class="flex-column flex-md-row">
                  <strong class="text-center d-flex justify-content-center"><u>SWAP</u></strong>
                  <div class="d-flex align-items-end mb-2">
                    <!-- <input type="number" v-model="amount1" class="amount-input" placeholder="USDT"> -->
                    <div class="w-100">
                      <label for="" class="w-100 text-left">From</label>

                      <select class="form-control mb-2" v-model="wallet_type_frm"
                        @change="checkWalletFrm($event.target.value)">
                        <option class="option" value="2">USDT</option>
                        <option selected class="option" value="1">UIC</option>
                      </select>
                    </div>
                    <div class="swipe-button">
                      <button @click="swapAmounts" class="mb-3" style="background-color: transparent; border: none">
                        <i class="fa-solid fa-right-left"></i>
                      </button>
                    </div>
                    <div class="w-100">
                      <label for="" class="w-100 text-right">To</label>
                      <select class="form-control mb-2" v-model="wallet_type_to"
                        @change="checkWalletTo($event.target.value)">
                        <option class="option" value="2">USDT</option>
                        <option class="option" value="1">UIC</option>
                      </select>
                    </div>
                  </div>
                  <div class="d-fle align-items-center mb-2">
                    <input type="text" placeholder="0.00" v-model="swap_amount" class="form-control"  @keyup="checkBalance" @keypress="isNumber($event)" />
                      <span class="text-danger" v-if="errors.swap_amount">{{ errors.swap_amount[0] }}</span>

                    <p style="font-size: 10px; text-align: start">

                      <span v-if="wallet_type_to==1">
                        Available balance: {{ availablebalance }} USDT
                      </span>
                      <span v-else>
                        Available balance: {{ availablebalance }} UIC
                      </span>
                    </p>
                    <p style="font-size: 10px; text-align: start">
                      Current Price UIC: {{ currentPrice }} USDT
                    </p>
                    <p style="font-size: 10px; text-align: start">
                      Provider fee : 00.00 <br />
                      <span style="font-size: 9px" class="text-danger">(Third party fee factored into every quote for
                        facilitationg the transection between you and the swap
                        provider. This fee is not paid to this platform.)</span>
                    </p>
                  </div>

                  <button class="btn btn-primary text-center m-auto mt-3 w-100" id="confirm_swap" type="submit" :disabled="buttonClicked">
                    Confirm Swap
                  </button>
                </div>
              </div>
            </form>

              <!-- <div class="wallet-card ml-10">
                <div class="flex-column flex-md-row">
                  <h3 class="">Dash Wallet</h3>
                  <p class="mb-0 font-weight-medium">
                    <i class="txt-green fa fa-arrow-up mr-10"></i>0 DASH
                  </p>
                </div>
              </div> -->
            </div>
          </section>

          <br />
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <strong class="text-center d-flex"><u class="text-center m-auto">DEPOSIT</u></strong>

                <form @submit.prevent="submitForm" id="formrest">
                  <div class="mb-3">
                    <label for="amount" class="form-label">Amount</label>
                    <input type="text" class="form-control" v-model="insertdata.deposit_amount"
                      @keypress="isNumber($event)" />
                    <span class="text-danger" v-if="errors.deposit_amount">{{
                      errors.deposit_amount[0]
                    }}</span>
                    <span class="text-danger" v-if="errors.errors_amount">{{
                      errors.errors_amount[0]
                    }}</span>
                  </div>
                  <div class="mb-3">
                    <label for="currency" class="form-label">Currency</label>
                    <select class="form-select form-control" v-model="insertdata.payment_method">
                      <option value="USDT (TRC20)">USDT (TRC20)</option>
                    </select>
                    <span class="text-danger" v-if="errors.payment_method">{{
                      errors.payment_method[0]
                    }}</span>
                    <!-- <img src="/assets/qrcode.png" alt="QR Code" style="height: 100px; margin: 20px auto; display: flex;" />  -->
                    <img :src="qrCodeUrl" alt="QR Code" v-if="qrCodeUrl"
                      style="height: 100px; margin: 20px auto; display: flex" />
                    <br />
                    <br />

                    <div class="form-row-group relative mb-2">
                      <div class="form-row no-padding" style="padding: 10px 20px">
                        <strong id="invite_link" class="textToCopy">
                          {{ wallet_address }}</strong>
                        <a href="#" class="ref-copy" @click="copyAddressToClipboard()"><i class="fa fa-copy"></i></a>
                      </div>
                    </div>

                    <label>Input the Txid</label>
                    <input type="text" v-model="insertdata.trxId" class="form-control" />
                    <span class="text-danger" v-if="errors.trxId">{{
                      errors.trxId[0]
                    }}</span>
                  </div>
                  <button type="submit" class="btn btn-primary" :disabled="buttonClicked">
                    Submit
                  </button>
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
import QRCode from "qrcode";
import { ref, watchEffect } from "vue";
import { useUserStore } from "~~/stores/user";
import { storeToRefs } from "pinia";
import axios from "axios";

const userStore = useUserStore();
const router = useRouter();
const { isLoggedIn } = storeToRefs(userStore);
const loading = ref(true);
const buttonClicked = ref(false);

const errors_amount = ref("");
const usdt_amount = ref(0);
const available_balance = ref(0);
const mining_amount = ref(0);
const uicAddress = ref(null);
const qrCodeUrl = ref(null);
const wallet_address = ref(null);
const wallet_type_frm = ref(2);
const wallet_type_to = ref(1);
const availablebalance = ref(0);
const swap_amount = ref('');
const currentPrice = ref(0);
const errors = ref({});

const amount1 = ref(null);
const amount2 = ref(null);

const swapAmounts = () => {
  const temp = amount1.value;
  amount1.value = amount2.value;
  amount2.value = temp;
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
      router.push("/success");
    })
    .catch((error) => {
      if (error.response && error.response.status === 422) {
        console.log("errors " + error.response.data.errors.deposit_amount);
        errors_amount.value = error.response.data.errors.deposit_amount;
        errors.value = error.response.data.errors;
      } else {
        // Handle other types of errors here
        console.error("An error occurred:", error);
      }
    });
};


const submitFormSwap = () => {

  buttonClicked.value = true;
  const formData = new FormData();
  formData.append("wallet_type_frm", wallet_type_frm.value);
  formData.append("wallet_type_to", wallet_type_to.value);
  formData.append("swap_amount", swap_amount.value);

  const headers = {
    "Content-Type": "multipart/form-data",
  };
  axios.post("/user/sweapCalculation", formData, { headers })
    .then((res) => {
        fetchData()
      document.getElementById("formrestsweap").reset();
      success_noti();
      router.push('/success');
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

const checkBalance = () => {

  const requestAmount = swap_amount.value;
  const wallettype = wallet_type_frm.value;

  if (wallettype === '1') { //from 1=uic
    const miningamount = mining_amount.value;
    console.log(`UIC: ${miningamount} requestAmount: ${requestAmount}`);
    if (requestAmount > miningamount) {
      error_noti();
      console.log("===" + 'You have no sufficiant UIC  balance');
      $('#confirm_swap').attr('disabled', 'disabled').addClass('btn-disabled');
    } else {
      $('#confirm_swap').removeAttr('disabled').removeClass('btn-disabled');
    }
  }

  if (wallettype === 2) { //2=usdt 
    const usdtamount = usdt_amount.value;
    console.log(`USDT: ${usdtamount} requestAmount: ${requestAmount}`);
    if (requestAmount > usdtamount) {
      error_noti();
      $('#confirm_swap').attr('disabled', 'disabled').addClass('btn-disabled');
      console.log("===" + 'You have no sufficiant USDT balance');
    } else {
      $('#confirm_swap').removeAttr('disabled').removeClass('btn-disabled');
    }
  }

}



const checkWalletFrm = async (wallet_type) => {

  swap_amount.value = '';
  const wallettype = wallet_type_frm.value;
  if (wallettype === '1') {
    wallet_type_to.value = '2';
  }

  if (wallettype === '2') {
    wallet_type_to.value = '1'; 
  }

  loading.value = true;
  try {
    const response = await axios.get("/user/checkWalletType", {
      params: {
        wallet_type: wallet_type,
      },
    });
    availablebalance.value = response.data.amount;
  } catch (error) {
    console.error("Error fetching data:", error);
  } finally {
    loading.value = false;
  }
};

const checkWalletTo = async (wallet_type) => {

  const wallettype = wallet_type_to.value;
  if (wallettype === '1') {
    wallet_type_frm.value = '2'; // Set to USDT if UIC is selected
  }

  if (wallettype === '2') {
    wallet_type_frm.value = '1'; // Set to USDT if UIC is selected
  }

  loading.value = true;
  try {
    const response = await axios.get("/user/checkWalletType", {
      params: {
        wallet_type: wallet_type,
      },
    });
    availablebalance.value = response.data.amount;
  } catch (error) {
    console.error("Error fetching data:", error);
  } finally {
    loading.value = false;
  }
};

const defaultLoadingWalletType = async (wallet_type) => {
  loading.value = true;
  try {
    const response = await axios.get("/user/checkWalletType", {
      params: {
        wallet_type: wallet_type,
      },
    });
    availablebalance.value = response.data.amount;
  } catch (error) {
    console.error("Error fetching data:", error);
  } finally {
    loading.value = false;
  }
};

const copyAddressToClipboard = () => {
  // Get the text to copy
  const walletAddress = document.getElementById("invite_link").innerText;
  const textarea = document.createElement("textarea");
  textarea.value = walletAddress;
  textarea.setAttribute("readonly", "");
  textarea.style.position = "absolute";
  textarea.style.left = "-9999px"; // Move the textarea off-screen
  document.body.appendChild(textarea);
  textarea.select();
  document.execCommand("copy");
  document.body.removeChild(textarea);
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
    title: "Successfully copy",
  });
};

const fetchData = async () => {
  loading.value = true;
  try {
    const response = await axios.get("/user/getBalance");
    available_balance.value = response.data.available_balance;
    usdt_amount.value       = response.data.usdt_amount;
    mining_amount.value     = response.data.mining_amount;
    wallet_address.value    = response.data.wallet_address;
    currentPrice.value      = response.data.currentPrice;

    generateQrCode();
  } catch (error) {
    console.error("Error fetching data:", error);
  } finally {
    loading.value = false;
  }
};

// Generate QR code based on uicAddress
const generateQrCode = async () => {
  try {
    const address = wallet_address.value;
    if (!address) {
      console.error("Wallet address is empty");
      return;
    }
    qrCodeUrl.value = await QRCode.toDataURL(address, {
      errorCorrectionLevel: "H",
    });
  } catch (error) {
    console.error("Error generating QR code:", error);
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


 

const error_noti = () => {
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
    icon: "error",
    title: "You have no sufficiant UIC  balance.",
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
  defaultLoadingWalletType(2);
  fetchData();
  generateQrCode();
});
</script>
<style scoped>
.btn-disabled {
  background-color: grey;
  pointer-events: none;
}
</style>