<template>
    <div>
        <title>Send Received</title>

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
                            <h3 class="w-text">Send/Receive</h3>
                            <div class="notification">
                                <!-- <a href="#"><i class="fa fa-plus"></i></a> -->
                            </div>
                        </div>
                    </div>

                    <section class="bal-section container">
                        <div id="content">

                            <div id="content-body">
                                <form @submit.prevent="submitForm" id="formrest">
                                    <section class="wallets-list container">

                                        <div class="wallet-address">
                                            <h3 class="w-text mb-30 mt-0">Send currency</h3>
                                            <div class="loading-indicator" v-if="loading" style="text-align: center">
                                                <Loader />
                                            </div>
                                            <div class="txt-left">
                                                <label class="g-text">Reciver UIC Address</label>
                                                <div class="form-row-group with-icons">
                                                    <div class="form-row no-padding">
                                                        <img src="/assets/img/content/2.png" class="icon" alt="">
                                                        <input type="text" class="form-element"
                                                            v-model="insertdata.receiver_uic_address"
                                                            @keyup="handleAddress">
                                                        <span class="text-danger" v-if="errors.receiver_uic_address">{{
                                                            errors.receiver_uic_address[0] }}</span>
                                                        <span class="text-danger"
                                                            v-if="errors.invlaid_uic_address">{{ errors.invlaid_uic_address[0]
                                                            }}</span>

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-mini-divider"></div>

                                            <div class="txt-left">
                                                <label class="g-text">Username</label>
                                                <div class="form-row-group with-icons">
                                                    <div class="form-row no-padding">
                                                        <img src="/assets/img/content/2.png" class="icon" alt="">
                                                        <input type="text" class="form-element"
                                                            v-model="insertdata.receiver_name" readonly>
                                                        <span class="text-danger" v-if="errors.receiver_name">{{
                                                            errors.receiver_name[0] }}</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-mini-divider"></div>

                                            <div class="txt-left">
                                                <label class="g-text">Password</label>
                                                <div class="form-row-group with-icons">
                                                    <div class="form-row no-padding">
                                                        <img src="/assets/img/content/3.png" class="icon" alt="">
                                                        <input type="password" class="form-element"
                                                            v-model="insertdata.password">
                                                        <span class="text-danger" v-if="errors.password">{{
                                                            errors.password[0] }}</span>
                                                        <span class="text-danger"
                                                            v-if="errors.password_wrong">{{ errors.password_wrong[0]
                                                            }}</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-mini-divider"></div>

                                            <div class="txt-left calc-crr">
                                                <label class="g-text">Select Wallet</label>
                                                <div class="form-row-group with-icons">
                                                    <div class="form-row no-padding">
                                                        <img src="/assets/img/content/2.png" class="icon" alt="">

                                                        <select class="form-element" v-model="insertdata.wallet_type"
                                                            @change="checkWallet($event.target.value)">
                                                            <option value="">Select</option>
                                                            <option value="1">UIC</option>
                                                            <option value="2">USDT</option>
                                                        </select>
                                                        <span class="text-danger" v-if="errors.wallet_type">{{
                                                            errors.wallet_type[0] }}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="txt-left calc-crr-mid">
                                                <img src="/assets/img/content/exchange.png" class="mt-15" alt="">
                                            </div>
                                            <div class="txt-left calc-crr">
                                                <label class="g-text">Amount</label>
                                                <div class="form-row-group with-icons">
                                                    <div class="form-row no-padding">
                                                        <img src="/assets/img/content/2.png" class="icon" alt="">
                                                        <input type="text" class="form-element" placeholder="0.0001"
                                                            v-model="insertdata.amount" @keypress="isNumber($event)">
                                                        <span class="text-danger" v-if="errors.amount">{{
                                                            errors.amount[0] }}</span>
                                                        <span class="text-danger" v-if="errors.error_amount">{{
                                                            errors.error_amount[0] }}</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-mini-divider"></div>

                                            <div>
                                                <button type="submit" class="btn btn-primary"
                                                    :disabled="buttonClicked">Send</button>
                                            </div>

                                        </div>


                                    </section>
                                </form>

                                <section class="container">
                                    <h4 class="title-main">Easy Crypto Trading</h4>
                                    <div class="resources-card-wrapper mt-15">
                                        <a class='buy-card mr-10' href='#'>
                                            <div class="flex-column flex-md-row">
                                                <img src="/assets/img/content/p1.png" alt="">
                                                <h4>Total Sent</h4>
                                                <p class="g-text mb-0 font-weight-medium">{{ total_send }}$ Has Been
                                                    Sent in Last 30
                                                    Days. </p>
                                            </div>
                                        </a>

                                        <a class='buy-card ml-10' href='#'>
                                            <div class="flex-column flex-md-row">
                                                <img src="/assets/img/content/p2.png" alt="">
                                                <h4>Total Receive</h4>
                                                <p class="g-text mb-0 font-weight-medium">{{ total_received }}$ Has
                                                    Received in Last 30
                                                    Days. </p>
                                            </div>
                                        </a>

                                    </div>
                                </section>


                                <section class="container">
                                    <h4 class="title-main">Recent Transactions</h4>
                                    <ul class="transaction-list list-unstyled">
                                        <li v-for="val in list" :key="val.id">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <div class="d-flex align-items-center">
                                                    <img class="img-xs" src="/assets/img/content/s2.png"
                                                        alt="coin image">
                                                    <div class="ml-10">
                                                        <h4 class="coin-name">{{ val.receiver_name }}</h4>
                                                        <small class="text-muted"><span class="ml-10">{{ val.created_at
                                                                }}</span></small>
                                                    </div>
                                                </div>
                                                <div>
                                                    <small class="d-block mb-0 txt-red">

                                                        <span v-if="val.wallet_type == 1">{{ val.amount }} UIC</span>
                                                        <span v-if="val.wallet_type == 2">{{ val.amount }} USDT</span>


                                                    </small>

                                                </div>
                                            </div>
                                        </li>

                                    </ul>
                                </section>

                                <footer>
                                    <div class="container">

                                    </div>
                                </footer>
                            </div>
                        </div>
                    </section>
                    <SocialFooter />
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
const password_wrong = ref("");
const invlaid_uic_address = ref("");
const error_amount = ref("");
const total_send = ref(0);
const total_received = ref(0);
const list = ref([]);
const errors = ref({});

