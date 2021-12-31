
const Router = require('koa-router')
const jwt = require('jsonwebtoken')
const {addCartShopController} = require("../controller/cartShop.controller.js");
const {
  shopUserGetInfoController,
  shopUserRegisterController,
  shopUserLoginController
} = require("../controller/user.controller.js");
const {shopSecret} = require("../../config");
const {backMsg401} = require("../../utils/backMsg.js");
const {shopHeadGetController,shopGoodsDetailsController,
  shopSlideshowGetController,shopGoodsPageGetController} = require("../controller/shop.controller.js");
const router = new Router({ prefix: '/api' })

// 需要登入路由
const authPath = new Set(['/add-cart'])
router.use(async (ctx,next)=>{
  const path = ctx.request.path
  if (authPath.has(path.replace(/^\/api/, ''))) {
    const token = ctx.request.headers.AuthToken || ''
    try {
      const data = jwt.verify(token, shopSecret)
      // 挂在登入的用户id
      ctx.state.userId = data.userId
      await next()
    } catch (e) {
      ctx.body = backMsg401({})
    }
  } else {
   await next() // 一定要加 await
  }
})


router.get('/',async function (ctx,next){
  ctx.body = {
    'shop':'sdf'
  }
})


// 获取首页商品
router.get('/head-mun',shopHeadGetController)
router.get('/goods-list',shopGoodsPageGetController)
//首页轮播图
router.get('/slideshow',shopSlideshowGetController)


//获取商品详情
router.get('/goods-details',shopGoodsDetailsController)


// 用户登入
router.post('/login-shop', shopUserLoginController)
router.post('/register-shop', shopUserRegisterController)
router.get('/get-user-info', shopUserGetInfoController)
// 获取用户购物地址


// 获取购物车

// 加入购物车
router.post('/add-cart', addCartShopController)


// 获取购商品

module.exports = router
