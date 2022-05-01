var express = require('express');
var router = express.Router();
let db = require("../db/db.fun");
let fs = require("fs");
let path = require("path");  //处理文件和目录的路径
let crypto = require("crypto");

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

//用户注册
router.post("/register",function(req,res){
  console.log(req.body);
  //密码加密
  req.body.password = crypto.createHash("md5").update(req.body.password).digest("hex");
  req.body.systime = new Date().getTime();
  db.add("user",req.body).then(data=>{
    if(data.affectedRows > 0){
      res.json({errCode:0,errMsg:"新增成功~"});
    }else{
      res.json({errCode:1,errMsg:"新增失败~"});
    }
  })
});

//用户登录
router.post("/login",function(req,res){
  //密码加密
  req.body.password = crypto.createHash("md5").update(req.body.password).digest("hex");
  db.search("user",`username="${req.body.username}" AND password="${req.body.password}"`).then(data=>{
    if(data.length > 0){
      res.json({errCode:0,errMsg:"登录成功~",userInfo:data[0]});  //登录成功返回用户信息
    }else{
      res.json({errCode:1,errMsg:"用户名或密码错误~",userInfo:{}});  //登录失败
    }
  })
});

//搜索用户
router.get("/search",function(req,res){
  //搜索当前用户的好友 uid=[1,2,3,4]
  //根据关键字搜索新用户 AND uid NOT IN(1,2,3,4)
  db.search("user",`nickname LIKE "%${req.query.nickname}%"`).then(data=>{
    data = data.map(user=>{
      let vif = req.query.uid == user.uid ? false : true;
      return {uid:user.uid,pic:user.pic,nickname:user.nickname,vif};
    })
    // console.log(data);
    res.json(data);
  })
})

//添加好友
router.get("/addfriends",async function(req,res){
  // console.log(req.query);
  req.query.systime = new Date().getTime();
  let mid = await db.search("friendmsg",`from_a=${req.query.from_a} AND to_b=${req.query.to_b}`).then(data=>{
    if(data.length > 0){
      if(data[0].systime > req.query.systime - 60*60*24*1000*3)
        return -1;  //三天之内发过申请返回-1
      else
        return data[0].mid;  //三天前发过申请，返回消息id
    }else{
      return 0;  //从来没有发送申请，返回0
    }
  });
  let results = {errCode:2,errMsg:"三天内发过申请,不能重复申请！~"}
  if(mid == 0){
    results = await db.add("friendmsg",req.query).then(data=>{
      // console.log(data);
      if(data.affectedRows)
        return res.json({errCode:0,errMsg:"新增成功~"});
      else
        return res.json({errCode:1,errMsg:"新增失败~"});
    });
  }else if(mid > 0){
    results = await db.update("friendmsg",{isread:0,ispass:0,systime:req.query.systime},`mid=${mid}`).then(data=>{
      if(data.affectedRows)
        return res.json({errCode:0,errMsg:"新增成功~"});
      else
        return res.json({errCode:1,errMsg:"新增失败~"});
    })
  }
  res.json(results);
})

//获取用户的未读好友申请
router.get("/getFriendMsg",function(req,res){
  db.search("friendmsg",`to_b=${req.query.uid} AND isread=0`).then(data=>{
    // console.log(data);
    res.json(data.length);
  })
})

//获取用户的所有好友申请
router.get("/getAllFriendMsg",function(req,res){
  db.search("friendmsg a INNER JOIN user b ON a.from_a = b.uid",`a.to_b=${req.query.uid}`,`a.*,b.pic,b.nickname`,"a.ispass ASC,a.systime DESC").then(data=>{
    // console.log(data);
    res.json(data);
  })
})

//更新用户的好友申请已读状态
router.get("/updateFriendMsg",function(req,res){
  db.update("friendmsg",{isread:1},`to_b=${req.query.uid}`).then(data=>{
    res.json({errCode:0,affectedRows:data.affectedRows});
  });
})

//更新用户的好友申请接受状态
router.get("/isPass", function(req,res){
   db.update("friendmsg",req.query,`mid=${req.query.mid}`).then(data=>res.json({errCode:0,affectedRows:data.affectedRows}));
  // //用户接受申请
  // if(req.query.ispass == 1 && result > 0){
  //   //查好友申请记录得到好友双方的uid
  //   let list = await db.search("friendmsg",`mid=${req.query.mid}`).then(data=>data[0]);
  //   //新增好友关系
  //   await db.add();

  // }
  // res.json()
})

//获取当前用户好友
router.get("/getAllFriends",async function(req,res){
  let friends = await db.search("friendmsg",`from_a=${req.query.uid} OR to_b=${req.query.uid} AND ispass=1`).then(data=>data);
  let friendArr = [];
  for(let i = 0;i < friends.length;i++){
    let fid = friends[i].from_a == req.query.uid ? friends[i].to_b : friends[i].from_a;  //获取朋友id
    //查询朋友相关的信息
    let finfo = await db.search("user",`uid=${fid}`).then(fdata=>fdata);
    // console.log(finfo);
    let fobj = {uid:fid,nickname:finfo[0].nickname,pic:finfo[0].pic};
    friendArr.push(fobj);
  }
  // console.log(friendArr);
  //根据昵称排序
  res.json(friendArr);
})

