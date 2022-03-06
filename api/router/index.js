
const Router = require('koa-router')
const pathExists = require("path-exists");
const fse = require("fs-extra");
const router = new Router()
const UUID = require('uuid')
const fs = require('fs')
const path = require("path");
const {ajvValid} = require("../../utils/ajv-verify.js");
const {backMsg200} = require("../../utils/backMsg.js");
fs.readdirSync(__dirname).forEach(item=>{
  if (item.includes('index') || !item.includes('.js')) return
  const route = require(`./${item}`)
  // const name = item.split('.js')[0]
  // app.use(route.routes(`/v1/${name}`)).use(route.allowedMethods())
  router.use(route.routes(),route.allowedMethods())
})

const pageSchema = {
  type:'object',
  properties: {
    pageSize: {type: 'number',default: 100,errorMessage:{type:'必须是字符串或者数字',}},
    pageIndex:{type:'number',default: 1,errorMessage:{type:'是一个数组包裹'}},
  },
}

// 处理分页
// router.use(async function (ctx,next) {
//   const data = ctx.request.body || ctx.request.params  || ctx.request.query|| {}
//   ajvValid(data,pageSchema)
//   console.log(data,ctx.request.query)
//   next()
// })



router.get('/',async (ctx,next)=>{
  ctx.body = {
    code:200,
    data:'koa 项目已启动成功'
  }
})


// 文件上传
router.post('/uploadfiles',async (ctx,next)=>{
  const files = ctx.request.files.file; //
  for (let file of files){
    const reader = fs.createReadStream(file.path)
    let filePath = path.join(__dirname,'public/upload/') + `/${file.name}/`
    const upStream = fs.createWriteStream(filePath)
    reader.pipe(upStream)
  }
})

// 图片上传，不设置身份验证， 当时需要设置图片类型
router.post('/upload/file',async (ctx,next)=>{
  const file = ctx.request.files.file
  const pathMax = ctx.request.body.path
  // 检查路径
  let filePath = path.join(__dirname,'../../','public/img/',pathMax)
  if(!await pathExists(filePath)){
    fse.mkdirpSync(filePath) // 不存在就创建
  }
  const imageName = UUID.v4() +path.extname(file.name); // 随机
  const reader = fs.createReadStream(file.path)
  const  fileName =  filePath + `/${imageName}`
  const upStream = fs.createWriteStream(fileName)
  reader.pipe(upStream)
  ctx.body =backMsg200({data:{
    path:process.env.WWW +'/show/public/img'+pathMax+'/'+imageName,
      imgPath:'/show/public/img'+pathMax+'/'+imageName
  }})
})


router.get('/show/:paths(.*)?/:name.:t(jpg|html|png)',async (ctx,next)=>{
  const {paths,name,t} = ctx.params
  const img =   name+'.'+ t
  let filePath = path.join(__dirname,'../../',paths+'/')  + img
  const file = fs.readFileSync(filePath)
  ctx.set('content-type',`image/${t}`)
  ctx.body =file
})




router.delete('/show/img/:paths(.*)?/:name.:t(jpg|html|png)',async (ctx,next)=>{
  //删除图片

})


module.exports = router
