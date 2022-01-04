const Router = require('koa-router')
const jwt = require("jsonwebtoken");
const {adminUserLogin} = require("../controller/user.controller");
const {backMsg401} = require("../../utils/backMsg");
const {adminSecret} = require("../../config");
const {shopUserPageController} = require("../controller/user.controller.js");

const {imgPostController,imgGetController,imgMapGetController} = require("../controller/imgMap.controller.js");
const {productGetController, productPostController} = require("../controller/product.controller.js");
const {
  cateGetController, catePostController,
  tagGetController, tagAddPostController
} = require("../controller/cate.controller.js");
const router = new Router({prefix: '/api/admin'})
const {showSpecsController} = require("../controller/specs.controller.js");
const {specsController} = require("../controller/specs.controller.js");
//----后台管理----

router.use(async (ctx,next)=>{
  const token = ctx.request.headers.admintoken || ''
  let data = null
  try {
    data = jwt.verify(token, adminSecret)
    // 挂在登入的用户id
  } catch (e) {
    ctx.body = backMsg401({})
  }
  ctx.state.users = data
  await next()
})

// 管理员登入
router.post('/admin-login',adminUserLogin)


// 图片
router.post('/img-map-keys',imgPostController)
router.get('/img-map-keys',imgGetController)
//获取图片地址
router.post('/imgs',imgMapGetController)

//规格属性
router.post('/specs', specsController)
router.get('/specs', showSpecsController)
router.delete('/specs')

// 类型
router.post('/cate', catePostController)
router.get('/cate', cateGetController)

// tag 标签
router.get('/tags', tagGetController)
router.post('/tags', tagAddPostController)

// 商品
router.post('/product', productPostController)
router.get('/product', productGetController)

// 用户
router.get('/shop-user', shopUserPageController)


module.exports = router
