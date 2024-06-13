<template>
  <div>
    <title>KYC</title>
    <div class="nav-menu">
      <nav class="menu">
        <!-- Menu navigation start -->
        <Sidebar />
        <!-- Menu navigation end -->
      </nav>
    </div>

    <div class="wrapper-inline">
      <!-- Header area start -->
      <HeaderThird />
      <Footer />
      <!-- Header area end -->
      <!-- Page content start -->
      <main>
        <div class="text-align-center">
          <h2 style="color: #4e4e4e">Verify Account</h2>
          <span class="short-title"
            >verify your account using Passport / CNIC / Driving License.</span
          >
        </div>

        <!-- Select Verification Method -->

        <section v-if="!checkKyc">
          <form action="#">
            <h2>Choose One</h2>
                            <div class="loading-indicator" v-if="loading" style="text-align: center">
                                                     <Loader />
                                        </div>
                                        
            <!-- select kyc options  -->
            <ul
              class="nav nav-pills mb-3 justify-content-space-between"
              id="pills-tab"
              role="tablist">
              <li class="nav-item">
                <a
                  class="btn active"
                  id="pills-cnic-tab"
                  data-toggle="pill"
                  href="#pills-cnic"
                  role="tab"
                  aria-controls="pills-cnic"
                  aria-selected="true">
                  <i class="fa fa-id-card"></i>
                  <span>CNIC</span>
                </a>
              </li>
              <li class="nav-item">
                <a
                  class="btn"
                  id="pills-passport-tab"
                  data-toggle="pill"
                  href="#pills-passport"
                  role="tab"
                  aria-controls="pills-passport"
                  aria-selected="false">
                  <i class="fa fa-passport"></i>
                  <span>Passport</span>
                </a>
              </li>
              <li class="nav-item">
                <a
                  class="btn"
                  id="pills-Driving-tab"
                  data-toggle="pill"
                  href="#pills-Driving"
                  role="tab"
                  aria-controls="pills-Driving"
                  aria-selected="false">
                  <i class="fa fa-id-card"></i>
                  <span>Driving License</span>
                </a>
              </li>
            </ul>

            <div class="tab-content" id="pills-tabContent">
              <!-- CNIC -->
              <div
                class="tab-pane fade show active"
                id="pills-cnic"
                role="tabpanel"
                aria-labelledby="pills-cnic-tab">
                <form @submit.prevent="submitFormCnic" id="formcnic">
                  <div
                    class="d-flex justify-content-center"
                    style="margin-top: 60px">
                    <div class="front-back">
                      <label for="front-cnic">
                        <p class="text-center">Front</p>
                        <img :src="idFront" alt="Front" v-if="idFront" />
                        <p v-else class="text-center">No Image</p>
                      </label>
                      <input type="hidden" v-model="selectedOptionCnic" />
                      <input
                        type="file"
                        hidden
                        id="front-cnic"
                        @change="previewImage($event, 'idFront')"
                      />
                      <span class="text-danger" v-if="errors.frontFile">{{ errors.frontFile[0] }}</span>
                    </div>
                    <div class="front-back">
                      <label for="back-cnic">
                        <p class="text-center">Back</p>
                        <img :src="idBack" alt="Back" v-if="idBack" />
                        <p v-else class="text-center">No Image</p>
                      </label>
                      <input
                        type="file"
                        hidden
                        id="back-cnic"
                        @change="previewImage($event, 'idBack')"
                      />
                      <span class="text-danger" v-if="errors.backFile">{{ errors.backFile[0] }}</span>
                    </div>
                    <button type="submit" class="submit-btn">Submit</button>
                  </div>
                </form>
              </div>
              <div
                class="tab-pane fade"
                id="pills-passport"
                role="tabpanel"
                aria-labelledby="pills-passport-tab">
                <form @submit.prevent="submitFormPassport" id="formpassport">
                  <div
                    class="d-flex justify-content-center" style="margin-top: 60px">
                    <div class="front-back">
                      <label for="passport">
                        <p class="text-center">Passport</p>
                        <img :src="passport" alt="Passport" v-if="passport" />
                        <p v-else class="text-center">No Image</p>
                      </label>
                      <input
                        type="file"
                        hidden
                        id="passport"
                        @change="previewImage($event, 'passport')"
                      />
                      <button type="submit" class="submit-btn">Submit</button>
                    </div>
                  </div>
                </form>
              </div>
              <div
                class="tab-pane fade"
                id="pills-Driving"
                role="tabpanel"
                aria-labelledby="pills-Driving-tab">

                <form @submit.prevent="submitFormDriving" id="formdriving">

                <div  class="d-flex justify-content-center" style="margin-top: 60px">
                  <div class="front-back">
                    <label for="front-driving">
                      <p class="text-center">Front</p>
                      <img :src="driveFront" alt="Front" v-if="driveFront" />
                      <p v-else class="text-center">No Image</p>
                    </label>
                    <input
                      type="file" hidden id="front-driving"  @change="previewImage($event, 'driveFront')"
                    />
                  </div>
                  <div class="front-back">
                    <label for="back-driving">
                      <p class="text-center">Back</p>
                      <img :src="driveBack" alt="Back" v-if="driveBack" />
                      <p v-else class="text-center">No Image</p>
                    </label>
                    <input
                      type="file" hidden id="back-driving" @change="previewImage($event, 'driveBack')"
                    />
                  </div>
                  <button type="submit" class="submit-btn">Submit</button>
                </div>
              </form>


              </div>
            </div>

         
          </form>
        </section>
        <section v-else><h3><center>Your KYC Submit</center></h3></section>
        <!-- <SocialFooter /> -->
      </main>
    </div>
  </div>
