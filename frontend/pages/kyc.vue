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
					<h2 style="color: #4e4e4e;">Verify Account</h2>
					<span class="short-title">verify your account using Passport / CNIC / Driving License.</span>
				</div>

				<!-- Select Verification Method -->

				<section>
					<form action="#">
						<h2>Choose One</h2>
						<div class="d-flex justify-content-space-between">
							<button class="btn active">
								<i class="fa fa-id-card"></i>
								<span>CNIC</span>
							</button>
							<button class="btn">
								<i class="fa fa-passport"></i>
								<span>Passport</span>
							</button>
							<button class="btn">
								<i class="fa fa-id-card"></i>
								<span>Driving License</span>
							</button>
						</div>

						<div class="d-flex justify-content-center" style="margin-top: 60px;">
							<div class="front-back">
								<img src="/assets/img/2.png" alt="Front">
								<button class="upload-btn">Upload</button>
							</div>
							<div class="front-back">
								<img src="/assets/img/1.png" alt="Back">
								<button class="upload-btn">Upload</button>
							</div>
						</div>
						<button type="submit" class="submit-btn">Submit</button>
					</form>
				</section>
				<SocialFooter/>
			</main>
		</div>
	</div>
</template>


<script setup>
import Sidebar from "~/layouts/Sidebar.vue";
import HeaderThird from "~/layouts/HeaderThird.vue";
import SocialFooter from "~/components/SocialFooter.vue";

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