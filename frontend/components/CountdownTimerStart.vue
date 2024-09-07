<template>
  <div>
    <p class="d-none">Server Time: {{ formattedServerTime }}</p>
    <!-- <hr/> -->
    <p class="d-none">Start Time: {{ formattedStartTime }}</p>
    <p class="d-none">End Time: {{ formattedEndTime }}</p>
    <p class="d-none">Mining Category ID: {{ miningCategoryId }}</p>
    <p class="countTime">{{ formattedRemainingTime }}</p>
  </div>
</template>

<script setup>
import { ref, computed, onUnmounted, onMounted } from 'vue'
import { useStartStore } from '~/stores/start'

const myStore = useStartStore()
const remainingTime = ref(null)
const intervalId = ref(null)

const fetchData = async () => {
  await myStore.getSoreData()
  startCountdown()
}

const startCountdown = () => {
  const serverNow = new Date(myStore.server_time).getTime()
  const endTime = new Date(myStore.end_time).getTime()
  const startTime = new Date(myStore.start_time).getTime()

  if (serverNow < endTime) {
    remainingTime.value = endTime - serverNow

    intervalId.value = setInterval(() => {
      remainingTime.value -= 1000
      if (remainingTime.value <= 0) {
        clearInterval(intervalId.value)
        remainingTime.value = 0
      }
    }, 1000)
  } else {
    remainingTime.value = 0
  }
}

const formattedStartTime = computed(() => {
  return myStore.start_time ? new Date(myStore.start_time).toLocaleString() : ''
})


const formattedEndTime = computed(() => {
  return myStore.end_time ? new Date(myStore.end_time).toLocaleString() : ''
})

const formattedServerTime = computed(() => {
  return myStore.server_time ? new Date(myStore.server_time).toLocaleString() : ''
})

const miningCategoryId = computed(() => {
  return myStore.mining_category_id
})

const formattedRemainingTime = computed(() => {
  if (remainingTime.value === null) return ''
  const hours = Math.floor((remainingTime.value / (1000 * 60 * 60)) % 24)
  const minutes = Math.floor((remainingTime.value / (1000 * 60)) % 60)
  const seconds = Math.floor((remainingTime.value / 1000) % 60)
  return `${hours}:${minutes}:${seconds}`
})

onMounted(() => {
  fetchData()
})

onUnmounted(() => {
  if (intervalId.value) {
    clearInterval(intervalId.value)
  }
})
</script>
<style>
/* .timerCountdown {
  height: 100px;
  width: 100px;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 50%;
  border: 2px solid #25509d;
  color: #fff;
  margin: 10px auto;
  filter: drop-shadow(2px 3px 5px #6a6363);
}
.timerCountdown p {
  color: #25509d;
  filter: drop-shadow(2px 2px #ffffff6e);
} */
</style>