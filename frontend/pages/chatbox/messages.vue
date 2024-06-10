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
            <div class="chat-messages scrollarea" style="max-height: 250px;">
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
import { format } from 'date-fns';
import { useRouter } from 'vue-router';
import { useNuxtApp } from '#app';
import Sidebar from '~/layouts/Sidebar.vue';
import HeaderSecond from '~/layouts/HeaderSecond.vue';
import HeaderThird from '~/layouts/HeaderThird.vue';
import SocialFooter from '~/components/SocialFooter.vue';
import Pusher from 'pusher-js';

const router = useRouter();
const { $echo } = useNuxtApp();

const communitySlug = ref(router.currentRoute.value.query.slug);
const username = ref(router.currentRoute.value.query.username);
const name = ref(router.currentRoute.value.query.name);
const message = ref('');
const messages = ref([]);
const isAtBottom = ref(true);


const formatTimestamp = (timestamp) => {
  return format(new Date(timestamp), 'HH:mm'); // Format to only show hours and minutes
};

// Polling logic
let pollingInterval;
onMounted(() => {
  fetchMessages();
  pollingInterval = setInterval(fetchMessages, 10000); // Poll every 10 seconds
  chatMessagesRef.value = document.querySelector('.chat-messages'); // Set the reference after the component is mounted
});

onUnmounted(() => {
  clearInterval(pollingInterval);
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
    });
   // scrollToTop();
    console.log('Message sent:', response.data);
    message.value = '';
    await fetchMessages(); // Fetch messages after sending a new one
   // scrollToTop();
    setTimeout(scrollToBottom, 100);
  } catch (error) {
    console.error('Error sending message:', error);
  }
};
const chatMessagesRef = ref(null); // Initialize chatMessagesRef


const scrollToBottom = () => {
  const chatMessages = chatMessagesRef.value;
  if (chatMessages) {
    chatMessages.scrollTop = chatMessages.scrollHeight; // Scroll to the bottom
  }
};


const onScroll = () => {
  const chatMessages = chatMessagesRef.value;
  const threshold = 50; // Adjust based on your needs
  if (chatMessages) {
    isAtBottom.value = chatMessages.scrollHeight - chatMessages.scrollTop <= chatMessages.clientHeight + threshold;
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

.message-input {
  flex: 1;
  padding: 10px;
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
  display: flex;
  gap: 10px;
  padding: 10px;
  background: #f1f1f1; /* Optional background color */
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
.chat-messages {
  flex: 1; /* Take up all available space */
  overflow-y: auto;
  padding: 10px;
}
</style>
