
const Koa = require('koa')
const koaBody = require('koa-body')
const cors = require('koa2-cors')
const router = require('./api/router')
const koaError = require("./middlewares/exception");
const {getIpAress} = require("./utils");
const app = new Koa()
app.use(cors())
app.use(koaBody({
  multipart: true,
  formidable: {
    maxFileSize: 50000 * 1024 * 1024    // 设置上传文件大小最大限制，默认2M
  }
}));
//组测全局异常检测
// app.use(koaError)
// 注册路由api
app.use(router.routes()).use(router.allowedMethods()) // 注册


//

const swagger = require('./swagger')  // 存放swagger.js的位置，可以自行配置，我放在了根目录
const { koaSwagger } = require('koa2-swagger-ui')

// 接口文档配置
app.use(swagger.routes(), swagger.allowedMethods())
app.use(koaSwagger({
  routePrefix: '/api/swagger', // 接口文档访问地址
  swaggerOptions: {
    url: '/swagger.json', // example path to json 其实就是之后swagger-jsdoc生成的文档地址
  }
}))

// console.log(os.networkInterfaces())
const ip = getIpAress()
process.env.WWW = `http://${ip}:${6452}`

// 监听端口
app.listen({
  host:'0.0.0.0',
  port:6452,
}, () => {
  console.log("服务器已启动，http://127.0.0.1:6452/api/swagger");
})
