<template>
  <div>
    <title>Signup</title>

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
        <!-- <Header/> -->
        <!-- Footer menu -->
        <Footer />
        <!-- Page content start -->
        <main class="margin mt-0">
          <div class="dash-balance">
            <div class="dash-content relative">
              <h3 class="w-text">Signup</h3>
              <div class="notification">

              </div>
            </div>
          </div>

          <section class="bal-section container">
            <div class="container">
              <div class="form-divider"></div>


              <form class="mt-12" @submit.prevent="register()">

                <div class="alert alert-success" v-if="showmessages" style="text-align: center; font-size: 12px;">{{ showmessages }}</div>



                <div class="form-row-group with-icons">

                  

                <div class="form-row no-padding">
                    <i class="fa fa-user"></i>
                    <input type="text" name="name" class="form-element" placeholder="User name" v-model="name">
                    <span class="text-danger" v-if="errors.name">{{ errors.name[0] }}</span>
                  </div>


                  <div class="form-row no-padding">
                    <i class="fa-brands fa-whatsapp"></i>
                    <input type="text" name="phone" class="form-element" placeholder="Whatsapp" v-model="phone_number" @input="filterNumericInput">
                    <span class="text-danger" v-if="errors.phone_number">{{ errors.phone_number[0] }}</span>
                  </div>



                  <div class="form-row no-padding">
                    <i class="fa fa-envelope"></i>
                    <input type="email" name="Email" class="form-element" placeholder="Email" v-model="email">
                    <span class="text-danger" v-if="errors.email">{{ errors.email[0] }}</span>
                  </div>
                  <div class="form-row no-padding">
                    <i class="fa fa-lock"></i>
                    <input type="password" name="Password" class="form-element" placeholder="Password"
                      v-model="password">
                    <span class="text-danger" v-if="errors.password">{{ errors.password[0] }}</span>
                  </div>
                  <div class="form-row no-padding">
                    <i class="fa fa-lock"></i>
                    <input type="password" name="rePassword" class="form-element" placeholder="Confirm Password"
                       v-model="confirmPassword">

                    <span class="text-danger" v-if="errors.confirmPassword">{{ errors.confirmPassword[0]
                      }}</span>
                  </div>
                  <div class="form-row no-padding">
                    <i class="fa fa-link"></i>
                    <input type="text" name="Invite-Code" class="form-element" placeholder="Invitation Code" disabled v-model="inviteCode">
                    <span class="text-danger" v-if="errors.inviteCode">{{ errors.inviteCode[0] }}</span>
                  </div>
                </div>

                <div class="form-divider"></div>

                <div class="form-row">
                  <!-- <a href="#" class="button circle block orange">Sign Up</a> :disabled="loading"-->
                  <button class="button circle block orange" type="submit">Sign up
                                <span v-if="loading">Loading...</span>
                            </button>
                </div>

                <div class="form-row txt-center mt-15">
                  Already have an account? <nuxt-link to="/login" data-loader='show'>Login</nuxt-link>
                </div>
              </form>

            </div>

          </section>


        </main>
        <!-- Page content end -->
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, watch, onMounted } from "vue";
import { useUserStore } from '~~/stores/user';
import axios from "axios";

const router = useRouter();
const userStore = useUserStore()
const loading = ref(false);
const errors = ref({});

let email = ref('');
let name = ref('');
let phone_number = ref('');
let password = ref(null);
let inviteCode = ref(null);
let confirmPassword = ref(null);
let otp = ref(null)

const passwordFieldType = ref('password');
const confirmPasswordFieldType = ref('password');

const togglePassword = (id) => {
  const inputField = document.querySelector(id);
  if (inputField.type === 'password') {
    inputField.type = 'text';
  } else {
    inputField.type = 'password';
  }
};

const checkEmail = async () => {
  try {
    loading.value = true;
    const response = await axios.post('/unauthenticate/checkEmail', {
      email: email.value // Send the email value in the request body
    });
    console.log("Send Code: " + response.data);
    //productdata.value = response.data.data;

  } catch (error) {
    if (error.response && error.response.status === 422) {
      errors.value = error.response.data.errors;
    } else {
      // Handle other types of errors here
      console.error('An error occurred:', error);
    }
  }
};

const filterNumericInput = (event) => {
  const value = event.target.value;
  // Keep only numeric characters
  phone_number.value = value.replace(/\D/g, '');
}
const buttonDisabled = ref(false); // Initially, button is enabled
async function sendCode() {
  if (!buttonDisabled.value) { // Check if button is not disabled
    try {
      loading.value = true; // Show loader
      buttonDisabled.value = true; // Disable the button to prevent double-clicking
      // Your asynchronous operation (e.g., axios request)
      await checkEmail(); // Assuming checkEmail is an asynchronous function
    } finally {
      loading.value = false; // Hide loader
      buttonDisabled.value = false; // Re-enable the button after operation completes or fails
    }
  }
}
let showmessages = ref('');
const register = async () => {
  loading.value = true; 
  try {
    await userStore.register(
      name.value,
      phone_number.value,
      email.value,
      otp.value,
      inviteCode.value,
      password.value,
      confirmPassword.value
    )

    const messages = "Registration successful";
        console.log("messages:" + messages); // You can handle the messages here
        showmessages.value = messages;
    router.push('/login')
  } catch (error) {
    //console.log(error)
    errors.value = error.response.data.errors
  } finally {
      loading.value = false; // Hide loader
     
    }
  
  }


let queryParams = {};
if (process.client) {
  queryParams = new URLSearchParams(window.location.search);
  const codeValue = queryParams.toString().split('=')[1];
  console.log("----" + codeValue);
  inviteCode.value = codeValue;
}


</script>
