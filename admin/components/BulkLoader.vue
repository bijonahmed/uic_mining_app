<template>
  <div>
    <div class="loader-container">
      <center class="loader-text">
        System is synchronizing big data.<br>
        Please do not close this page<br> as it may take some time to complete.
      </center>
      <img src="/animated_loader.gif" alt="Loader" style="height:150px;width:150px;" />
    </div>
  </div>
</template>


<style>
.loading-indicator {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(255, 255, 255, 0.8);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
}

/* For Loader */
.loader-container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
  position: relative;
}

.loader-text {
  margin: 0;
  /* Remove default margin */
}

.loader-top {
  top: 0;
}

.loader-bottom {
  bottom: 0;
}

.pagination {
  display: inline-block;
  text-align: center;
}
</style>
