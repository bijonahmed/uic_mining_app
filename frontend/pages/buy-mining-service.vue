<template>
    <div>
        <title>Buy Mining Machine</title>
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
                <!-- Start -->

                <center>
                    <h3>Buy Mining Machine...</h3>
                </center>

                <section class="services section-bg" id="services">
                    <div class="container">
                        {{ categorys }}
                        <div class="row">
                            <div class="col-md-6 col-lg-3" v-for="category in categories" :key="category.id">
                                <div class="box">
                                    <div class="icon" style="background: #000">
                                        <i class="fa fa-briefcase service-icon" style="color: #c59c35"></i>
                                    </div>
                                    <h4 class="title">
                                        <a href="#">{{ category.name }}</a>
                                    </h4>
                                    <p class="description text-center">
                                        {{ category.offer_description }}
                                    </p>
                                    <center>
                                       <p v-if="category.enddate" class="alert alert-danger"> <small>Expire Date: {{ category.enddate }}</small>  </p>


                                        <button class="btn btn-primary btn-lg" type="button" data-popup="standartPopup"  v-if="!category.enddate"
                                            @click="fetchCategoriesDuration(category)">
                                            Buy Now
                                        </button>
                                  
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- END  -->
            </main>
        </div>
        <!-- Start Modal -->
        <!-- Modal -->

        <!--POPUP HTML CONTENT START -->

        <form @submit.prevent="submitForm" id="formrest">
            <div class="popup-overlay" id="standartPopup">
                <div class="popup-container modal-dialog modal-dialog-centered modal-dialog-scrollabl">
                    <div class="popup-header">

                        <h3 class="popup-title">Services : [{{ categoryName }}]</h3>
                        <span class="popup-close" data-dismiss="true"><i class="fa fa-times"></i></span>
                    </div>
                    <div class="popup-content">
                        <!-- Pay -->
                        
                        <div class="alert alert-danger" role="alert" v-if="notify">{{ notify }}</div>
                        <table width="100%" border="0" class="table table-striped">
                            <tr>
                                <th>Packages Name</th>
                                <th>
                                    <select class="form-control ms-2 w-100" v-model="selectedPackageId"
                                        @change="selectDurations(selectedPackageId)">
                                        <option value="">Select Packages</option>
                                        <option v-for="catduration in categoriesDuration" :key="catduration.id"
                                            :value="catduration.id" @change="selectDurations(catduration)">
                                            {{ catduration.packages_name }}
                                        </option>
                                    </select>

                                    <span class="text-danger"
                                        v-if="errors.selected_duration_id">{{ errors.selected_duration_id[0] }}</span>

                                </th>
                            </tr>
                            <tr class="d-none">
                                <input type="hidden" v-model="categoryId" />
                                <th>Duration</th>
                                <td>
                                    <input type="text" class="form-control" v-model="selectedDuration" placeholder="00"
                                        disabled />
                                    <span class="text-danger"
                                        v-if="errors.selectedDuration">{{ errors.selectedDuration[0] }}</span>
                                </td>
                            </tr>
                            <tr>
                                <th>Price</th>
                                <td><input type="text" class="form-control" v-model="selectedPrice" placeholder="00"
                                        disabled />
                                    <span class="text-danger" v-if="errors.selectedPrice">{{ errors.selectedPrice[0] }}</span>
                                    <span class="text-danger" v-if="errors.error_amount">{{ errors.error_amount[0] }}</span>


                                    

                                </td>
                            </tr>
                        </table>
                        <!-- END Pay -->
                    </div>
                    <div class="popup-footer">
                        <button class="button orange" :disabled="buttonClicked">Submit</button>
                    </div>
                </div>
            </div>
        </form>

        <!-- END Modal -->
    </div>
</template>

<script setup>
import Sidebar from "~/layouts/Sidebar.vue";
import HeaderThird from "~/layouts/HeaderThird.vue";
import SocialFooter from "~/components/SocialFooter.vue";
import axios from "axios";
import { useRouter } from "vue-router";
import Swal from "sweetalert2";
import $ from "jquery";

const router = useRouter();
const categoryId = ref("");
const categoryName = ref("");
const categories = ref([]);
const categoriesDuration = ref([]);
const selectedPackageId = ref('')
const selectedDuration = ref('')
const selectedPrice = ref('')
const errors = ref({});
const error_amount = ref({});
const buttonClicked = ref(false);
const notify = ref('');


