<template>
    <div>
        <center v-if="isLoggedIn">
            <div class="loading-indicator" v-if="loading" style="text-align: center">
                <Loader />
            </div>
        </center>

        <main class="mt-0">

            <section class="main_section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="main_content">
                                <div>
                                    <img src="/assets/img/uic.png" style="max-width: 150px;" alt="" class="img-fluid mx-auto d-flex ">
                                    <h1>Download our app</h1>
                                    <h6>Available on </h6>
                                    <div class="app_section">
                                        <a href="https://api.uicmax.com/mobileapp/uic.apk">
                                            <img src="/android.png" alt="" class="img-fluid">
                                            <p>For Android</p>
                                        </a>
                                        <a href="#">
                                            <img src="/apple.png" alt="" class="img-fluid">
                                            <p>For IOS</p>
                                        </a>
                                    </div>
                                    <span>Or <br> <nuxt-link to="/child">Skip & use web</nuxt-link></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </main>
    </div>
</template>

<script setup>

</script>

<style setup></style>