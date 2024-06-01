<template>
    <div>
      <title>Signup</title>
  
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
          <!-- <Header/> -->
          <!-- Footer menu -->
          <Footer />
          <!-- Page content start -->
          <main class="margin mt-0">
            <div class="dash-balance">
              <div class="dash-content relative">
                <h3 class="w-text">Signup</h3>
                <div class="notification">
                
                </div>
              </div>
            </div>
  
            <section class="bal-section container">
				<div class="container">
					<div class="form-divider"></div>

					<div class="form-row-group with-icons">
						<div class="form-row no-padding">
							<i class="fa fa-envelope"></i>
							<input type="email" name="aaa" class="form-element" placeholder="Username or Email">
						</div>
						<div class="form-row no-padding">
							<i class="fa fa-lock"></i>
							<input type="password" name="aaa" class="form-element" placeholder="Password">
						</div>
					</div>

					<div class="form-divider"></div>

					<div class="form-row">
						<a href="Javascript:void(0);" class="button circle block orange">Login</a>
					</div>

					<div class="form-row txt-center mt-15">
						Don't you have an account yet? <nuxt-link to='/signup'>Sign Up</nuxt-link>
					</div>

				</div>

                </section>


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