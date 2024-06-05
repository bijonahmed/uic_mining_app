<template>
  <div>
    <title>Chat Box</title>
    <div class="nav-menu">
      <nav class="menu">
        <Sidebar />
      </nav>
    </div>

    <div class="wrapper-inline">
      <HeaderThird />
      <Footer />
      <!-- Page content start -->
      <main>
        <div class="container">
          <center>
            <h4>
              <u>{{ community_slug }}</u>
            </h4>
          </center>
          <!-- Start Chat HTML -->
          <div class="chat-box">
            <div class="chat-header d-none">
              <input type="text" v-model="username" class="username-input" placeholder="Enter your username" readonly />
            </div>
            <div class="chat-messages scrollarea">
              <div v-for="message in messages" :key="message.id"
                :class="{ 'message-container': true, 'sent': message.username === username, 'received': message.username !== username }">
                <div class="message">
                  <div class="message-username">{{ message.name }}</div>
                  <div class="message-text">
                    {{ message.message }}
                    <small>{{ formatTimestamp(message.created_at) }}</small>  
                  </div>
                </div>
              </div>
            </div>
            <form @submit.prevent="submit" class="chat-form">
              <input class="message-input" placeholder="Write a message" v-model="message" />
            </form>
          </div>


          <!-- END  -->
        </div>
      </main>
    </div>
  </div>
</template>


<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';
import { format } from 'date-fns'; // Ensure correct import
import { useRouter } from "vue-router";
const router = useRouter();

import Sidebar from "~/layouts/Sidebar.vue";
import HeaderSecond from "~/layouts/HeaderSecond.vue";
import HeaderThird from "~/layouts/HeaderThird.vue";
import SocialFooter from "~/components/SocialFooter.vue";


//const username = ref('r@gmail.com')
const message = ref('');

const messages = ref([])

const communitySlug = ref(router.currentRoute.value.query.slug);
const username = ref(router.currentRoute.value.query.username);
const name = ref(router.currentRoute.value.query.name);
const { $echo } = useNuxtApp();

const formatTimestamp = (timestamp) => {
  return format(new Date(timestamp), 'HH:mm'); // Format to only show hours and minutes
};

onMounted(async () => {
  await fetchMessages();

  $echo.channel(`chat.${communitySlug.value}`)
    .listen('.message', (data) => {
      if (data && data.community_slug === communitySlug.value) {
        messages.value.push(data);
      }
    });
});

const fetchMessages = async () => {
  try {
    const response = await axios.get(`/messages/${communitySlug.value}`);
    messages.value = response.data;


  } catch (error) {
    console.error('Error fetching messages:', error);
  }
};

const submit = async () => {
  if (message.value.trim() === '') {
    console.log('Message is empty, not sending.');
    return;
  }

  try {
    const response = await axios.post('/messages', {
      username: username.value,
      message: message.value,
      community_slug: communitySlug.value,
      username: username.value,
    });

    console.log('Message sent:', response.data);
    message.value = '';
  } catch (error) {
    console.error('Error sending message:', error);
  }
};
</script>



<style scoped>
/* Container styling */
.container {
  max-width: 600px;
  margin: 50px auto;
  padding: 0 20px;
}

/* Chat box styling */
.chat-box {
  display: flex;
  flex-direction: column;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  background: #f9f9f9;
}

/* Header styling */
.chat-header {
  background: linear-gradient(to right, #4a90e2, #7b61ff);
  padding: 10px 15px;
}

.username-input {
  width: 100%;
  padding: 10px;
  border: none;
  border-radius: 5px;
  font-size: 16px;
  color: #333;
  outline: none;
}

/* Messages area styling */
.scrollarea {
  flex-grow: 1;
  overflow-y: auto;
  padding: 20px;
  background: #fff;
  display: flex;
  flex-direction: column;
}

/* Message container styling */
.message-container {
  display: flex;
  margin: 10px 0;
}

.message-container.sent {
  justify-content: flex-end;
}

.message-container.received {
  justify-content: flex-start;
}

.message {
  max-width: 80%;
  padding: 10px 15px;
  border-radius: 15px;
  background: #333;
  color: #fff;
}

.sent .message {
  background: #4a90e2;
  border-bottom-right-radius: 0;
}

.received .message {
  background: #7b61ff;
  border-bottom-left-radius: 0;
}

.message-username {
  font-weight: bold;
  margin-bottom: 5px;
  color: #fff;
}

.message-text {
  display: flex;
  flex-direction: column;
  color: #ddd;
}

.message-text small {
  align-self: flex-end;
  color: #bbb;
}

/* Form styling */
.chat-form {
  background: #f1f1f1;
  padding: 15px;
  border-top: 1px solid #ddd;
}

.message-input {
  width: 100%;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
  font-size: 16px;
  outline: none;
  transition: border-color 0.3s;
}

.message-input:focus {
  border-color: #4a90e2;
}
</style>
