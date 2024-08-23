<template>
    <div>
      <title>Chat Box Messages</title>
      <div class="nav-menu">
        <nav class="menu">
          <Sidebar />
        </nav>
      </div>
  
      <div class="wrapper-inline message_box">
        <HeaderThird />
        <Footer />
        <!-- Page content start -->
        <main>
          
            <center><h1>The community will open soon. </h1></center>
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
    height: 85vh;
    border-radius: 0;
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
    margin: 5px 0;
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
    color: #000;
    width: 50%;
  }
  
  .sent .message {
    
    background: #fff;
    border-bottom-right-radius: 0;
    box-shadow: 0 0 10px #0000004d;
    padding: 3px 15px;
  }
  .sent .message-text{
    display: flex;
    flex-direction: column;
    color: #000;
    font-size: 12px;
    align-items: end;
  }
  .received .message {
    background: #4a90e2;
    border-bottom-left-radius: 0;
    box-shadow: 0 0 10px #0000004d;
    padding: 5px 15px;
  }
  .received .message-username {
    font-weight: bold;
    margin-bottom: 2px;
    /* text-align: end; */
  }
  .received .message-text small{
    /* align-self: flex-start; */
  }
  
  .message-username {
    font-weight: bold;
    margin-bottom: 5px;
    color: green;
    font-size: 12px;
  }
  
  .received .message-username {
    font-weight: bold;
    margin-bottom: 5px;
    color: #ffc458;
    font-size: 12px;
  }
  .message-text {
    display: flex;
    flex-direction: column;
    color: #474646;
  }
  .received .message-text{
    color: #fff;
  }
  .message-text small {
    align-self: flex-end;
    color: #5c5a5a;
    font-size: 10px;
  }
  
  /* Form styling */
   
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
  .message_box main{
    margin-top: 50px;
  }
  
  .chat-form  {
      background: #f1f1f1;
      display: flex;
      gap: 10px;
      padding: 10px;
      position: fixed;
      bottom: 55px;
      width: 100% !important;
  }
  </style>
  