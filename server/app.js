var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const multer = require("multer"); //multipart/form-data数据转换
const upload = multer({dest:"../static/images",fileFilter});  //创建multer
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
upload_middle = upload.array('picture',3);  //3是限制上传朋友圈图片的个数

var app = express();

//过滤上传的文件
function fileFilter (req, file, cb) {
  // console.log(req);
  // 这个函数应该调用 `cb` 用boolean值来
  // 指示是否应接受该文件
  let arrSuffix = ["jpg","png","gif","jpeg"];  //允许上传的文件类型
  let suffix = file.originalname.slice(file.originalname.lastIndexOf(".")+1);  //上传文件的后缀
  // console.log(suffix);
  if(arrSuffix.includes(suffix)){
	  // 接受这个文件，使用`true`，像这样:
	  cb(null, true)
  }else{
	  // 拒绝这个文件，使用`false`，像这样:
	  cb(null, false)
  }
}

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'uploads')));

//设置允许跨域请求
// app.use((req,res,next)=>{
//   res.header("Access-Control-Allow-Origin","*"); //允许任何域名访问
//   res.header("Access-Control-Allow-Headers","Content-Type"); //允许的header类型
//   // res.header("Access-Control-Allow-Methods","DELETE,PUT,POST,GET,OPTIONS"); //允许任何跨域请求方式
//   next();
// });

//上传文件
app.post("/users/mydetail",upload.single('avatar'));
//上传朋友圈图片
app.post('/users/up', function (req,res,next) {
    upload_middle(req, res, function (err) {
      // console.log(req.files)
      if (err) {
          console.log("文件上传失败")
          res.send("<script>alert('上传失败~ 最多只能上传三张图片');window.location.href='http://localhost/#/focuspyq';</script>");
      } else {
          next()
      }
    })
})


app.use('/', indexRouter);
app.use('/users', usersRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
