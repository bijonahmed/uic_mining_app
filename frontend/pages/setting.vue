<template>
    <div>
        <title>Setting</title>

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
                <main >
                    <div class="dash-balance mb-3">
                        <div class="dash-content relative">
                            <h3 class="w-text">Setting</h3>
                            <div class="notification">

                            </div>
                        </div>
                    </div>

                    <div class="container">

                        <form id="settingsForm">

                            <div class="list-box">
                                <div class="list-item">
                                    <span class="list-item-title">
                                        <small style="margin-right: 15px;">1.</small>
                                        Community <small class="text-muted">(English)</small></span>

                                    <div class="sweet-check">
                                        <input type="checkbox" name="chart" value="1">
                                        <div class="outline">
                                            <span></span>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="list-box">
                                <div class="list-item">
                                    <span class="list-item-title">
                                        <small style="margin-right: 15px;">2.</small>
                                        Community <small class="text-muted">(Chinese)</small></span>

                                    <div class="sweet-check">
                                        <input type="checkbox" name="calculator" value="1" checked>
                                        <div class="outline">
                                            <span></span>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="list-box">
                                <div class="list-item">
                                    <span class="list-item-title">
                                        <small style="margin-right: 15px;">3.</small>
                                        Community <small class="text-muted">(Arabic)</small></span>

                                    <div class="sweet-check">
                                        <input type="checkbox" name="bookmark" value="1" checked>
                                        <div class="outline">
                                            <span></span>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="list-box">
                                <div class="list-item">
                                    <span class="list-item-title">
                                        <small style="margin-right: 15px;">4.</small>
                                        Community <small class="text-muted">(Malasian)</small></span>

                                    <div class="sweet-check">
                                        <input type="checkbox" name="documents" value="1">
                                        <div class="outline">
                                            <span></span>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="list-box">
                                <div class="list-item">
                                    <span class="list-item-title">
                                        <small style="margin-right: 15px;">5.</small>
                                        Community <small class="text-muted">(Hindi/Urdu)</small></span>

                                    <div class="sweet-check">
                                        <input type="checkbox" name="sourcecode" value="1">
                                        <div class="outline">
                                            <span></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-divider"></div>
                            <div class="form-row mb-70">
                                <a href="#" class="button circle block orange" id="getCheckedButton">
                                    <i class="fa fa-crown" style="color: rgb(255, 217, 0);margin-right: 10px;"></i>
                                    Premium Community
                                </a>
                            </div>
                            <div class="form-divider"></div>

                        </form>

                    </div>
                    <div class="col-md-12 adv" id="techyar-adv-cont" accesskey="27423529011101" lang="eng" data="10012">
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

</script>


<style scoped>
.dash-balance {
    background: url(/assets/img/content/dash-bg.png) no-repeat center center;
    background-size: cover;
    position: relative;
    overflow: hidden;
    padding: 15px 20px 10px;
}
</style>