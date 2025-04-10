// composables/watchIdleLogout.js
import { onMounted, onUnmounted } from 'vue';
import { useRouter } from 'vue-router';
import { useUserStore } from '~/stores/user';

//5 minite  =300000
export function useIdleLogout(idleTime = 300000) {
  const router = useRouter();
  const userStore = useUserStore();
  let idleTimeout;

  const logout = async () => {
    console.log('User is being logged out due to inactivity'); // Log when logging out
    try {
      await userStore.logout();
      localStorage.removeItem('token');
      await router.push('/'); // Redirect to the root route
      window.location.reload(); // Reload the page
    } catch (error) {
      console.error("Logout error:", error);
    }
  };

  const resetIdleTimer = () => {
   // console.log('Idle timer reset'); // Log when the idle timer is reset
    clearTimeout(idleTimeout);
    idleTimeout = setTimeout(logout, idleTime);
  };

  const handleUserActivity = () => {
    //console.log('User activity detected, resetting timer'); // Log on user activity
    resetIdleTimer();
  };

  onMounted(() => {
    document.addEventListener('mousemove', handleUserActivity);
    document.addEventListener('keydown', handleUserActivity);
    resetIdleTimer();
  });

  onUnmounted(() => {
    document.removeEventListener('mousemove', handleUserActivity);
    document.removeEventListener('keydown', handleUserActivity);
    clearTimeout(idleTimeout);
  });
}
