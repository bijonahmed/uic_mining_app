<template>
	<div>
		<title>Post</title>

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
					<div class="dash-balance mb-3 sticky-top" style="z-index: 2;">
						<div class="dash-content relative">
							<h3 class="w-text">Post</h3>
							<div class="notification">
								 
								<a href="/post-blog"><i class="fa fa-plus" @click="postPopup()"></i></a>
							</div>
						</div>
					</div>

					<div class="container">
						<center>
							<div class="loading-indicator" v-if="loading" style="text-align: center">
								<BulkLoader />
							</div>
						</center>

						<section class="post-sections">
							<div v-for="(vinfo, index) in data" :key="vinfo.id" class="w-100">
								<!-- Your post card content -->
								<div class="post-card w-100 mx-auto">
									<div class="d-flex align-items-normal w-100">
										<span class="member-img">
											<img src="/assets/img/content/avatar/user-4.png" alt="" />
										</span>
										<div class="ml-10">
											<h4 class="coin-name">{{ vinfo.postByname }}<i class="fa fa-bronze"></i>
											</h4>
											<small class="text-muted">
												<i class="fa-regular fa-calendar" style="margin-right: 6px;"></i>{{
													vinfo.createdAt }}
											</small>
											<br />
										</div>
									</div>
									<div class="description" id="description" onclick="toggleOverflow()"
										style="text-align: justify">
										{{ vinfo.description_full }}
									</div>

									<div v-if="vinfo.thumbnail_img !== ''">
										<img :src="vinfo.thumnail_img" alt="" class="img-fluid" />
									</div>
									<div class="d-flex align-items-end pt-2 justify-content-between lComment"
										@click="insertLike(vinfo)">
										<p v-if="vinfo.likeCount">{{ vinfo.likeCount }} Like</p>
										<p v-else>0 Like</p>
									</div>
									<div class="post-buttons">
										<button @click="likePost(vinfo)">
											<i class="fa-solid fa-thumbs-up active" v-if="vinfo.likeBy"></i>
											<i class="fa-regular fa-thumbs-up" v-else></i>
										</button>
										<button @click="shareModal(vinfo.id)">
											<i class="fa-regular fa-share"></i>Share
										</button>
									</div>
								</div>
								<div class="post-card w-100 mx-auto"  v-if="(index + 1) % 5 === 0">
									<NativeAds  class="mt-3 w-100 h-100 mx-auto d-flex" />
								</div>								
							</div>
						</section>


						<section class="bal-section supply_container container my-2">
						<div class="resources-card-wrapper mb-5">
							<!-- Conditionally render BannerAds after every 2 items  -->
						</div>
					</section>
						<br /><br /><br />
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
import { ref, watchEffect } from "vue";
import { useUserStore } from "~~/stores/user";
import { storeToRefs } from "pinia";
import axios from "axios";
import NativeAds from '~/components/NativeAds.vue'; // Adjust import path as needed

const userStore = useUserStore();
const router = useRouter();
const loading = ref(false);
const data = ref([]);



const shareModal = (id) => {

	copyAddressToClipboard(id);
}

const copyAddressToClipboard = (id) => {
	// Get the text to copy

	const walletAddress = window.location.origin + '/postdetails/?id=' + id;
	const textarea = document.createElement("textarea");
	textarea.value = walletAddress;
	textarea.setAttribute("readonly", "");
	textarea.style.position = "absolute";
	textarea.style.left = "-9999px"; // Move the textarea off-screen
	document.body.appendChild(textarea);
	textarea.select();
	document.execCommand("copy");
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
		},
	});

	Toast.fire({
		icon: "success",
		title: "Successfully copy",
	});
};

const fetchData = async () => {
	try {
		loading.value = true;
		const response = await axios.get("/post/allPosts");
		data.value = response.data;
	} catch (error) {
		console.error("Error fetching data:", error);
	} finally {
		loading.value = false;
	}
};

const postPopup = () => {
	router.push('/post-blog');

}


// Method to handle like button click
const likePost = async (post) => {
	const postId = `${post.id}`

	const response = await axios.get("/post/insertPostLikes", {
		params: {
			postId: postId,
		},
	});

	if (response.status === 200) {
		// Assuming the response status is 200 for success
		console.log("Like action successful:", response.data);
		fetchData(); // Call fetchData() after a successful response
	} else {
		console.error("Unexpected response status:", response.status);
	}




}


// Ensure that like counts and liked states are initialized correctly from local storage
onMounted(() => {
	fetchData();

})
// Call the function to show loader initially
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

.popup {
	width: 100%;
	height: 100%;
	display: none;
	justify-content: center;
	align-items: center;
	position: fixed;
	top: 0;
	background-color: #10101020;
	backdrop-filter: blur(10px);
}

.popup form {
	width: 95%;
	height: auto;
	padding: 10px;
	background-color: white;
	border-radius: 10px;
}

.popup form .heading-cut {
	display: flex;
	justify-content: space-around;
	align-items: center;
}

.popup form .text-box {
	width: 100%;
	height: auto;
}

.popup form .text-box label {
	font-size: 13px;
	color: #4e4e4e;
	display: block;
	width: 100%;
}

.popup form .text-box textarea {
	width: 100%;
	height: 100px;
	border-radius: 10px;
	padding: 10px;
}

.popup form .text-box .file-label {
	width: 80%;
	height: auto;
	color: #1a6ca9;
	padding: 15px;
	margin: 0 auto;
	display: block;
	margin-top: 15px;
	text-align: center;
	border-radius: 10px;
	background-color: #1a6ca910;
	border: 1.5px dashed #1a6ca9;
	cursor: pointer;
}

.popup form .text-box .file-label i {
	font-size: 30px;
	display: block;
	width: 100%;
	height: auto;
	text-align: center;
	margin-bottom: 15px;
}

input[type="file"] {
	display: none;
}

.popup form .publish-button {
	padding: 15px;
	width: 90%;
	display: block;
	margin: 0 auto;
	background-color: #1a6ca9;
	color: white;
	font-size: 17px;
	border: none;
	border-radius: 10px;
	margin-top: 20px;
}

.lComment p {
	font-size: 11px;
	margin-bottom: 0;
}

.post-buttons {
	margin-top: 5px !important;
}

/* Default styling for the thumbs-up icon */
.fa-solid.fa-thumbs-up {
	color: #6c757d;
	/* Gray color for non-active state */
	transition: color 0.3s ease;
	/* Smooth transition for color change */
}

/* Styling when the active class is applied */
.fa-solid.fa-thumbs-up.active {
	color: #007bff;
	/* Blue color for the active (liked) state */
}
</style>