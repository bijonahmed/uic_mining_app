<!-- ~/components/CountdownTimer.vue -->
<template>
    <div>
        <!-- <button @click="fetchData">Get Data</button> -->
        <div>
            <p class="d-none">mining_category_id: {{ miningcategoryid }}</p>
            <p class="d-none">Start Time: {{ formattedStartTime }}</p>
            <p class="d-none">End Time: {{ formattedEndTime }}</p>
            <p  class="countTime">{{ formattedRemainingTime }}</p>
        </div>
    </div>
</template>

<script setup>
import { ref, computed, onUnmounted,onMounted } from 'vue'
import { useStartStore } from '~~/stores/start'
const myStore = useStartStore()
const remainingTime = ref(null)
const intervalId = ref(null)

const fetchData = async () => {
    await myStore.getSoreData()
    startCountdown()
}

const startCountdown = () => {
    const now = Date.now()
    const endTime = new Date(myStore.end_time).getTime()

    if (now < endTime) {
        remainingTime.value = endTime - now

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
    return myStore.start_time ? new Date(myStore.start_time).toLocaleString() : 'N/A'
})

const formattedEndTime = computed(() => {
    return myStore.end_time ? new Date(myStore.end_time).toLocaleString() : 'N/A'
})


const miningcategoryid = computed(() => {
    return myStore.mining_category_id;
})

const formattedRemainingTime = computed(() => {
    if (remainingTime.value === null) return 'N/A'
    const hours = Math.floor((remainingTime.value / (1000 * 60 * 60)) % 24)
    const minutes = Math.floor((remainingTime.value / (1000 * 60)) % 60)
    const seconds = Math.floor((remainingTime.value / 1000) % 60)
    return `${hours}h ${minutes}m ${seconds}s`
})



onMounted(async () => {
    fetchData();

});

onUnmounted(() => {
    if (intervalId.value) {
        clearInterval(intervalId.value)
    }
})
</script>