</template>

<script setup>
import Sidebar from "~/layouts/Sidebar.vue";
import HeaderThird from "~/layouts/HeaderThird.vue";
import SocialFooter from "~/components/SocialFooter.vue";
import Swal from "sweetalert2";
import { ref, watchEffect } from "vue";
import { useUserStore } from "~~/stores/user";
import { storeToRefs } from "pinia";
import axios from "axios";
const userStore = useUserStore();
const router = useRouter();
const errors = ref({});
const loading = ref(true);
const idFront = ref("/assets/img/2.png");
const idBack = ref("/assets/img/1.png");

const passport = ref("/assets/img/2.png");

const driveFront = ref("/assets/img/2.png");
const driveBack = ref("/assets/img/1.png");

const frontFile = ref(null);
const backFile = ref(null);
const pass_value = ref(null);
const checkKyc = ref(null);
const selectedOptionCnic = ref("cnic");
const selectedOptionPassport = ref("passport");
const selectedOptionDriving = ref("driving");

const previewImage = (event, target) => {
  const file = event.target.files[0];
  if (file) {
    const reader = new FileReader();
    reader.onload = (e) => {

      if (target === "driveFront") {
        driveFront.value = e.target.result;
        frontFile.value = file;
      }
      if (target === "driveBack") {
        driveBack.value = e.target.result;
        backFile.value = file;
      }


      if (target === "idFront") {
        idFront.value = e.target.result;
        frontFile.value = file;
      }
      if (target === "idBack") {
        idBack.value = e.target.result;
        backFile.value = file;
      }

      if (target === "passport") {
        passport.value = e.target.result;
        pass_value.value = file;
      }
    };
    reader.readAsDataURL(file);
  }
};

const submitFormDriving = async () => {
  const formData = new FormData();
  if (frontFile.value) formData.append("frontFile", frontFile.value);
  if (backFile.value) formData.append("backFile", backFile.value);
  formData.append("selectedOptionDriving", selectedOptionDriving.value);

  const headers = {
    "Content-Type": "multipart/form-data",
  };
  axios.post("/user/insertKycDriving", formData, { headers })
    .then((res) => {
      document.getElementById("formdriving").reset();
      success_noti();
      router.push("/success");
    })
    .catch((error) => {
      if (error.response && error.response.status === 422) {
        //  buttonClicked.value = false;
        errors.value = error.response.data.errors;
      } else {
        // Handle other types of errors here
        console.error("An error occurred:", error);
      }
    });
};

const submitFormPassport = async () => {
  const formData = new FormData();
  if (pass_value.value) formData.append("passportFile", pass_value.value);
  formData.append("selectedOptionPassport", selectedOptionPassport.value);

  const headers = {
    "Content-Type": "multipart/form-data",
  };
  axios.post("/user/insertKycPassport", formData, { headers })
    .then((res) => {
      document.getElementById("formpassport").reset();
      success_noti();
      router.push("/success");
    })
    .catch((error) => {
      if (error.response && error.response.status === 422) {
        //  buttonClicked.value = false;
        errors.value = error.response.data.errors;
      } else {
        // Handle other types of errors here
        console.error("An error occurred:", error);
      }
    });
};


const submitFormCnic = async () => {
  const formData = new FormData();
  if (frontFile.value) formData.append("frontFile", frontFile.value);
  if (backFile.value) formData.append("backFile", backFile.value);
  formData.append("selectedOptionCnic", selectedOptionCnic.value);

  const headers = {
    "Content-Type": "multipart/form-data",
  };
  axios.post("/user/insertKycCnic", formData, { headers })
    .then((res) => {
      document.getElementById("formcnic").reset();
      success_noti();
      router.push("/success");
    })
    .catch((error) => {
      if (error.response && error.response.status === 422) {
        //  buttonClicked.value = false;
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
    title: "Has been successfully send KYC.",
  });
};


const fetchData = async () => {
  loading.value = true;
  try {
    const response = await axios.get("/user/checkycData");
    console.log("response kyc user_id:" + response.data.user_id);
    //user_id.value = response.data.user_id;
    checkKyc.value = response.data.user_id;
    
   
  } catch (error) {
    console.error("Error fetching data:", error);
  } finally{
    loading.value = false;
  }
}; 

onMounted(async () => {
    fetchData();
});
</script>

<style>
.text-align-center {
  text-align: center;
}

.short-title {
  margin-top: -15px;
  display: block;
  font-size: 13px;
}

section {
  margin: 0 auto;
  width: 90%;
  margin-top: 25px;
  color: #4e4e4e;
}

.d-flex {
  width: 100%;
  display: flex;
  flex-wrap: wrap;
}

.justify-content-space-between {
  justify-content: space-between;
}

.justify-content-center {
  justify-content: space-around;
}

.btn {
  width: 70px;
  background-color: transparent;
  border: none;
  text-align: center;
  color: #555555;
  width: fit-content;
}

.btn i {
  font-size: 45px;
  padding-bottom: 6px;
}

.btn span {
  font-size: 13px;
  display: block;
}

.active {
  color: #1a6ca9;
}

.front-back {
  width: 100px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-wrap: wrap;
}

.front-back img {
  width: 70px;
  margin-bottom: 20px;
}

.upload-btn {
  padding: 6px;
  background-color: transparent;
  border: 2px solid #1a6ca9;
  border-radius: 5px;
  color: #1a6ca9;
}

.submit-btn {
  width: 85%;
  font-size: 16px;
  padding: 10px;
  display: block;
  background-color: #1a6ca9;
  color: white;
  border: none;
  border-radius: 8px;
  margin: 0 auto;
  margin-top: 50px;
}
</style>
