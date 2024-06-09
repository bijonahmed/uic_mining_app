<template>
    <div>
        <title>Affiliate</title>

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
                            <h3 class="w-text">Affiliate System</h3>
                            <div class="notification">
                                <!-- <a href="#"><i class="fa fa-plus"></i></a> -->
                            </div>
                        </div>
                    </div>

                    <section class="bal-section container">
                        <div class="ref-card c1">
                            <div class="d-flex align-items-center">
                                <div class="d-flex flex-grow">
                                    <div class="mr-auto">
                                        <h1 class="b-val"> $1,249.03 </h1>
                                        <p class="g-text mb-10">Total Referal Earnings</p>
                                        <div class="badge badge-pill"> This month 18.98% <i
                                                class="txt-green fa fa-arrow-up ml-10"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section class="container">
                        <div id="content">
                            <h4 class="title-main">Advertisement</h4>
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBxKF1hUNn8ILM4glj_TmIMvlqCxRzGkHnGKczRwb4&s"
                                alt="ads" width="100%">
                        </div>
                    </section>

                    <section class="container refer mt-15">
                        <div id="cont">

                            <div id="content-body">
                                <div class="content-head purp">
                                    <div class="d-flex align-items-center">
                                        <div class="d-flex flex-grow">
                                            <div class="mr-auto">
                                                <h3 class="w-text mt-0 mb-0">Refer Fiends & Earn</h3>
                                                <p class="mb-0 g-text">Lorem ipsum dolor sit amet.</p>
                                            </div>
                                            <div class="ref-bouns">
                                                <h3 class="mt-0 mb-5">$20</h3>
                                                <span>Bouns</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="ref-content">
                                    <h4 class="mt-0">Your Referal Link</h4>
                                    <div class="form-row-group relative">
                                        <div class="form-row no-padding">
                                            <!-- <input type="text" readonly class="form-element" id="invite_link" v-model="intielink"> -->
                                            <strong id="invite_link" class="textToCopy"> {{ intielink }}</strong>
                                            <!-- <button type="button" @click="copyAddressToClipboard()"
                                                        class="btn_copy copyButton"><i
                                                            class="fa-solid fa-copy"></i></button> -->

                                            <a href="#" class="ref-copy" @click="copyAddressToClipboard()"><i class="fa fa-copy"></i></a>
                                        </div>
                                    </div>
                                    <h4>Share Referal Link</h4>
                                    <a href="https://www.facebook.com/" target="_blank" class="button circle block orange"><i class="fab fa-facebook mr-10"></i>
                                        Facebook</a>
                                    <a href="https://x.com/" target="_blank" class="button circle block blue"><i class="fab fa-twitter mr-10"></i>
                                        Twitter</a>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section class="container">
                        <div class="resources-card-wrapper">
                            <div class="ref-statistics mr-10">
                                <h2 style="color: #0a95ff;font-weight: 800;font-family: poppins;">Team 1</h2>
                                <div class="d-flex flex-column ml-md-2">
                                    <h4 class="mt-10 mb-5 ">{{ level_1 }} Members</h4>
                                    <small><nuxt-link to="/team/team-one-history" style="color:green">Check History</nuxt-link></small>

                                </div>
                            </div>
                            <div class="ref-statistics ml-10">
                                <h2 class="txt-green" style="font-weight: 800;font-family: poppins;">Team 2</h2>
                                <div class="d-flex flex-column ml-md-2">
                                    <h4 class="mt-10 mb-5 ">{{ level_2 }} Members</h4>
                                    <small><nuxt-link to="/team/team-two-history" style="color:green">Check History</nuxt-link></small>

                                </div>
                            </div>
                        </div>
                        <div class="resources-card-wrapper">
                            <div class="ref-statistics mr-10">
                                <h2 class="txt-yellow" style="font-weight: 800;font-family: poppins;">Team 3</h2>
                                <div class="d-flex flex-column ml-md-2">
                                    <h4 class="mt-10 mb-5 ">{{ level_3 }} Members</h4>
                                    <small><nuxt-link to="/team/team-three-history" style="color:green">Check History</nuxt-link></small>

                                </div>
                            </div>
                            <div class="ref-statistics ml-10">
                                <i class="fa fa-calculator txt-red" style="font-size: 40px;padding: 13px;"></i>
                                <div class="d-flex flex-column ml-md-2">
                                    <h4 class="mt-10 mb-5 ">{{ total }} Members</h4>
                                    <p class="text-muted font-weight-medium">Total Members</p>
                                </div>
                            </div>
                        </div>
                    </section>
                    <div class="col-md-12 adv" id="techyar-adv-cont" accesskey="27423529011101" lang="eng" data="10012">
                    </div>
                    <section class="container">
                        <h4 class="title-main mt-5">Recent Refered Members</h4>

                        <ul class="transaction-list list-unstyled" v-for="level in levels" :key="level.id">
                            <li>
                                <div class="d-flex align-items-center justify-content-between">
                                    <div class="d-flex align-items-normal">
                                        <span class="member-img"><img src="/assets/img/content/avatar/user-1.png"
                                                alt=""></span>
                                        <div class="ml-10">
                                     
                                            <small class="text-muted">Name <span
                                                class="txt-turquoise">{{ level.name }}</span></small><br>
                                            <small class="text-muted">Registered Date <span
                                                    class="txt-turquoise">{{ formatDate(level.created_at) }}</span></small><br>
                                            <small class="text-muted">UIC Address: {{ level.uic_address }}</small>
                                        </div>
                                    </div>
                                    
                                </div>
                            </li>
                            
                        </ul>
                        <br/><br/>
                    </section>
                    <!-- <SocialFooter /> -->
                </main>
                <!-- Page content end -->
            </div>
        </div>
    </div>
