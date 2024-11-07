<template>
  <div>
    <title>Post Blog</title>

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

        <!-- Page content start -->
        <main>
          <div class="container">
            <!-- start popup  -->
            <section class="post-sections">
              <div class="post-card">
                <form @submit.prevent="saveData()" id="formrest" enctype="multipart/form-data">
                  <div class="heading-cut">
                    <h2 style="display: block;text-align: center;color: #4e4e4e;width: 90%;">
                      Post Anything
                    </h2>

                  </div>
                  <div class="text-box">
                    <label for="post-description">Write Description</label>
                    <textarea class="form-control" rows="5" v-model="descriptionFull"
                      placeholder="Please Write Post Description"></textarea>
                    <span class="text-danger" v-if="errors.description_full">{{ errors.description_full[0] }}</span>
                  </div>
                  <br />
                  <div class="text-box">
                    <label for="file" class="file-label">
                      <!-- <i class="fa-thin fa-upload"></i> -->
                      <small>&nbsp;Please Upload Image/Video or Any Docs.</small>
                    </label><br />
                    <input type="file" id="fileInput" ref="files" @change="onFileSelected" />
                    <span class="text-danger" v-if="errors.files">{{ errors.files[0] }}</span>
                  </div>
                  <br />
                  <button type="submit" class="publish-button btn btn-primary w-100">Publish</button>
                </form>
              </div>
            </section>

            <!-- end popup -->
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
import axios from "axios";
const router = useRouter();

const loading = ref(false);

const descriptionFull = ref('');
const name = ref('');
const images = ref([]);
const errors = ref({});
const file = ref(null);

const onFileSelected = (event) => {
  file.value = event.target.files[0];
};

const saveData = () => {
  const formData = new FormData();
  images.value.forEach((image, index) => {
    formData.append('images[]', image.file);
  });

  formData.append('files', file.value);
  formData.append('description_full', descriptionFull.value);

  console.log(formData);

  axios.post('/post/userRequestPost', formData, {
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  }).then((res) => {
    $('#formrest')[0].reset();
    success_noti();
    const product_id = res.data.product_id;
    // Redirect to product variant page
    router.push({
      path: '/peding-post',

    });

  }).catch(error => {
    if (error.response && error.response.status === 422) {
      errors.value = error.response.data.errors;
    } else {
      // Handle other types of errors here
      console.error("An error occurred:", error);
    }
  });
};

const success_noti = () => {
  //alert("Your data has been successfully inserted.");
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
    title: "Please waiting for the approval."
  });
};





</script>
<style>
.post-sections {
  width: 100%;
  height: auto;
  display: flex;
  flex-wrap: wrap;
  margin-bottom: 100px;
  justify-content: center;
}

.post-card {
  width: 95%;
  height: auto;
  background-color: white;
  border: 1.5px solid #4e4e4e10;
  border-radius: 8px;
  padding: 6px;
  box-shadow: 0px 2px 8px 2px #4e4e4e30;
  margin-top: 15px;
}

.post-card .description {
  width: 100%;
  height: auto;
  padding: 0px 5px;
  overflow: hidden;
  margin: 15px 0px;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  /* Limit the number of lines */
  -webkit-box-orient: vertical;
}

.post-card img {
  width: 100%;
  border: none;
  border-radius: 6px;
}

.post-buttons {
  width: 100%;
  margin-top: 15px;
  margin-bottom: 5px;
  display: flex;
  justify-content: space-around;
  align-items: center;
  padding-top: 15px;
  border-top: 1.5px solid #d6d6d6;
}

.post-buttons button {
  padding: 5px 15px;
  color: rgb(29, 29, 29);
  border: none;
  outline: none;
  border-radius: 25px;
  background-color: #4e4e4e15;
}

.post-buttons button i {
  margin-right: 10px;
}

.post-buttons button:active {
  padding: 5px 15px;
  color: white;
  border: none;
  outline: none;
  border-radius: 25px;
  background-color: #1a6ca9;
}
</style>