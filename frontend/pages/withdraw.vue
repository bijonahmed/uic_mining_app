<template>
    <div>
        <title>Withdraw</title>

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
                            <h3 class="w-text">Withdrawl Request</h3>
                            <div class="notification">
                                <!-- <a href="#"><i class="fa fa-plus"></i></a> -->
                            </div>
                        </div>
                    </div>

                    <section class="bal-section container">
                        <div id="content">
                            <center>
                                <div class="loading-indicator" v-if="loading" style="text-align: center">
                                    <Loader />
                                </div>
                            </center>
                            <div id="content-body">
                                <form @submit.prevent="submitForm" id="formrest">
                                    <section class="wallets-list container">
                                        <div class="row">
                                            <div class="col-6">

                                                <h4 class="title-main">Place Withdrawl</h4>
                                            </div>

                                            <div class="col-6">
                                                <br />
                                                <div align="right">
                                                    <nuxt-link to="/add-withdraw-method"> Add Method </nuxt-link>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="wallet-address">
                                            <h3 class="w-text mb-30 mt-0">Withdrawl</h3>

                                            <div class="txt-left">
                                                <label class="g-text">Select Payment Method</label>
                                                <div class="form-row-group with-icons">
                                                    <div class="form-row no-padding">
                                                        <img src="/assets/img/content/1.png" class="icon" alt="" />
                                                       
                                                        <select class="form-element" v-model="insertdata.withdrawal_method"  @change="handleChange($event)">
                                                            <option value="">Select</option>
                                                            <option v-for="method in list" :key="method.id" :value="method.id">
                                                                    {{ method.name }}
                                                            </option>
                                                        </select>
                                                        <span class="text-danger" v-if="errors.withdrawal_method">{{
                                                            errors.withdrawal_method[0] }}</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-mini-divider"></div>

                                            <div class="txt-left">
                                                <label class="g-text">Account Number</label>
                                                <div class="form-row-group with-icons">
                                                    <div class="form-row no-padding">
                                                        <img src="/assets/img/content/2.png" class="icon" alt="" />
                                                        <input type="text" class="form-element" v-model="insertdata.account_number" readonly/>
                                                        <span class="text-danger" v-if="errors.account_number">{{
                                                            errors.account_number[0] }}</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-mini-divider"></div>

                                            <div class="txt-left">
                                                <label class="g-text">Password</label>
                                                <div class="form-row-group with-icons">
                                                    <div class="form-row no-padding">
                                                        <img src="/assets/img/content/3.png" class="icon" alt="" />
                                                        <input type="password" class="form-element"
                                                            v-model="insertdata.confirm_password" />
                                                        <span class="text-danger" v-if="errors.confirm_password">{{
                                                            errors.confirm_password[0] }}</span>

                                                        <span class="text-danger" v-if="errors.password_wrong">{{
                                                            errors.password_wrong[0] }}</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-mini-divider"></div>

                                            <div class="txt-left calc-crr">
                                                <label class="g-text">USD Amount</label>
                                                <div class="form-row-group with-icons">
                                                    <div class="form-row no-padding">
                                                        <img src="/assets/img/content/2.png" class="icon" alt="" />
                                                        <input type="text" class="form-element"
                                                            v-model="insertdata.usd_amount"
                                                            @keypress="isNumber($event)" />
                                                        <span class="text-danger" v-if="errors.usd_amount">{{
                                                            errors.usd_amount[0] }}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="txt-left calc-crr-mid">
                                                <img src="/assets/img/content/exchange.png" class="mt-15" alt="" />
                                            </div>
                                            <div class="txt-left calc-crr">
                                                <label class="g-text">UIC Amount</label>
                                                <div class="form-row-group with-icons">
                                                    <div class="form-row no-padding">
                                                        <img src="/assets/img/content/2.png" class="icon" alt="" />
                                                        <input type="text" class="form-element"
                                                            v-model="insertdata.uic_amount"
                                                            @keypress="isNumber($event)" />
                                                        <span class="text-danger" v-if="errors.uic_amount">{{
                                                            errors.uic_amount[0] }}</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-mini-divider"></div>

                                            <div>
                                                <button type="submit" class="button circle block yellow"
                                                    :disabled="buttonClicked">
                                                    Request Withdrawl
                                                </button>
                                            </div>
                                        </div>
                                    </section>
                                </form>

                                <section class="container">
                                    <h4 class="title-main">Withdrawl History</h4>
                                    <table class="table table-bordered table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>Date</th>
                                                <th>Payment Method</th>
                                                <th>USD Amount</th>
                                                <th>UIC Amount</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="transaction in withdrawData" :key="transaction.id">
                                                <td>{{ transaction.created_at }}</td>
                                                <td>{{ transaction.payment_method }}</td>

                                                <td>{{ transaction.usd_amount }}</td>
                                                <td>{{ transaction.uic_amount }}</td>
                                                <td>
                                                    <span v-if="transaction.status == 0"
                                                        style="color: blue; font-weight: bold">{{ transaction.wStatus
                                                        }}</span>
                                                    <span v-if="transaction.status == 1"
                                                        style="color: green; font-weight: bold">{{ transaction.wStatus
                                                        }}</span>
                                                    <span v-if="transaction.status == 2"
                                                        style="color: red; font-weight: bold">{{ transaction.wStatus
                                                        }}</span>
                                                </td>
                                            </tr>
                                            <!-- Add more rows as needed -->
                                        </tbody>
                                    </table>
                                    <br /><br /><br /><br /><br /><br />
                                </section>
                            </div>
                        </div>
                    </section>
                </main>
                <!-- Page content end -->
            </div>
        </div>
    </div>
