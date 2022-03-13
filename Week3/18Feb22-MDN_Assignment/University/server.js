const express=require('express');
const app=express()
const port=3000;
//app.use(express.json());
//Use as middleware there convert data json file into body object.
app.use(express.json());
app.use('/css',express.static(__dirname +'/css'));
app.get('/',(req,res)=>{
    res.sendFile(__dirname+'/index.html');
});
app.get('/',(req,resp)=>{
    //resp.set(“Content-Type”, “application/CSS”);
    resp.sendFile(__dirname+'style.css')
});

app.listen(port,()=>{
    console.log(`http://localhost:${port} start`);
})