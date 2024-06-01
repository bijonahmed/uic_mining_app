<template>
    <title>Chat</title>
    <!-- <AdminLayout> -->


    <div class="container">
        <div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white">
            <div class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom">
                <input class="fs-5 fw-semibold" v-model="username" />
            </div>
            <div class="list-group list-group-flush border-bottom scrollarea">
                <div class="list-group-item list-group-item-action py-3 lh-tight" v-for="message in messages"
                    :key="message">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <strong class="mb-1">{{ message.username }}</strong>
                    </div>
                    <div class="col-10 mb-1 small">{{ message.message }}</div>
                </div>
            </div>
        </div>
        <form @submit.prevent="submit">
            <input class="form-control" placeholder="Write a message" v-model="message" />
        </form>
    </div>



    <!-- </AdminLayout> -->
</template>
<script setup>
import { ref, onMounted } from 'vue';
import Pusher from 'pusher-js';
import axios from 'axios';

const username = ref('username');
const message = ref('');
const messages = ref([]);


onMounted(() => {
  Pusher.logToConsole = true;
  const pusher = new Pusher('300d162fd051675e56e4', {
    cluster: 'ap2',
  });

  const channel = pusher.subscribe('chat');
  channel.bind('message', data => {
    if (data && data.message) {
      messages.value.push(data);
    }
  });
});

const submit = async () => {
  if (message.value.trim() === '') {
    console.log('Message is empty, not sending.');
    return;
  }

  try {
    const response = await axios.post('/messages', {
      username: username.value,
      message: message.value,
    });

    console.log('Message sent:', response.data);
    message.value = '';
  } catch (error) {
    console.error('Error sending message:', error);
  }
};

</script>