<template>
  <div>
    <title>Profile</title>

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
        <!-- Page content start -->

        <form
          @submit.prevent="saveData()"
          id="formrest"
          class="forms-sample"
          enctype="multipart/form-data"
        >
          <main class="margin mt-0">
            <div class="dash-balance">
              <div class="dash-content relative">
                <h3 class="w-text">Trader Porfile</h3>
                <div class="notification">
                  <!-- <a href="#"><i class="fa fa-plus"></i></a> -->
                </div>
              </div>
            </div>
            <section class="container bal-section">
              <div class="form-row txt-center d-none">
                <div class="profile-image">
                  <img
                    class="avatar-img"
                    alt="User Avatar"
                    src="/assets/img/avatar.png"
                    width="100"
                    height="100"
                  />
                  <a href="javascript:void(0);" class="update-btn"
                    ><i class="fa fa-camera"></i
                  ></a>
                </div>
              </div>
              <br /><br />

              <div class="trader-info">
                <h3>{{ name }}</h3>
                <p>{{ email }}</p>
                <ul class="trader-info-list list-unstyled">
                  <li>
                    <div class="profile1"></div>
                    <h2>0</h2>
                    <small class="txt-muted">Transaction</small>
                  </li>
                  <li>
                    <div class="profile2"></div>
                    <h2>$0</h2>
                    <small class="txt-muted">Receieved</small>
                  </li>
                  <li>
                    <div class="profile3"></div>
                    <h2>$0</h2>
                    <small class="txt-muted">Exchanged</small>
                  </li>
                </ul>
              </div>
            </section>

            <section class="container">
              <h4 class="title-main">Account Info</h4>
              <div class="form-row-group with-icons">
                <div class="form-row no-padding">
                  <i class="fa fa-user"></i>

                  <input
                    type="text"
                    class="form-element"
                    placeholder="name"
                    v-model="name"
                  />
				  <span class="text-danger" v-if="errors.name">{{
                errors.name[0]
              }}</span>
                </div>
                <div class="form-row no-padding">
                  <i class="fa fa-envelope"></i>
                  <input
                    type="email"
                    class="form-element"
                    placeholder="Email"
                    v-model="email"
                    disabled
                  />
                </div>
				<span class="text-danger" v-if="errors.email">{{
                errors.email[0]
              }}</span>
                <div class="form-row no-padding">
                  <i class="fa fa-phone"></i>
                  <input
                    type="tel"
                    class="form-element"
                    placeholder="Email"
                    v-model="phone_number"
                  />
                </div>
              </div>
            </section>

            <section class="container">
              <h4 class="title-main">Social Media</h4>

              <div class="form-row-group with-icons">
                <div class="form-row no-padding">
                  <i class="fab fa-facebook"></i>
                  <input
                    type="text"
                    class="form-element"
                    placeholder="facebook.com/profile.php?id=100000000000000"
                    v-model="facebook"
                  />
                </div>
                <div class="form-row no-padding">
                  <i class="fab fa-twitter"></i>
                  <input
                    type="text"
                    class="form-element"
                    placeholder="twitter.com/Sample-user"
                    v-model="twitter"
                  />
                </div>
                <div class="form-row no-padding">
                  <i class="fab fa-whatsapp"></i>
                  <input
                    type="text"
                    class="form-element"
                    placeholder="wa.me/0000000000"
                    v-model="whtsapp"
                  />
                </div>
              </div>

              <div class="form-divider"></div>

              <div class="form-row">
                <button type="submit" class="button circle block orange">
                  Update
                </button>
              </div>

              <div class="form-divider"></div>
            </section>
            <!-- <SocialFooter /> -->
          </main>
        </form>
        <center>
          <div v-for="(errorArray, idx) in notifmsg" :key="idx">
            <div v-for="(allErrors, idx) in errorArray" :key="idx">
              <span class="text-danger">{{ allErrors }} </span>
            </div>
          </div>
        </center>
        <form
          @submit.prevent="changesPassword()"
          id="formrest"
          class="forms-sample"
          enctype="multipart/form-data"
        >
          <div class="row mb-3">
            <label for="inputEnterYourName" class="col-sm-2 col-form-label"
              >Password</label
            >
            <div class="col-sm-8">
              <input
                type="hidden"
                class="form-control id"
                v-model="insertdata.id"
                id="id"
              />
              <input
                type="password"
                class="form-control password"
                v-model="insertdata.password"
                id="password"
                placeholder="Password"
              />
              <span class="text-danger" v-if="errors.password">{{
                errors.password[0]
              }}</span>
            </div>
          </div>

          <div class="row mb-3">
            <label for="inputConfirmPassword2" class="col-sm-2 col-form-label"
              >Confirm Password</label
            >
            <div class="col-sm-8">
              <input
                type="password"
                class="form-control password_confirmation"
                v-model="insertdata.password_confirmation"
                id="password_confirmation"
                placeholder="Confirm Password"
              />
              <span class="text-danger" v-if="errors.password_confirmation">{{
                errors.password_confirmation[0]
              }}</span>
            </div>
          </div>

          <div class="row">
            <label class="col-sm-2 col-form-label"></label>
            <div class="col-sm-8">
              <button type="submit" class="btn btn-success px-5 w-100">
                <i class="bx bx-check-circle mr-1"></i> Submit
              </button>
            </div>
          </div>
        </form>

        <br /><br /><br /><br />

        <!-- Page content end -->
      </div>
    </div>
  </div>
