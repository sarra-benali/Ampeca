<template>
<div class="big" id="app" >
  <div id="container-signup">
         <div class="logo-img"> 
     <img src="../assests/img.png.png" id="img" >
    </div>
     <form >
      <input type="text" v-model="username" @change="someHandler" placeholder="Write your username" class="inpu">
      <input type="email" v-model="email" @change="someHandler" placeholder="Write your Email" id="email" class="inpu">
       <input type="password" v-model="password" @change="someHandler" placeholder="Write your Password" id="pas" class="inpu">
     </form>
     <!-- <div class="date">
     <div class="label">
     </div >
     <input type="text" id="day" inputmode="numeric" maxlength="2" placeholder="DD" >
     </div>
     <div class="month">
         <select name="month"  id="month">
          <option selected disable value>month</option>
          <option value="01">January</option>
          <option value="02">February</option>
          <option value="03">March</option>
          <option value="04">April</option>
          <option value="05">May</option>
          <option value="06">June</option>
          <option value="07">July</option>
          <option value="08">August</option>
          <option value="09">September</option>
          <option value="10">October</option>
          <option value="11">November</option>
           <option value="12">December</option>
          <svg role="img" focusable="false"     viewBox="0 0 24 24" aria-hidden="true">
                 <polyline points="20 8 12 17 4 8" fill="none" stroke="#181818"></polyline>
             </svg>
         </select>
     </div>
     <input type="text" placeholder="Year" id="year" maxlength="4" name="year" pattern="(19[0-9]{2})|(200)[0-4]" aria-invalid="false">
      -->
        <!-- <label id="box" for="checkbox">
         <span class="check"></span>
         <span class="agree">agree to receive news and  offers <br>from Ampeca</span>
     </label> -->
 
    <router-link to="/"> <button @click="signup()" id="signup">signup</button> </router-link>
    </div>
    
</div>
  
</template>



<script >
import axios from 'axios'
export default {
    data(){
        return {
            username:"",
            email:"",
            password:"",
            result:{}
        }
    },
    methods:{
     async signup(){
         let data = {
         username:this.username,
         email:this.email,
         password:this.password
         }
         await axios.post('http://localhost:3000/api/register',data)
         .then(({data})=> { console.log(data)
           this.result=data 
         })
     }
    }

}
</script>
<style  >
*{
 
  width: 100%;
  height: 100%;
  margin: 0;
  
} 
/* this style is for the position of the page */
#app {
  /* background-size: cover; */
  min-width: 100%;
  min-height: 100%;
  background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
  background-size: 400% 400%;
  animation: gradient 15s ease infinite;
}

@keyframes gradient {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}
#container-signup{
  position: absolute;
  width: 450px;
  height:400px;
  border-radius: 15px;
  border: 3px solid  rgb(245, 244, 244)  ;
  bottom:200px;
  left: 580px;
  background-color: rgb(245, 244, 244);
}
#signup{
    position: absolute;
    width: 300px;
    height: 50px;
    background-color: #97e2f0;
    padding: 15px 0;
    font-size: 18px;
    font-weight: 600;
    border-radius: 25px;
    border-color: #97e2f0;
    top: 300px;
    left:70px;
  }
  #signup:hover {
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}
/* this style for the button and i make it hover  */
  
 .inpu{
    position: absolute;
    height: 40px;
    width: 300px;
    top: 90px ;
    left: 70px;
    border-radius: 15px ;
    border-color: white;
    outline: none;
    }
    ::placeholder {
  color: black;
  font-size: 1em;
}
#pas{
  position: absolute;
  top: 210px;
}
#email{
    position: absolute;
    top: 150px;
}
#day{
position:absolute;
border-radius: 15px;
border-color: white;
top: 280px;
left: 70px;
width: 50px;
height: 50px;
outline: none;
text-align: center;
display: block;
}
#img{
  position: absolute;
  width: 150px;
  height: 80px;
  padding: 40px;
  top: -35px;
  left: 100px;
}
#month{
border-radius: 15px;
border-color: white;
}

#month{
position:absolute;
border-radius: 15px;
border-color: white;
top: 280px;
left: 140px;
width: 150px;
height: 50px;
outline: none;
text-align:left;
display: block;
}
#year{
position:absolute;
border-radius: 15px;
border-color: white;
top: 280px;
left: 300px;
width: 70px;
height: 50px;
outline: none;
text-align:left;
display: block;
}
.check{
 position: absolute;
  top: 0;
  right: 480px;
  height: 25px;
  width: 25px;
  background-color: #eee;
}
.check:after {
  content: "";
  position: absolute;
  display: none;
}
:hover input ~ .checkmark {
  background-color: #ccc;
}
.container input:checked ~ .check {
  background-color: #2196F3;
}

#box{
position: absolute;
top: 350px;
color: rgb(111, 179, 219);
left: 100px;
}
.agree{
    position: absolute;
    right: 20px;
}
.signup{
      position: absolute;
    width: 300px;
    height: 50px;
    background-color: #97e2f0;
    padding: 15px 0;
    font-size: 18px;
    font-weight: 600;
    border-radius: 25px;
    border-color: #97e2f0;
    top: 410px;
    left: 70px;
}
 .signup:hover {
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}

</style>