const submitForm = () => {
    buttonClicked.value = true;
    const formData = new FormData();
    formData.append('mining_category_id', categoryId.value);
    formData.append('selected_duration_id', selectedPackageId.value);
    formData.append('selectedDuration', selectedDuration.value);
    formData.append('selectedPrice', selectedPrice.value);
    const headers = {
        'Content-Type': 'multipart/form-data'
    };
    axios.post('/mining/buyMiningDuration', formData, { headers })
        .then((res) => {
            buttonClicked.value = false;
            document.getElementById('formrest').reset();
           
            if (res.data.status == 1) {
                success_noti();
                router.push('/');

            } else {
                notify.value = res.data.notify;
                error_noti();
                router.push('/buy-mining-service');
            }

        }).catch(error => {
            if (error.response && error.response.status === 422) {
                buttonClicked.value = false;
                //console.log("-----" + error.response.data.errors.error_amount);
                errors.value = error.response.data.errors;
                error_amount.value =  error.response.data.errors.error_amount;

            } else {
                // Handle other types of errors here
                console.error('An error occurred:', error);
            }
        });
};

const selectDurations = (packageId) => {

    const selectedPackage = categoriesDuration.value.find(catduration => catduration.id == packageId)
    selectedPackageId.value = selectedPackage.id

    if (selectedPackage) {
        selectedDuration.value = selectedPackage.duration
        selectedPrice.value = selectedPackage.prices
    } else {
        selectedDuration.value = ''
        selectedPrice.value = ''
    }
}
const fetchData = async () => {
    try {
        const response = await axios.get("/mining/getMiningCategory");
        categories.value = response.data;

    } catch (error) {
        console.error("Error fetching data:", error);
    }
};

const fetchCategoriesDuration = async (category) => {

    notify.value = "";
    categoryId.value = category.id;
    categoryName.value = category.name;

    const params = {
        categoryId: category.id,
    };
    try {
        const response = await axios.get("/mining/getMiningDuration", { params });
        console.log("Durations Response data:", response.data); // Use comma to log response data
        categoriesDuration.value = response.data; // Access the 'data' property
        selectedDuration.value = ''
        selectedPrice.value = ''
    } catch (error) {
        console.error("Error fetching durations:", error);
    }
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
        }
    });
    Toast.fire({
        icon: "success",
        title: "Mining machine successfully purchased."
    });
};


const error_noti = () => {
    const Toast = Swal.mixin({
        toast: true,
        position: "top-end",
        showConfirmButton: false,
        timer: 9000,
        timerProgressBar: true,
        didOpen: (toast) => {
            toast.onmouseenter = Swal.stopTimer;
            toast.onmouseleave = Swal.resumeTimer;
        }
    });
    Toast.fire({
        icon: "error",
        title: "Your mining matchine still now running."
    });
};

onMounted(() => {
    fetchData();
});
</script>

<style>
section {
    overflow: hidden;
}

.section-bg {
    background: #f5f8fd;
}

.section-header h3 {
    font-size: 36px;
    color: #413e66;
    text-align: center;
    font-weight: 700;
    position: relative;
    font-family: "Montserrat", sans-serif;
}

.section-header p {
    text-align: center;
    margin: auto;
    font-size: 15px;
    padding-bottom: 60px;
    color: #535074;
    width: 50%;
}

@media (max-width: 767px) {
    .section-header p {
        width: 100%;
    }
}

#services {
    padding: 0px 0 0px 0;
}

#services .box {
    padding: 30px;
    position: relative;
    overflow: hidden;
    border-radius: 10px;
    margin: 0 10px 40px 10px;
    background: #fff;
    box-shadow: 0 10px 29px 0 rgba(68, 88, 144, 0.1);
    transition: all 0.3s ease-in-out;
    text-align: center;
}

#services .box:hover {
    transform: scale(1.1);
}

#services .icon {
    margin: 0 auto 15px auto;
    padding-top: 12px;
    display: inline-block;
    text-align: center;
    border-radius: 50%;
    width: 60px;
    height: 60px;
}

#services .icon .service-icon {
    font-size: 36px;
    line-height: 1;
}

#services .title {
    font-weight: 700;
    margin-bottom: 15px;
    font-size: 18px;
}

#services .title a {
    color: #111;
}

#services .box:hover .title a {
    color: #c59c35;
}

#services .box:hover .title a:hover {
    text-decoration: none;
}

#services .description {
    font-size: 14px;
    line-height: 28px;
    margin-bottom: 0;
    text-align: left;
}
</style>