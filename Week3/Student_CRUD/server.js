const express=require('express');
const Students=require('./students');
const app=express()
const port=3000;
//app.use(express.json());
//Use as middleware there convert data json file into body object.
app.use(express.json());
app.use('/css',express.static(__dirname +'/css'));
app.get('/',(req,res)=>{
    res.sendFile(__dirname+'/index.html');
});
// app.get('/',(req,resp)=>{
//     //resp.set(“Content-Type”, “application/CSS”);
//     resp.sendFile(__dirname+'style.css')
// });
app.get('/Students',(req,res)=>{
    res.json(Students);
    // res.send("working");
});
app.post('/Students/post',(req,res)=>{
    // res.send("working");
    const user=
        {id:Students.length +1,
        first_name:req.body.first_name,
        last_name: req.body.last_name,
        email    : req.body.email
    }
    Students.push(user);
    res.json(user);
});
app.put('/Students/put/:id',(req,res)=>{
    // res.send("working");
    let id=req.params.id;
    let first_name=req.body.first_name
    let last_name=req.body.last_name
    let email    = req.body.email
    let index=Students.findIndex((Students)=>{
        return(Students.id==Number.parseInt(id))
    })
    if(index>=0)
    {
        let user1=Students[index];
        user1.first_name=first_name;
        user1.last_name=last_name;
        user1.email=email;
        res.json(user1);
    }
    else
    {
        res.sendStatus(404);
    }
});
app.delete('/Students/delete/:id',(req,res)=>{
    let id=req.params.id;
    let index=Students.findIndex((Students)=>{
        return(Students.id==Number.parseInt(id))
    })
    if(index>=0)
    {
        let user1=Students[index]
        Students.splice(index,1);
        res.json(user1);
    }
    else{
        res.sendStatus(404);
    }

})
app.listen(port,()=>{
    console.log(`http://localhost:${port} start`);
})