<template>
    <div>
        <title>Buy Sell</title>

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
                            <h3 class="w-text">Send/Receive</h3>
                            <div class="notification">
                                <!-- <a href="#"><i class="fa fa-plus"></i></a> -->
                            </div>
                        </div>
                    </div>

                    <section class="bal-section container">
                        <div id="content">

                            <div id="content-body">



                                <section class="wallets-list container">

                                    <h4 class="title-main">Place Sell Order</h4>
                                    <div class="wallet-address">
                                        <h3 class="w-text mb-30 mt-0">Send currency</h3>


                                        <div class="txt-left">
                                            <label class="g-text">Username</label>
                                            <div class="form-row-group with-icons">
                                                <div class="form-row no-padding">
                                                    <img src="/assets/img/content/2.png" class="icon" alt="">
                                                    <input type="text" name="aaa" class="form-element"
                                                        value="Type Username">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-mini-divider"></div>

                                        <div class="txt-left">
                                            <label class="g-text">Verify Name</label>
                                            <div class="form-row-group with-icons">
                                                <div class="form-row no-padding">
                                                    <img src="/assets/img/content/2.png" class="icon" alt="">
                                                    <input type="text" name="aaa" class="form-element"
                                                        value="Account Name">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-mini-divider"></div>

                                        <div class="txt-left">
                                            <label class="g-text">Type Password</label>
                                            <div class="form-row-group with-icons">
                                                <div class="form-row no-padding">
                                                    <img src="/assets/img/content/3.png" class="icon" alt="">
                                                    <input type="password" name="aaa" class="form-element"
                                                        value="KDLAD4523AAI">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-mini-divider"></div>

                                        <div class="txt-left calc-crr">
                                            <label class="g-text">Select Wallet</label>
                                            <div class="form-row-group with-icons">
                                                <div class="form-row no-padding">
                                                    <img src="/assets/img/content/2.png" class="icon" alt="">

                                                    <select class="form-element">
                                                        <option value="" selected>Binance</option>
                                                        <option value="1">Trust Wallet</option>
                                                        <option value="1">Meta Mask</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="txt-left calc-crr-mid">
                                            <img src="/assets/img/content/exchange.png" class="mt-15" alt="">
                                        </div>
                                        <div class="txt-left calc-crr">
                                            <label class="g-text">Amount</label>
                                            <div class="form-row-group with-icons">
                                                <div class="form-row no-padding">
                                                    <img src="/assets/img/content/2.png" class="icon" alt="">
                                                    <input type="text" name="aaa" class="form-element"
                                                        placeholder="0.0001">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-mini-divider"></div>

                                        <div><a href="#" class="button circle block yellow"
                                                id="getCheckedButton2">Send</a>
                                        </div>

                                    </div>


                                </section>

                                <section class="container">
                                    <h4 class="title-main">Easy Crypto Trading</h4>
                                    <div class="resources-card-wrapper mt-15">
                                        <a class='buy-card mr-10' href='#'>
                                            <div class="flex-column flex-md-row">
                                                <img src="/assets/img/content/p1.png" alt="">
                                                <h4>Total Sent</h4>
                                                <p class="g-text mb-0 font-weight-medium">1000$ Has Been Sent in Last 30
                                                    Days. </p>
                                            </div>
                                        </a>

                                        <a class='buy-card ml-10' href='#'>
                                            <div class="flex-column flex-md-row">
                                                <img src="/assets/img/content/p2.png" alt="">
                                                <h4>Total Receive</h4>
                                                <p class="g-text mb-0 font-weight-medium">1000$ Has Received in Last 30
                                                    Days. </p>
                                            </div>
                                        </a>

                                    </div>
                                </section>


                                <section class="container">
                                    <h4 class="title-main">Recent Transactions</h4>
                                    <ul class="transaction-list list-unstyled">
                                        <li>
                                            <div class="d-flex align-items-center justify-content-between">
                                                <div class="d-flex align-items-center">
                                                    <img class="img-xs" src="/assets/img/content/s2.png"
                                                        alt="coin image">
                                                    <div class="ml-10">
                                                        <h4 class="coin-name">Hasan3241</h4>
                                                        <small class="text-muted">08-24 <span
                                                                class="ml-10">20.04PM</span></small>
                                                    </div>
                                                </div>
                                                <div>
                                                    <small class="d-block mb-0 txt-red">+0.94853</small>
                                                    <small class="text-muted d-block">$2,748.94</small>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="d-flex align-items-center justify-content-between">
                                                <div class="d-flex align-items-center">
                                                    <img class="img-xs" src="/assets/img/content/s1.png"
                                                        alt="coin image">
                                                    <div class="ml-10">
                                                        <h4 class="coin-name">Armanali</h4>
                                                        <small class="text-muted">08-24 <span
                                                                class="ml-10">20.04PM</span></small>
                                                    </div>
                                                </div>
                                                <div>
                                                    <small class="d-block mb-0 txt-green">+1.84993</small>
                                                    <small class="text-muted d-block">$3,748.94</small>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="d-flex align-items-center justify-content-between">
                                                <div class="d-flex align-items-center">
                                                    <img class="img-xs" src="/assets/img/content/s2.png"
                                                        alt="coin image">
                                                    <div class="ml-10">
                                                        <h4 class="coin-name">Sonia</h4>
                                                        <small class="text-muted">08-24 <span
                                                                class="ml-10">20.04PM</span></small>
                                                    </div>
                                                </div>
                                                <div>
                                                    <small class="d-block mb-0 txt-red">-23.84523</small>
                                                    <small class="text-muted d-block">$1,493.03</small>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="d-flex align-items-center justify-content-between">
                                                <div class="d-flex align-items-center">
                                                    <img class="img-xs" src="/assets/img/content/s1.png"
                                                        alt="coin image">
                                                    <div class="ml-10">
                                                        <h4 class="coin-name">Amna</h4>
                                                        <small class="text-muted">08-24 <span
                                                                class="ml-10">20.04PM</span></small>
                                                    </div>
                                                </div>
                                                <div>
                                                    <small class="d-block mb-0 txt-green">+500.347</small>
                                                    <small class="text-muted d-block">$239.94</small>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </section>

                                <footer>
                                    <div class="container">
                                       
                                    </div>
                                </footer>
                            </div>
                        </div>
                        </section>
				<SocialFooter/>
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