const checkWallet = async (wallet_type) => {
    const response = await axios.get('/user/checkWalletType', {
        params: {
            wallet_type: wallet_type,
        }
    });
    insertdata.amount = response.data.amount;

}

const isNumber = (evt) => {
    evt = evt ? evt : window.event;
    var charCode = evt.which ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode !== 46) {
        evt.preventDefault();
    } else {
        return true;
    }
};


const handleAddress = async () => {
    loading.value = true;
    try {
        const receiver_uic_address = insertdata.receiver_uic_address;
        const response = await axios.get('/user/checkUicAddress', {
            params: {
                uic_address: receiver_uic_address,
            }
        });

        if (response.data.status == 0) {
            error_noti();
        } else {
            insertdata.receiver_name = response.data.response.name;
            insertdata.receiver_user_id = response.data.response.id;
        }
    } catch (error) {
        console.error(error);  // Log the error for debugging
        error_noti();  // Notify the user about the error
    } finally {
        loading.value = false;
    }


}

const fetchData = async () => {
    loading.value = true;
    try {
        const response = await axios.get("/deposit/getSendReceived");
        total_send.value = response.data.total_send;
        total_received.value = response.data.total_received;
        list.value = response.data.history;

    } catch (error) {
        console.error("Error fetching data:", error);
    } finally {
        loading.value = false;
    }
};


const insertdata = reactive({
    receiver_user_id: '',
    receiver_uic_address: "",
    receiver_name: "",
    password: "",
    wallet_type: "",
    amount: "",

});

const submitForm = () => {
    //buttonClicked.value = true;
    const formData = new FormData();
    formData.append("receiver_user_id", insertdata.receiver_user_id);
    formData.append("receiver_uic_address", insertdata.receiver_uic_address);
    formData.append("receiver_name", insertdata.receiver_name);
    formData.append("receiver_name", insertdata.receiver_name);
    formData.append("password", insertdata.password);
    formData.append("wallet_type", insertdata.wallet_type);
    formData.append("amount", insertdata.amount);

    const headers = {
        "Content-Type": "multipart/form-data",
    };
    axios.post("/deposit/sendReciverBuySell", formData, { headers })
        .then((res) => {
            fetchData()
            document.getElementById("formrest").reset();
            success_noti();
            router.push('/success');
        })
        .catch((error) => {
            if (error.response && error.response.status === 422) {
                //  buttonClicked.value = false;
                password_wrong.value = error.response.data.errors.password_wrong;
                invlaid_uic_address.value = error.response.data.errors.invlaid_uic_address;
                error_amount.value = error.response.data.errors.error_amount;
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
        title: "Sorry your UIC Address Invalid.",
    });
};

onMounted(async () => {
    fetchData();
});

</script>
<style>
@media(max-width: 768px) {
    .buy-card {
        display: block;
        width: 100%;
        margin: 10px 0px;
    }
}
</style>