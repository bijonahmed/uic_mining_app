<template>
  <div>
    <title>Wallet</title>

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
        <main class="margin mt-0">
          <div class="dash-balance">
            <div class="dash-content relative">
              <h3 class="w-text">My Wallet</h3>
              <div class="notification">
                <a href="#"><i class="fa fa-plus"></i></a>
              </div>
            </div>
          </div>

          <section class="bal-section container">
            <div class="resources-card-wrapper">
              <div class="wallet-card mr-10 round">
                <div class="flex-column flex-md-row">
                  <h3 class="">My Assets</h3>
                  <p class="mb-0 font-weight-medium">
                    <i class="txt-green fa fa-arrow-up mr-10"></i>0.8224 BTc
                  </p>
                </div>
              </div>

              <div class="wallet-card ml-10">
                <div class="flex-column flex-md-row">
                  <h3 class="">Assets (USD)</h3>
                  <p class="mb-0 font-weight-medium">
                    <i class="txt-red fa fa-arrow-down mr-10"></i>1.2629 ETH
                  </p>
                </div>
              </div>
            </div>
            <div class="resources-card-wrapper mt-15">
              <div class="wallet-card mr-10">
                <div class="flex-column flex-md-row">
                  <h3 class="">Ripple Wallet</h3>
                  <p class="mb-0 font-weight-medium">
                    <i class="txt-red fa fa-arrow-down mr-10"></i>8,954.3 XRP
                  </p>
                </div>
              </div>

              <div class="wallet-card ml-10">
                <div class="flex-column flex-md-row">
                  <h3 class="">Dash Wallet</h3>
                  <p class="mb-0 font-weight-medium">
                    <i class="txt-green fa fa-arrow-up mr-10"></i>1.269 DASH
                  </p>
                </div>
              </div>
            </div>
          </section>
          <div
            class="col-md-12 adv"
            id="techyar-adv-cont"
            accesskey="27423529011101"
            lang="eng"
            data="10012"
          ></div>
        </main>
        <!-- Page content end -->
      </div>
    </div>
  </div>
</template>


<script setup>
import Sidebar from "~/layouts/Sidebar.vue";
import HeaderSecond from "~/layouts/HeaderSecond.vue";

</script>