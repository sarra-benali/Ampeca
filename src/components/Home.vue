<template>
<div id="home">
<div class="nav">
  <nav class="nav-bar">
     <h3 id="text"> Ampeca</h3>
     <input type="text" v-model="search" placeholder="Search for songs,playlist,artists,lyrics ..." id="search">
     <a @click="ToProfile" class="profile">Profile</a>
     <a href="#" class="profile" id="play">My librery</a>
    </nav>
     
</div>
    <div id="waveform">
      <p id="explore">Explore</p>
      <div>
        
      </div>
      <div class="glass" v-for ="product in filtredData" :key="product.id"> 
        
         <!-- <p> https://archive.org/embed/ {{product.src}}</p> -->
        <!-- <p>{{product.Name}} </p>  -->
        <button @click="AddToPlaylist(product.id)" class="icon" ><i class="fa fa-heart" style="font-size:36px;"></i></button>
        <img id="image" :src='product.Cover' alt="">
       
        <audio controls id="audio" class="audio1"  >
        <source  :src='product.src' type="audio/ogg">
          
        </audio>
        <!-- <div>{{product.src}}</div> -->
      </div> 
     </div>
</div>
</template>

<script>
import axios from "axios";

export default {
  name: "App",
  components: {},
  data() {
    return {
      search:"",
      message: "Hello World ",
      Data: [],
      song : '/media/PoloG.369417b3.mp3'
    };
  },
  computed:{
      filtredData:function(){
        return this.Data.filter((item)=>{
          return item.Name.toLowerCase().match(this.search.toLowerCase());
        })
      }
  },
  mounted() {
    axios.get("http://localhost:3000/api/get").then((res) => {
      this.Data = res.data;
      console.log(res.data);
    });
    
  },

  methods: {
    x: function () {
      console.log("éd");
    },
    AddToPlaylist: function(event){
var x = window.location.href.substr(27,1) 
x= parseInt(x)
var data = {
user:x ,  
songs:event
} 
axios.post("http://localhost:3000/api/post",data).then(res=> {
console.log("Check The DataBase ")
console.log(res)
})
} , 
ToProfile : function(){ 
var x = window.location.href.substr(27,1) 
x= parseInt(x)
          this.$router.push({ name: "profile", query: { redirect: "/profile" } , params:{id:x}});
}
    
  },
};
 setTimeout(() => {
   var audio = document.getElementById("audio");
   // here You Set The
console.log(document.getElementsByClassName('audio1'))
audio.currentTime = 40;
 console.log(document.getElementsByClassName("hello") ," Hello") }, 300);
</script>


<style scoped >

#home{
  background-color: #1b1c1d;
 height: auto;
 
 
}
.icon{
  position: relative;
  width: 50px;
  height: 50px;
  top: 70px;
  border-radius: 10px;
  color: red;

}
.nav{
  background-color: #2b2d2f;
  width:100%;
  height: 10%;
}
#text{
  font-size: 40px ;
  position: relative;
  color:rgb(30, 209, 185);
  top: 20px;
  font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif
}

#search{
  position: relative;
  width: 300px;
  height: 40px;
  left: 500px;
  top: -30px;
  font-size: 15px;
  border-radius: 30px;
  background-color: #e5e7ea;
}


.profile{
  position: relative;
  left: 1100px;
  top: -20px;
  font-size: 30px;
  color: #dfdfdf;
}
#waveform{
  position: relative;
     display:grid;
     grid-template-columns: repeat(4, 0.2fr);
     grid-gap:35px;
     grid-auto-rows: minmax(300px, 20px);  
     left: 200px;
     top: 20px;
    
}
#audio{
  position: relative;
  bottom: 302px;
 
}
#image{
  border-radius: 30px;
  
}
#explore{
  position: relative;
  color: #dfdfdf;
  font-size: 50px;
  left:10px;

}
#play{
    position: relative;
  left:-100px ;
  top: -20px;
  font-size: 30px;
  color: #dfdfdf;
  text-decoration: none;
}
</style>