</template>

<script setup>
import Sidebar from "~/layouts/Sidebar.vue";
import HeaderSecond from "~/layouts/HeaderSecond.vue";
import SocialFooter from "~/components/SocialFooter.vue";

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

const password_wrong = ref("");
const depositamount = ref(0);
const withdrawData = ref([]);
const list = ref([]);

const errors = ref({});

// Handle the change event
const handleChange = async (event)  => {
  const withmethodId = event.target.value
  console.log('Selected method name:', withmethodId);

  const response = await axios.get('/deposit/getWithMethodRow', {
      params: {
        id: withmethodId,
      }
    });
   insertdata.account_number= response.data.account_number;

}

const fetchwithDrawlMethod = async () => {
    loading.value = true;
    try {
        const response = await axios.get("/deposit/getWithMethodList");
        list.value = response.data;
    } catch (error) {
        console.error("Error fetching data:", error);
    } finally {
        loading.value = false;
    }
};


const fetchData = async () => {
    loading.value = true;
    try {
        const response = await axios.get("/deposit/getWithdrawRequest");
        withdrawData.value = response.data;
    } catch (error) {
        console.error("Error fetching data:", error);
    } finally {
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
    withdrawal_method: "",
    account_number: "",
    confirm_password: "",
    usd_amount: "",
    uic_amount: "",
});

const submitForm = () => {
    // buttonClicked.value = true;
    const formData = new FormData();
    formData.append("withdrawal_method", insertdata.withdrawal_method);
    formData.append("account_number", insertdata.account_number);
    formData.append("confirm_password", insertdata.confirm_password);
    formData.append("usd_amount", insertdata.usd_amount);
    formData.append("uic_amount", insertdata.uic_amount);

    const headers = {
        "Content-Type": "multipart/form-data",
    };
    axios
        .post("/deposit/withdrawRequest", formData, { headers })
        .then((res) => {
            buttonClicked.value = false;
            document.getElementById("formrest").reset();
            success_noti();
            router.push("/success");
        })
        .catch((error) => {
            if (error.response && error.response.status === 422) {
                console.log("errors " + error.response.data.errors.deposit_amount);
                password_wrong.value = error.response.data.errors.password_wrong;
                errors.value = error.response.data.errors;
                loading.value = false;
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
    fetchwithDrawlMethod();
});
</script>