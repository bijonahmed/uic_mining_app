<template>
	<div>
		<div class="nav-container">
			<ul class="main-menu">
				<li v-if="isLoggedIn">
					<nuxt-link to='/'><img src="/assets/img/content/icons/1.png" alt=""><strong
							class="special">Dashboard</strong> </nuxt-link>
				</li>

				<li v-else>
					<nuxt-link to='/login'><img src="/assets/img/content/icons/1.png" alt=""><strong
							class="special">Dashboard</strong> </nuxt-link>
				</li>

				<li v-if="isLoggedIn">
					<nuxt-link to='/wallet'><img src="/assets/img/content/icons/2.png" alt=""><strong class="special">My
							Wallet</strong> </nuxt-link>
				</li>
				<li v-else>
					<nuxt-link to='/login'><img src="/assets/img/content/icons/2.png" alt=""><strong class="special">My
							Wallet</strong> </nuxt-link>
				</li>

				<!-- <li v-if="isLoggedIn">
					<nuxt-link to='/kyc'><img src="/assets/img/16.png" alt=""><strong class="special">KYC</strong>
					</nuxt-link>
				</li> -->

				<li v-else>
					<nuxt-link to='/login'><img src="/assets/img/16.png" alt=""><strong class="special">KYC</strong>
					</nuxt-link>
				</li>

				
				<li v-if="isLoggedIn">
					<nuxt-link to='/p2p'><img src="/assets/img/content/icons/6.png" alt=""><strong
							class="special">P2P</strong> </nuxt-link>
				</li>

				<li v-else>
					<nuxt-link to='/login'><img src="/assets/img/content/icons/6.png" alt=""><strong
							class="special">Send/Receive</strong> </nuxt-link>
				</li>

				

				<li v-if="isLoggedIn">
					<nuxt-link href='/affiliate'><img src="/assets/img/content/icons/4.png" alt=""><strong
							class="special">Affiliate System</strong> </nuxt-link>
				</li>

				<li v-else>
					<nuxt-link href='/login'><img src="/assets/img/content/icons/4.png" alt=""><strong
							class="special">Affiliate System</strong> </nuxt-link>
				</li>
				<li v-if="isLoggedIn">
					<nuxt-link to='/community'><img src="/assets/img/content/icons/11.png"
							alt=""><strong>Community</strong></nuxt-link>
				</li>

				<li v-else>
					<nuxt-link to='/login'><img src="/assets/img/content/icons/11.png"
							alt=""><strong>Community</strong></nuxt-link>
				</li>

				<li>
					<nuxt-link to='/post'><img src="/assets/img/content/icons/11.png"
							alt=""><strong>Post</strong></nuxt-link>
				</li>

				

				<!-- <li v-if="isLoggedIn">
					<nuxt-link to="/deposit"><img src="/assets/img/content/icons/8.png" alt=""><strong
							class="special">Deposit</strong></nuxt-link>
				</li>

				<li v-else>
					<nuxt-link to="/login"><img src="/assets/img/content/icons/8.png" alt=""><strong
							class="special">Deposit</strong></nuxt-link>
				</li> -->


				<li v-if="isLoggedIn">
					<nuxt-link to="/withdraw"><img src="/assets/img/content/icons/8.png" alt=""><strong
							class="special">Withdrawl</strong></nuxt-link>
				</li>

				<li v-else>
					<nuxt-link to="/login"><img src="/assets/img/content/icons/8.png" alt=""><strong
							class="special">Withdrawl</strong></nuxt-link>
				</li>

				<li v-if="isLoggedIn">
					<nuxt-link to="/profile"><img src="/assets/img/content/icons/10.png" alt=""><strong
							class="special">User Profile</strong></nuxt-link>
				</li>

				<li v-else>
					<nuxt-link to="/login"><img src="/assets/img/content/icons/10.png" alt=""><strong
							class="special">User Profile</strong></nuxt-link>
				</li>

				<li v-if="!isLoggedIn">
					<nuxt-link to='/login'><img src="/assets/img/content/icons/9.png"
							alt=""><strong>Login</strong></nuxt-link>
				</li>

				<li v-if="!isLoggedIn">
					<nuxt-link to='/register'><img src="/assets/img/content/icons/9.png"
							alt=""><strong>Register</strong></nuxt-link>
				</li>


				<li v-if="isLoggedIn">
					<a href="#" @click="logout"><i class="fa fa-sign-out" aria-hidden="true"></i><strong class="special">Logout</strong></a>
				</li>

			</ul>
		</div>

		<!-- Modal HTML -->

	</div>
</template>

<script setup>
import $ from 'jquery';
import { useUserStore } from '~~/stores/user'
import { storeToRefs } from 'pinia';
import { useCartStore } from '~~/stores/cart';
const userStore = useUserStore();
const { isLoggedIn } = storeToRefs(userStore)
const cartStore = useCartStore()

const userRoleIsAdmin = computed(() => userStore.role_id === 1);
const userStatusIsAdmin = computed(() => userStore.status === 1);

computed(async () => {
	try {
		await userStore.getUser()
	} catch (error) { }
})
const logout = async () => {
	const router = useRouter(); // Get the router object
	try {
		//if (res) {

		await userStore.logout();
		localStorage.removeItem('token');
		router.push('/'); // Redirect to the root route
		return;
		//}
	} catch (error) {
		console.error(error);
	}
};
</script>
