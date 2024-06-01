<template>
  <div>
    <title>Trading</title>

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
              <h3 class="w-text">Trading Market</h3>
              <div class="notification">

              </div>
            </div>
          </div>

          <section class="bal-section container">
            <div class="coin-box">
              <div class="d-flex align-items-center justify-content-between">
                <div class="d-flex align-items-center">
                  <img class="img-xs" src="/assets/img/content/coin1.png" alt="coin image">
                  <div class="ml-10">
                    <h3 class="coin-name">Bitcoin</h3>
                    <small class="text-muted">$76,312,373</small>
                  </div>
                </div>
                <div>
                  <small class="d-block mb-0 txt-green"><i
                      class="txt-green fa fa-arrow-up mr-10 mb-5"></i>$6,839</small>
                  <small class="text-muted d-block">increase 6.34%</small>
                </div>
              </div>
              <div class="watch-chart mt-15">
                <span class="watch1"><canvas></canvas></span>
              </div>

            </div>
          </section>

          <section class="mt-15 mb-15 container">
            <div class="coin-box">
              <div class="d-flex align-items-center justify-content-between">
                <div class="d-flex align-items-center">
                  <img class="img-xs" src="/assets/img/content/coin2.png" alt="coin image">
                  <div class="ml-10">
                    <h3 class="coin-name">Ethereum</h3>
                    <small class="text-muted">$55,532,854</small>
                  </div>
                </div>
                <div>
                  <small class="d-block mb-0 txt-green"><i
                      class="txt-green fa fa-arrow-up mr-10 mb-5"></i>$1,013</small>
                  <small class="text-muted d-block">increase 7.96%</small>
                </div>
              </div>
              <div class="watch-chart mt-15">
                <span class="watch2"><canvas></canvas></span>
              </div>

            </div>
          </section>
          <SocialFooter />

        </main>
        <!-- Page content end -->
      </div>
    </div>
  </div>
</template>


<script setup>
import Sidebar from "~/layouts/Sidebar.vue";
import HeaderSecond from "~/layouts/HeaderSecond.vue";
import SocialFooter from "~/components/SocialFooter.vue";

</script>