</template>

<script setup>
import Sidebar from "~/layouts/Sidebar.vue";
import HeaderSecond from "~/layouts/HeaderSecond.vue";
import { useRouter } from "vue-router";
const router = useRouter();
import axios from "axios";
import swal from "sweetalert2";

const name = ref("");
const email = ref("");
const phone_number = ref("");
const whtsapp = ref("");
const facebook = ref("");
const twitter = ref("");
const errors = ref({});
const id = ref("");

const insertdata = reactive({
  id: "",
  password: "",
  password_confirmation: "",
});

const fetchData = async () => {
  try {
    const response = await axios.get("/auth/showProfileData");
    console.log("Response data:", response.data.name); // Log the response data
    name.value = response.data.name;
    email.value = response.data.email;
    phone_number.value = response.data.phone_number;
    whtsapp.value = response.data.whtsapp;
    facebook.value = response.data.facebook;
    twitter.value = response.data.twitter;
	id.value = response.data.id;
  } catch (error) {
    console.error("Error fetching data:", error);
  }
};

const changesPassword = () => {
  const formData = new FormData();
  formData.append("id", id.value);
  formData.append("password", insertdata.password);
  formData.append("password_confirmation", insertdata.password_confirmation);

  const headers = {
    "Content-Type": "multipart/form-data",
  };
  axios
    .post("/user/changePassword", formData, { headers })
    .then((res) => {
      document.getElementById("formrest").reset();
      success_noti();
      router.push("/");
    })
    .catch((error) => {
      if (error.response && error.response.status === 422) {
        errors.value = error.response.data.errors;
      } else {
        // Handle other types of errors here
        console.error("An error occurred:", error);
      }
    });
};

const saveData = () => {
  const formData = new FormData();
  formData.append("name", name.value);
  formData.append("email", email.value);
  formData.append("phone_number", phone_number.value);
  formData.append("whtsapp", whtsapp.value);
  formData.append("facebook", facebook.value);
  formData.append("twitter", twitter.value);
  const headers = {
    "Content-Type": "multipart/form-data",
  };
  axios
    .post("/auth/updateprofile", formData, { headers })
    .then((res) => {
      document.getElementById("formrest").reset();
      success_noti();
      router.push("/");
    })
    .catch((error) => {
      if (error.response && error.response.status === 422) {
        errors.value = error.response.data.errors;
      } else {
        // Handle other types of errors here
        console.error("An error occurred:", error);
      }
    });
};

onMounted(async () => {
  await fetchData();
});
const success_noti = () => {
  const Toast = swal.mixin({
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
    title: "Your profile has been successfully update.",
  });
};
</script>
