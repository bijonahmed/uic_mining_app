<template>
  <div>
    <title>Login</title>

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
              <h3 class="w-text">Login</h3>
              <div class="notification"></div>
            </div>
          </div>

          <section class="bal-section container">
            <div class="container">
              <div class="form-divider"></div>

              <form @submit.prevent="login()">
                <center>
                  <span class="text-danger text-center">{{
                    errors.account
                  }}</span>
                </center>
                <div class="form-row-group with-icons">
                  <div class="form-row no-padding">
                    <i class="fa fa-envelope"></i>
                    <input
                      type="email"
                      name="aaa"
                      class="form-element"
                      placeholder="Username or Email"
                      v-model="email"
                    />
                    <span class="text-danger">{{ errors.email }}</span>
                  </div>
                  <div class="form-row no-padding">
                    <i class="fa fa-lock"></i>
                    <input
                      type="password"
                      name="aaa"
                      class="form-element"
                      placeholder="Password"
                      v-model="password"
                    />
                    <span class="text-danger">{{ errors.password }}</span>
                  </div>
                </div>

                <div class="input_group">
                  <div class="CaptchaWrap">
                    <div id="CaptchaImageCode" class="CaptchaTxtField">
                      <canvas
                        id="CapCode"
                        class="capcode"
                        width="500"
                        height="80"
                      ></canvas>
                    </div>
                    <!-- <input type="button" class="ReloadBtn" @click="createCaptcha"> -->
                    <button
                      type="button"
                      @click="createCaptcha"
                      class="ReloadBtn"
                    >
                      <img src="/public/assets/img/refresh.webp" alt="" />
                    </button>
                  </div>

                  <input
                    type="hidden"
                    id="UserCaptchaCode"
                    class="CaptchaTxtField form-control mt-2"
                    placeholder="Enter Captcha - Case Sensitive"
                    v-model="captchaInput"
                    @input="validateCaptcha"
                  />

                  <input
                    type="text"
                    class="CaptchaTxtField form-control mt-2"
                    placeholder="Enter Captcha - Case Sensitive"
                    v-model="userCapInput"
                  />

                  <span id="WrongCaptchaError" class="error">{{
                    captchaError
                  }}</span>
                  <span class="text-danger">{{ errors.userCapInput }}</span>
                </div>

                <div class="form-divider"></div>

                <div class="form-row">
                  <!-- <a href="Javascript:void(0);" class="button circle block orange">Login</a> -->
                  <!-- <button type="submit" class="button circle block orange">Login</button> -->

                  <button
                    class="button circle block orange"
                    type="submit"
                    :disabled="loading"
                  >
                    <span v-if="loading">Loading...</span>
                    <span v-else>Login</span>
                  </button>
                </div>

                <div class="form-row txt-center mt-15">
                  Don't you have an account yet?
                  <nuxt-link data-loader="show" to="/register"
                    >Sign Up</nuxt-link
                  >
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
import Sidebar from "~/layouts/Sidebar.vue";
import Header from "~/layouts/Header.vue";

import axios from "axios";
import { useUserStore } from "~~/stores/user";

const userStore = useUserStore();
const router = useRouter();

// definePageMeta({
//     middleware: 'is-logged-in'
// })

const loading = ref(false);
const email = ref("");
const password = ref("");
const errors = ref({ email: "", password: "" }); // Initialize error messages
const emailError = ref("");
const passwordError = ref("");

const captchaInput = ref("");
const userCapInput = ref("");
const account = ref("");
const captchaError = ref("");
const captchaValid = ref(false);

const passwordFieldType = ref("password");
const confirmPasswordFieldType = ref("password");

const togglePassword = (id) => {
  const inputField = document.querySelector(id);
  if (inputField.type === "password") {
    inputField.type = "text";
  } else {
    inputField.type = "password";
  }
};

function createCaptcha() {
  const canvas = document.getElementById("CapCode");
  const context = canvas.getContext("2d");
  const captchaCode = generateCaptchaCode(6); // Change the length as needed

  context.clearRect(0, 0, canvas.width, canvas.height);
  context.font = "48px Arial";
  context.fillText(captchaCode, 10, 50);

  captchaInput.value = captchaCode;
}

function generateCaptchaCode(length) {
  const characters = "0123456789";
  let result = "";
  for (let i = 0; i < length; i++) {
    result += characters.charAt(Math.floor(Math.random() * characters.length));
  }
  return result;
}

function validateCaptcha() {
  if (
    captchaInput.value.toUpperCase() !==
    document.getElementById("UserCaptchaCode").value.toUpperCase()
  ) {
    captchaError.value = "Incorrect CAPTCHA code";
    captchaValid.value = false;
  } else {
    captchaError.value = "";
    captchaValid.value = true;
  }
}

async function login() {
  try {
    loading.value = true;
    // Your login logic here
    // Assuming you're making an API request to log in
    await userStore.login(
      email.value,
      password.value,
      captchaInput.value,
      userCapInput.value
    );
    const token = window.localStorage.getItem("token");
    //console.log("My token: " + token);
    if (token) {
      axios.defaults.headers.common["Authorization"] =
        "Bearer " + userStore.api_token;
    }
    router.push("/");
  } catch (error) {
    loading.value = false;
    // If the request fails, display the error messages
    if (error.response && error.response.data.errors) {
      const responseErrors = error.response.data.errors;
      errors.value = {
        email: responseErrors.email ? responseErrors.email[0] : "",
        password: responseErrors.password ? responseErrors.password[0] : "",
        userCapInput: responseErrors.userCapInput
          ? responseErrors.userCapInput[0]
          : "",
        account: responseErrors.account ? responseErrors.account[0] : "",
      };
    } else {
      console.error("An error occurred while logging in:", error);
    }
  }
}

onMounted(() => {
  createCaptcha();
});
</script>

<style>
#CapCode {
  height: 43px;
  border: 1px solid #adadad;
  margin-top: 10px;
  display: flex;
  justify-content: center;
  align-content: center;
  text-align: center;
  width: 100%;
}

.CaptchaWrap {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.ReloadBtn {
  width: 50%;
  height: 45px;
  margin-top: 10px;
}
.ReloadBtn img {
  height: 100%;
  width: 100%;
  object-fit: contain;
  cursor: pointer;
}
</style>