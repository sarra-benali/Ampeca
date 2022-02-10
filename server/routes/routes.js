var router = require('express').Router();
const controllers = require('../controllers/controllers');
//just test for pushing github
router.put("/delete/:id", controllers.removefrompl);
router.post("/post",(req,res)=>{
    controllers.PostSongs(req.body,(a,b)=>{
        if(a){
            console.log(a);
        }
        console.log(b);
    })
})
router.get("/get/:id",(req,res)=>{
console.log(req.params.id);
    controllers.GetPlaylistSong(req.params.id,(a,b)=>{
        res.send(a)
    })
})
router.get("/getsongs/:id",(req,res)=>{
    console.log(req.params.id," req.body")
    controllers.GetSong(req.params.id,(a,b)=>{
        console.log(a," ",b)

     
        res.send(a);
    })
})

router.put("/updateplname", controllers.updateplname);
module.exports = router;
