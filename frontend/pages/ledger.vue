<template>
    <div>
        <title>Ledger</title>

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
                <Header />
                <!-- Footer menu -->
                <Footer />
                <!-- Page content start -->
                <!-- Page content start -->
			<main class="margin mt-0">

<div class="dash-balance">
    <div class="dash-content relative">
        <h3 class="w-text">Ledger</h3>
        <div class="notification">
            <a href="#"><i class="fa fa-plus"></i></a>
        </div>
    </div>
</div>

<section class="bal-section container">

    <div class="resources-card-wrapper">
        <div class="wallet-card mr-10 round">
            <div class="flex-column flex-md-row">
                <h3 class="">Total Holders</h3>
                <p class="mb-0 font-weight-medium"><i class="txt-green fa fa-arrow-up mr-10"></i>11.6M
                    Users </p>
            </div>
        </div>

        <div class="wallet-card ml-10">
            <div class="flex-column flex-md-row">
                <h3 class="">Total Circulating Coins</h3>
                <p class="mb-0 font-weight-medium"><i class="txt-red fa fa-arrow-down mr-10"></i>20.2M
                    Coins </p>
            </div>
        </div>
    </div>

</section>


<section class="container">
    <h4 class="title-main mt-5">Top Members</h4>
    <ul class="transaction-list list-unstyled">
        <li>
            <div class="d-flex align-items-center justify-content-between">
                <div class="ml-10">
                    <small class="text-muted">
                        <span style="padding-right: 0px;border: none;margin-right: 5px;">1.
                        </span>TR9waBrjeBZNAz11q4qVLCgLs8dM1R</small>
                </div>
                <div>
                    <small class="d-block mb-0 txt-green">+0.94846 <span
                            class="text-muted">BTC</span></small>
                    <!--<small class="text-white border-radius" style="background-color: rgb(119, 0, 255);">Level 1</small>
              </div>-->
                </div>
            </div>
        </li>
        <li>
            <div class="d-flex align-items-center justify-content-between">
                <div class="ml-10">
                    <small class="text-muted">
                        <span style="padding-right: 5px;border: none;margin-right: 5px;">2.
                        </span>TR9waBrjeBZNAz11q4qVLCgLs8dM1R</small>
                </div>
                <div>
                    <small class="d-block mb-0 txt-green">+0.94846 <span
                            class="text-muted">BTC</span></small>
                    <!--<small class="text-white border-radius" style="background-color: rgb(119, 0, 255);">Level 1</small>
              </div>-->
                </div>
            </div>
        </li>
        <li>
            <div class="d-flex align-items-center justify-content-between">
                <div class="ml-10">
                    <small class="text-muted">
                        <span style="padding-right: 5px;border: none;margin-right: 5px;">3.
                        </span>TR9waBrjeBZNAz11q4qVLCgLs8dM1R</small>
                </div>
                <div>
                    <small class="d-block mb-0 txt-green">+0.94846 <span
                            class="text-muted">BTC</span></small>
                    <!--<small class="text-white border-radius" style="background-color: rgb(119, 0, 255);">Level 1</small>
              </div>-->
                </div>
            </div>
        </li>
        <li>
            <div class="d-flex align-items-center justify-content-between">
                <div class="ml-10">
                    <small class="text-muted">
                        <span style="padding-right: 5px;border: none;margin-right: 5px;">4.
                        </span>TR9waBrjeBZNAz11q4qVLCgLs8dM1R</small>
                </div>
                <div>
                    <small class="d-block mb-0 txt-green">+0.94846 <span
                            class="text-muted">BTC</span></small>
                    <!--<small class="text-white border-radius" style="background-color: rgb(119, 0, 255);">Level 1</small>
              </div>-->
                </div>
            </div>
        </li>
    </ul>
</section>

<footer>
    <div class="container">
        <ul>
            <li><a href="#"><i class="fab fa-facebook"></i></a></li>
            <li><a href="#"><i class="fab fa-twitter"></i></a></li>
            <li><a href="#"><i class="fab fa-pinterest"></i></a></li>
            <li><a href="#"><i class="fab fa-instagram"></i></a></li>
        </ul>
        <p>Copyright © All Right Reserved</p>
    </div>
</footer>
</main>
                <!-- Page content end -->
            </div>
        </div>
    </div>
</template>


<script setup>
import Sidebar from "~/layouts/Sidebar.vue";
import Header from "~/layouts/Header.vue";
</script>