</template>


<script setup>
import { ref, reactive, onMounted } from 'vue';
import axios from 'axios';
import { useRouter } from 'vue-router';
import Swal from "sweetalert2";
const router = useRouter();
const loading = ref(false);
definePageMeta({
    middleware: 'is-logged-out',
})
import Sidebar from "~/layouts/Sidebar.vue";
import HeaderSecond from "~/layouts/HeaderSecond.vue";
import SocialFooter from "~/components/SocialFooter.vue";

const inviteCode = ref('');
const intielink = ref('');
const level_1 = ref('');
const level_2 = ref('');
const level_3 = ref('');
const total = ref('');
const levels = ref([]);

const formatDate = (dateString) => {
  const date = new Date(dateString);
  return date.toLocaleString('en-US', {
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
    // hour: '2-digit',
    // minute: '2-digit',
    // second: '2-digit',
    hour12: false
  });
}


const getInviteCode = async () => {
    try {
        const response = await axios.get(`/user/getInviteCode`);
        const setIntielink = window.location.origin + '/invite-code/?code=' + response.data.inviteCode;
        console.log("link : " + setIntielink);
        console.log("code : " + response.data.inviteCode);
        inviteCode.value = response.data.inviteCode;
        intielink.value = setIntielink;

    } catch (error) {
        console.error(error);
    }
};

const copycode = () => {
    // Get the text to copy
    const walletAddress = document.getElementById('invite_code').innerText;
    // Create a textarea element to temporarily hold the text
    const textarea = document.createElement('textarea');
    textarea.value = walletAddress;
    textarea.setAttribute('readonly', '');
    textarea.style.position = 'absolute';
    textarea.style.left = '-9999px'; // Move the textarea off-screen
    document.body.appendChild(textarea);
    textarea.select();
    document.execCommand('copy');
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
        }
    });

    Toast.fire({
        icon: "success",
        title: "Successfully copy"
    });
}

const copyAddressToClipboard = () => {
    // Get the text to copy
    const walletAddress = document.getElementById('invite_link').innerText;
    const textarea = document.createElement('textarea');
    textarea.value = walletAddress;
    textarea.setAttribute('readonly', '');
    textarea.style.position = 'absolute';
    textarea.style.left = '-9999px'; // Move the textarea off-screen
    document.body.appendChild(textarea);
    textarea.select();
    document.execCommand('copy');
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
        }
    });

    Toast.fire({
        icon: "success",
        title: "Successfully copy"
    });
}

const fetchLevelData = async () => {
  try {
    const response = await axios.get("/user/getLevelDetails");
    console.log("Response data:", response.data.level_1);
    // Assuming maximum_supply and total_supply are DOM elements or component state
    level_1.value   = response.data.level_1;
    level_2.value   = response.data.level_2;
    level_3.value   = response.data.level_3;
    total.value     = response.data.total;
    levels.value     = response.data.levels;
  } catch (error) {
    console.error("Error fetching data:", error);
  }
};


onMounted(async () => {
    getInviteCode();
    fetchLevelData();

});




</script>

<style>
.border-radius {
    border-radius: 30px;
    font-size: 10px;
    padding: 1px 10px;
    text-align: center;
}
</style>