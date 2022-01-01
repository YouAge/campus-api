
const Router = require('koa-router')
const jwt = require('jsonwebtoken')
const {addUserAddressController,showUserAddressController,updateUserAddressController,delUserAddressController
} = require("../controller/user.controller.js");
const {addCartShopController,showCartShopController,delCartShopController,updateCartShopController
} = require("../controller/cartShop.controller.js");
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
const authPath = new Set(['/cart','/address'])
router.use(async (ctx,next)=>{
  const path = ctx.request.path
  if (authPath.has(path.replace(/^\/api/, ''))) {
    const token = ctx.request.headers.authtoken || ''
    let data = null
    try {
      data = jwt.verify(token, shopSecret)
      // 挂在登入的用户id
    } catch (e) {
      ctx.body = backMsg401({})
    }
    ctx.state.users = data
    await next()
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
router.post('/address',addUserAddressController)
router.get('/address',showUserAddressController)
router.put('/address',updateUserAddressController)
router.patch('/address',delUserAddressController)


// ---购物车
router.post('/cart', addCartShopController)
router.get('/cart',showCartShopController)
router.put('/cat',updateCartShopController)
router.patch('/cat',delCartShopController)


// 获取购商品

module.exports = router
