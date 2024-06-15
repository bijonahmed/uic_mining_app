<template>
    <div>
        <title>UIC Address</title>
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
                            <h3 class="w-text">UIC Address</h3>
                            <div class="notification"></div>
                        </div>
                    </div>

                    <div class="container">
                        <div class="loading-indicator" v-if="loading" style="text-align: center">
                            <BulkLoader />
                        </div>

                        <div class="ref-content">
                                    <h4 class="mt-0 text-center">Your UIC Address</h4>
                                    <img :src="qrCodeUrl" alt="QR Code" v-if="qrCodeUrl" style="height: 100px; margin: 5px auto; display: flex;"/> <br>
                                    <div class="form-row-group relative">                                        
                                        <div class="form-row no-padding" style="padding: 10px 20px;">
                                            <strong id="invite_link" class="textToCopy"> {{ uicAddress }}</strong>
                                            <a href="#" class="ref-copy"   @click="copyAddressToClipboard()"><i class="fa fa-copy"></i></a>
                                        </div>
                                    </div>
                                  
                                </div>
                    </div>
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
import QRCode from 'qrcode'
const router = useRouter();
const loading = ref(false);
definePageMeta({
    middleware: 'is-logged-out',
})
import Sidebar from "~/layouts/Sidebar.vue";
import HeaderSecond from "~/layouts/HeaderSecond.vue";
import SocialFooter from "~/components/SocialFooter.vue";

const inviteCode = ref('');
const uicAddress = ref(null);
const qrCodeUrl = ref(null)

const getInviteCode = async () => {
    try {
        const response = await axios.get(`/user/getInviteCode`);
        const setUICaddress =response.data.uic_address;
        inviteCode.value = response.data.uic_address;
        uicAddress.value = response.data.uic_address;
        generateQrCode();
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
// Generate QR code based on uicAddress
const generateQrCode = async () => {
  try {
    const inv_Code = uicAddress.value
    if (!inv_Code) {
      console.error('UIC address is empty')
      return
    }
    qrCodeUrl.value = await QRCode.toDataURL(inv_Code, { errorCorrectionLevel: 'H' })
  } catch (error) {
    console.error('Error generating QR code:', error)
  }
}

 


onMounted(async () => {
    getInviteCode();
    generateQrCode();

});




</script>

<style>
.border-radius {
    border-radius: 30px;
    font-size: 10px;
    padding: 1px 10px;
    text-align: center;
}
.ref-copy{
    padding: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #fff;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
}
.ref-copy i{
    color: #fff;
}
</style>