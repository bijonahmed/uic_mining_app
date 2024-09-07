<template>
    <form @submit.prevent="startProgress" id="formrest" enctype="multipart/form-data">
      <div class="serv-item">
        <center>
          <div class="loading-indicator" v-if="loading" style="text-align: center">
            <Loader />
          </div>
        </center>  
  
        <!-- Submit Button -->
        <button type="submit" class="serv-icon btnsize" :disabled="isCountdownActive">
          <img src="/assets/img/mining.png" style="width: 40px" alt="Mining Icon" />
        </button>
  
        <span class="text ">Minning</span>
        
        <!-- Countdown Timer Component -->
        <!-- <center>
          <CountdownTimerStart/>
        </center> -->
      </div>
    </form>
  </template>
  
  <script setup>
  import { ref } from 'vue';
  import { useRouter } from 'vue-router';
  import axios from 'axios';
  import { useStartStore } from '~/stores/start';
  
  const myStore = useStartStore();
  const remainingTime = ref(null)
  const intervalId = ref(null)
  const isCountdownActive = ref(false)
  const router = useRouter();

  const fetchData = async () => {
    await myStore.getSoreData()
    startCountdown()
  }

  const startCountdown = () => {
  const serverNow = new Date(myStore.server_time).getTime()
  const endTime = new Date(myStore.end_time).getTime()
  
  if (serverNow < endTime) {
    remainingTime.value = endTime - serverNow
    isCountdownActive.value = true // Disable the button

    intervalId.value = setInterval(() => {
      remainingTime.value -= 1000
      if (remainingTime.value <= 0) {
        clearInterval(intervalId.value)
        remainingTime.value = 0
        isCountdownActive.value = false // Re-enable the button when countdown is finished
      }
    }, 1000)
  } else {
    remainingTime.value = 0
    isCountdownActive.value = false // Ensure the button is enabled if countdown is not active
  }
}
  
  const buttonClicked = ref(true);  // Initially disabled
  const loading = ref(false);
  
  const startProgress = () => {
    loading.value = true;
  
    const formData = new FormData();
    formData.append("mining_category_id", 1);  // Replace with actual category ID
  
    const headers = {
      "Content-Type": "multipart/form-data",
    };
  
    axios.post("/mining/miningProcess", formData, { headers })
      .then((res) => {
        if (res.data.status === 1) {
          router.push('/success-mining');
        } else {
          router.push('/error-mining');
        }
      })
      .catch((error) => {
        console.error("An error occurred:", error);
      })
      .finally(() => {
        setTimeout(() => {
          loading.value = false;
        }, 8000);
      });
  };
  onMounted(() => {
    fetchData()
  })
 
  </script>
  