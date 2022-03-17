
const Router = require('koa-router')
const jwt = require('jsonwebtoken')
const {putGoodsController} = require("../controller/shop.controller.js");
const {shopTagsGoodsController} = require("../controller/shop.controller.js");
const {updateShopUserInfo} = require("../controller/user.controller.js");

const {evaluate,commentPage} = require("../controller/comment.controller.js");
const {shopTagGetController} = require("../controller/shop.controller.js");
const {
  addShopOrderController,
  delShopOrderController,
  showShopOrderController,
  updateShopOrderController
} = require("../controller/shopOrders.controller.js");
const {
  addUserAddressController, showUserAddressController, updateUserAddressController, delUserAddressController
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
const authPath = new Set(['/cart', '/address', '/order','/user-info','/order'])
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
    'shop':'欢迎购物api'
  }
})

/**
 * @swagger
 * /api/head-mun:
 *   get:
 *     summary: 获取首页菜单
 *     description: 获取首页菜单
 *     tags:
 *       - Home
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
// 获取首页商品
router.get('/head-mun',shopHeadGetController)
/**
 * @swagger
 * /api/goods-list:
 *   get:
 *     summary: 获取商品列表
 *     description: 获取商品列表
 *     tags:
 *       - Goods
 *     parameters:
 *       - cateId: cateId
 *         in: query
 *         required: false
 *         description: cateId：分类id
 *         type: number
 *       - tagId: tagId
 *         type: number
 *         description: tagId：标签
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.get('/goods-list',shopGoodsPageGetController)
//首页轮播图
router.get('/slideshow',shopSlideshowGetController)

//获取商品首页list
/**
 * @swagger
 * /api/tag-list:
 *   get:
 *     summary: 获取主页内容
 *     description: 获取主页内容
 *     tags:
 *       - Home
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.get('/tag-list',shopTagGetController)
/**
 * @swagger
 * /api/tagslist:
 *   get:
 *     summary: 热销商品
 *     description: 获取热销商品
 *     tags:
 *       - Home
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.get('/tagslist',shopTagsGoodsController)

//获取商品详情
/**
 * @swagger
 * /api/goods-details:
 *   get:
 *     summary: 热销商品
 *     description: 获取热销商品
 *     tags:
 *       - Goods
 *     parameters:
 *       - goodsId:
 *         in: query
 *         required: true
 *         description: goodsId：商品id
 *         type: number
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.get('/goods-details',shopGoodsDetailsController)


// 用户登入
/**
 * @swagger
 * /api/login-shop:
 *   post:
 *     summary: 用户登入
 *     description: 用户登入
 *     tags:
 *       - Login
 *     parameters:
 *       - username:
 *         required: true
 *         description: username：用户名
 *         type: number
 *       - password:
 *         required: false
 *         description: password：密码
 *         type: number
 *       - isIphone:
 *         required: false
 *         description: isIphone：手机验证码注册登入
 *         type: number
 *       - code:
 *         required: false
 *         description: code：验证码
 *         type: number
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.post('/login-shop', shopUserLoginController)

router.post('/register-shop', shopUserRegisterController)
/**
 * @swagger
 * /api/get-user-info:
 *   get:
 *     summary: 用户信息
 *     description: 获取用户信息， 携带token
 *     tags:
 *       - Login
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.get('/get-user-info', shopUserGetInfoController)
/**
 * @swagger
 * /api/user-info:
 *   put:
 *     summary: 信息更新
 *     description: 更新用户信息
 *     tags:
 *       - Login
 *     parameters:
 *       - userId:
 *         required: true
 *         description: userId：用户id
 *         type: number
 *       - types:
 *         required: false
 *         description: type：更新的基础信息
 *         type: number
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.put('/user-info',updateShopUserInfo)

// 获取用户购物地址
/**
 * @swagger
 * /api/address:
 *   post:
 *     summary: 添加收获地址
 *     description: 收获地址
 *     tags:
 *       - 收获地址
 *     parameters:
 *       - userId:
 *         required: true
 *         description: userId：用户id
 *         type: number
 *       - types:
 *         required: false
 *         description: type：更新的基础信息
 *         type: number
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.post('/address',addUserAddressController)
/**
 * @swagger
 * /api/address:
 *   get:
 *     summary: 查看收获地址
 *     description: 获取收获地址
 *     tags:
 *       - 收获地址
 *     parameters:
 *       - userId:
 *         required: true
 *         description: userId：用户id
 *         type: number
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.get('/address',showUserAddressController)
/**
 * @swagger
 * /api/address:
 *   put:
 *     summary: 更新收获地址
 *     description: 收获地址
 *     tags:
 *       - 收获地址
 *     parameters:
 *       - userId:
 *         required: true
 *         description: userId：用户id
 *         type: number
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.put('/address', updateUserAddressController)
/**
 * @swagger
 * /api/address:
 *   post:
 *     summary: 删除收获地址
 *     description: 收获地址
 *     tags:
 *       - 收获地址
 *     parameters:
 *       - userId:
 *         required: true
 *         description: userId：用户id
 *         type: number
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.post('/del-address', delUserAddressController)

//更新商品浏览量
/**
 * @swagger
 * /api/goods-browse:
 *   put:
 *     summary: 更新浏览量
 *     description: 更新浏览量
 *     tags:
 *       - Goods
 *     parameters:
 *       - goodId:
 *         required: true
 *         description: goodId：商品goodId
 *         type: number
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.put('/goods-browse',putGoodsController)

// ---购物车
/**
 * @swagger
 * /api/cart:
 *   post:
 *     summary: 新增购物车商品
 *     description: 更新浏览量
 *     tags:
 *       - 购物车
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.post('/cart', addCartShopController)
/**
 * @swagger
 * /api/cart:
 *   get:
 *     summary: 新增购物车商品
 *     description: 新增购物车商品
 *     tags:
 *       - 购物车
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.get('/cart', showCartShopController)
/**
 * @swagger
 * /api/cart:
 *   put:
 *     summary: 更新购物车
 *     description: 更新购物车
 *     tags:
 *       - 购物车
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.put('/cart', updateCartShopController)
/**
 * @swagger
 * /api/cart:
 *   patch:
 *     summary: 删除购物车
 *     description: 删除购物车
 *     tags:
 *       - 购物车
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.patch('/cart', delCartShopController)

// -- 订单生成
/**
 * @swagger
 * /api/order:
 *   post:
 *     summary: 新增订单
 *     description: 新增订单
 *     tags:
 *       - 订单
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.post('/order', addShopOrderController)
/**
 * @swagger
 * /api/order:
 *   get:
 *     summary: 查看订单
 *     description: 查看订单
 *     tags:
 *       - 订单
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.get('/order', showShopOrderController) // 查看所有的订单，单个订单
/**
 * @swagger
 * /api/order:
 *   put:
 *     summary: 更新订单状态
 *     description: 更新订单状态
 *     tags:
 *       - 订单
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.put('/order', updateShopOrderController)
/**
 * @swagger
 * /api/order:
 *   patch:
 *     summary: 删除订单
 *     description: 删除订单
 *     tags:
 *       - 订单
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.patch('/order', delShopOrderController)

// 查看所以购买记录



//评论信息
/**
 * @swagger
 * /api/evaluate:
 *   get:
 *     summary: 获取商品评论信息
 *     description: 获取商品评论信息
 *     tags:
 *       - 评论
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.get('/evaluate',evaluate)
/**
 * @swagger
 * /api/evaluate/page:
 *   get:
 *     summary: 获取商品评论信息 翻页
 *     description: 获取商品评论信息 翻页
 *     tags:
 *       - 评论
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.get('/evaluate/page',commentPage)


module.exports = router