//查询信息
router.get("/receivemsg",function(req,res){
  db.search("chatmsg",`(uid=${req.query.uid} && fid=${req.query.fid}) or (uid=${req.query.fid} && fid=${req.query.uid})`,"*","systime asc").then(data=>{
    res.json(data);
  })
})

//我的页面信息展示
router.get("/mymsg",function(req,res){
  // console.log(req.query);  {uid:4}
  db.search("user",`uid=${req.query.uid}`,"*").then(data=>{
    res.json(data);
  })
})

//修改头像
router.post("/mydetail",function(req,res){
  // console.log(req.file);
  console.log(req.body);  //保存文本域信息
  //判断是否上传了文件
  if(req.file){
    let filename = req.file.destination+"/"+req.file.filename+req.file.originalname.slice(req.file.originalname.lastIndexOf("."));
    let filena = "static/images/"+req.file.filename+req.file.originalname.slice(req.file.originalname.lastIndexOf("."));
    //将临时文件保存为正式文件
    fs.readFile(req.file.path,function(err,data){
      // console.log(filename);
      fs.writeFile(path.join(__dirname,"../",filename),data,(err)=>{
        if(err){
          console.log(err);
        }else{
          fs.unlink(path.join(__dirname,"../",req.file.path),err=>{
            console.log(err);
          })
          console.log("头像修改成功~~~");
        }
      });
    })
    //将图片保存路径添加大数组中
    req.body.pic = filena;
    //将时间添加到数组中
    req.body.systime = new Date().getTime();
    //把修改的数据重写到数据库
    db.update("user",req.body,`uid=${req.body.uid}`).then(data=>{
      if(data.affectedRows > 0){
        res.redirect("/#/mydetail");
      }else{
        res.send("<script>alert('头像修改失败！~');window.location.href='/#/mydetail';</script>");
      }
    })
    // console.log(filename);
  }else{

  }
})

//修改昵称
router.post("/cnick",function(req,res){
  db.update("user",req.body,`uid=${req.body.uid}`).then(data=>{
    if(data.affectedRows > 0){
      res.redirect("/#/mydetail");
    }else{
      res.send("<script>alert('昵称修改失败！~');window.location.href='/#/mydetail';</script>");
    }
  })
})

//查看聊天页后好友详细信息
router.get("/friendmsg",function(req,res){
  db.search("user",`uid=${req.query.fid}`,"*").then(data=>{
    res.json(data);
  })
})

//删除好友
router.get("/frienddel",function(req,res){
  db.del("friendmsg",`to_b=${req.query.fid}`).then(data=>data)
})

//编辑朋友圈内容
router.post("/up",function(req,res){
  // console.log(req.files);
  // console.log(req.body);
  if(req.files){
    let fn = "";
    req.files.forEach(f=>{
      let filename = f.destination+"/"+f.filename+f.originalname.slice(f.originalname.lastIndexOf("."));
      let filena = "static/images/"+f.filename+f.originalname.slice(f.originalname.lastIndexOf("."));
      //将临时文件保存为正式文件
      fs.readFile(f.path,function(err,data){
        fs.writeFile(path.join(__dirname,"../",filename),data,(err)=>{
          if(err){
            console.log(err);
          }else{
            fs.unlink(path.join(__dirname,"../",f.path),err=>{
              console.log(err);
            })
            console.log("朋友圈图片发表成功~~~");
          }
        });
      })
      fn += filena +";";
    })
    fn = fn.slice(0,-1);
    //把多张图拼接成一条数据保存
    req.body.picture = fn;
    //将时间添加到数组中
    req.body.systime = new Date().getTime();
    // console.log(req.body.pic);
    db.add("pyq",req.body).then(data=>{
      if(data.affectedRows > 0){
        res.send("<script>alert('发表动态成功！~');window.location.href='/#/focuspyq';</script>");
      }else{
        res.send("<script>alert('发表动态失败！~');window.location.href='/#/moments';</script>");
      }
    })
  }else{

  }
})

//显示朋友圈内容
router.get("/upmsg",async function(req,res){
  let friends = await db.search("friendmsg",`from_a=${req.query.uid} OR to_b=${req.query.uid} AND ispass=1`).then(data=>data);
  let friendArr = [];
  let fid = friends.map(f=>{
    if(f.from_a==req.query.uid){
      return f.to_b
    }else{
      return f.from_a
    }
  })
  fid.push(req.query.uid);
  await db.search("pyq p,user u",`p.uid=u.uid && p.uid in (${fid})`,"p.*,u.nickname,u.pic","systime DESC").then(data=>{
    res.json(data);
  })
})

module.exports = router;
