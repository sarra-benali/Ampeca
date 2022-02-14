<template>
<html>
  <body>
  <div class="bigbig">
    <div class="form">
      <div class="title">Welcome</div>
      <div class="subtitle">Let's Edit your acount!</div>
      <div class="input-container ic1">
        <input v-model="username" class="inputtt" @change="someHandler" />
        <div class="cut"></div>
        <label for="username" class="placeholder">User name</label>
      </div>
      <div class="input-container ic2">
        <input v-model="email" class="inputtt" @change="someHandler" />
        <div class="cut"></div>
        <label for="email" class="placeholder">Email</label>
      </div>
      <div class="input-container ic2">
        <input v-model="password" class="inputtt" type="password" @change="someHandler" />
        <div class="cut cut-short"></div>
        <label for="password" class="placeholder">password</label>
      </div>
      <div>
      <button @click="updateUser()" type="text" class="submit">submit</button>
      <button @click="ToHome()" type="text" class="icono-home">home</button>
      </div>
    </div>
  </div>
   </body>
  </html>
</template>
<script>
import axios from "axios";
export default {
  data() {
    return {
      username: "",
      email: "",
      password: "",
      user: {},
      isHidden: true
    };
  },
  mounted() {
    this.getUserInfo();
  },
  methods: {
    async updateUser() {
      let data = {
        username: this.username,
        email: this.email,
        password: this.password
      };
      var x = window.location.href.substr(30, 1);
      x = parseInt(x);
      alert(x);
      await axios
        .put(`http://localhost:3000/api/updateuser/${x}`, data)
        .then(response => {
          console.log(x);
          console.log(response);
        });
    },
     ToHome: function() {
      this.$router.push({
        name: "Home",
        query: { redirect: "/home" }
      });
    },
    async getUserInfo() {
      var x = window.location.href.substr(30, 1);
      x = parseInt(x);
      alert(x);
      await axios
        .get(`http://localhost:3000/api/getUserInfo/${x}`)
        .then(({ data }) => {
          this.user = data;
          console.log(this.user["0"]["id"]);
        })
        .catch(error => {
          console.log(error.response.data);
        });
    }
  }
};
</script>
<style scoped>
@import url("https://icono-49d6.kxcdn.com/icono.min.css");
.buttonuser {
  left: 200px;
}
.icono-home{
 color:green;
 top: 80px;
}
.inputDiv {
  /* position: relative; */
  margin: auto;
  width: 50%;
  border: 3px solid #006CE0;
  padding: 10px;
  display: block;
  margin-left: auto;
  margin-right: auto;
}
.form {
  background-color:  rgba(0, 0, 0, 0.856);
  /* border-radius: 20px; */
  box-sizing: border-box;
  height: 75vh;
  padding: 20px;
  width: 820px;
  /* display: block; */
  position: relative;
  left: 265px;
  top: 40px;
  border-radius: 15px;
  border: 3px solid rgb(245, 244, 244);
  /* background-color: rgb(245, 244, 244); */
}
.title {
  color: #4CAF50;
  font-family: sans-serif;
  font-size: 36px;
  font-weight: 600;
  margin-top: 30px;
  text-align: center;
}
.subtitle {
  color: rgb(145, 139, 139);
  font-family: sans-serif;
  font-size: 16px;
  font-weight: 600;
  margin-top: 10px;
  text-align: center;
}
.input-container {
  height: 50px;
  position: relative;
  width: 100%;
}
.ic1 {
  margin-top: 40px;
}
.ic2 {
  margin-top: 30px;
}
.inputtt {
  border: 0;
  box-sizing: border-box;
  color: #eee;
  font-size: 18px;
  height: 100%;
  outline: 0;
  padding: 4px 20px 0;
  width: 100%;
  border-radius: 15px;
  border-color: white;
  outline: none;
}
.cut {
  background-color: rgb(190, 186, 186);
  border-radius: 10px;
  height: 20px;
  left: 20px;
  position: absolute;
  top: -20px;
  transform: translateY(0);
  transition: transform 200ms;
  width: 76px;
}
.cut-short {
  width: 75px;
}
.inputtt:focus ~ .cut,
.inputtt:not(:placeholder-shown) ~ .cut {
  transform: translateY(8px);
}
.placeholder {
  color: #65657B;
  font-family: sans-serif;
  left: 20px;
  line-height: 14px;
  pointer-events: none;
  position: absolute;
  transform-origin: 0 50%;
  transition: transform 200ms, color 200ms;
  top: 20px;
  /* color: black; */
  font-size: 1em;
}
.inputtt:focus ~ .placeholder,
.inputtt:not(:placeholder-shown) .placeholder {
  transform: translateY(-30px) translateX(10px) scale(0.75);
}
.inputtt:not(:placeholder-shown) ~ .placeholder {
  color: #808097;
}
.inputtt:focus ~ .placeholder {
  color: #4CAF50;
}
.submit {
  position: absolute;
  width: 300px;
  height: 50px;
  background-color: #4CAF50;
  padding: 15px 0;
  font-size: 18px;
  font-weight: 600;
  border-radius: 25px;
  border-color: #97E2F0;
  top: 430px;
  left: 255px;
  box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
}
.submit:active {
  background-color: #06b;
}
</style>