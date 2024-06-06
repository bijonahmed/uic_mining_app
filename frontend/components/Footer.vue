<template>
    <div>
        <div class="bottom-menu-section">
				<ul class="bottom-menu list-unstyled list-inline">
					<li>
						<nuxt-link to='/'> <i class="fa-duotone fa-home menuli"></i> <p>Home</p></nuxt-link>
					</li>
					<li v-if="isLoggedIn">
						<nuxt-link to='/wallet'><i class="fa-duotone fa-wallet menuli"></i><p>Wallet</p></nuxt-link>
					</li>
					<li v-else>
						<nuxt-link to='/login'><i class="fa-duotone fa-wallet menuli"></i><p>Wallet</p></nuxt-link>
					</li>
					<li v-if="isLoggedIn">
						<nuxt-link class="b-m-pluse" to="/community"><i class="fa fa-plus"></i></nuxt-link>
					</li>
					<li v-else>
						<nuxt-link class="b-m-pluse" to="/login"><i class="fa fa-plus"></i></nuxt-link>
					</li>
					<li v-if="isLoggedIn">
						<nuxt-link to='/ledger'> <i class="fa-duotone fa-file menuli"></i><p>Ledger</p> </nuxt-link>
					</li>
					<li v-else>
						<nuxt-link to='/login'> <i class="fa-duotone fa-file menuli"></i><p>Ledger</p> </nuxt-link>
					</li>
					<li v-if="isLoggedIn">
						<nuxt-link to='/profile'><i class="fa-duotone fa-user menuli"></i><p>Profile</p></nuxt-link>
					</li>
					<li v-else>
						<nuxt-link to='/login'><i class="fa-duotone fa-user menuli"></i><p>Profile</p></nuxt-link>
					</li>
				</ul>
			</div> 
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

</script>

<style>

.menuli{
	font-size: 25px; color: #1a6ca9; width: 100%;text-align: center;
}
</style>
