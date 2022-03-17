const router = require('koa-router')() //引入路由函数
const swaggerJSDoc = require('swagger-jsdoc')
const path = require('path')
const swaggerDefinition = {
  info: {
    title: '新风尚，校园购',
    version: '2.0.0',
    description: 'API 接口文档',
  },
  host: 'http://127.0.0.1:6452/api/swagger',// 想着改这里，如果不修改，那么接口文档访问地址为：localhost:8000/swagger
  basePath: '/' // Base path (optional)
};
const options = {
  swaggerDefinition,
  apis: [path.join(__dirname, './api/router/*.js')], // 写有注解的router的存放地址, 最好path.join()
};
const swaggerSpec = swaggerJSDoc(options)
// 通过路由获取生成的注解文件
router.get('/swagger.json', async function (ctx) {
  ctx.set('Content-Type', 'application/json');
  ctx.body = swaggerSpec;
})
module.exports = router
