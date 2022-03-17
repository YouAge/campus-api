const Router = require('koa-router')
const jwt = require("jsonwebtoken");
const {getAdminUser} = require("../controller/user.controller.js");
const {addAdminUser,delAdminUser} = require("../controller/user.controller.js");
const {productPutController} = require("../controller/product.controller.js");
const {delSpecsController} = require("../controller/specs.controller.js");
const {cateUpdateController} = require("../controller/cate.controller.js");
const {cateDelController} = require("../controller/cate.controller.js");
const {adminUserInfo} = require("../controller/user.controller.js");
const {updateUserPageController} = require("../controller/user.controller.js");
const {showAdminOrderController} = require("../controller/shopOrders.controller.js");
const {adminUserLogin} = require("../controller/user.controller");
const {backMsg401} = require("../../utils/backMsg");
const {adminSecret} = require("../../config");
const {shopUserPageController} = require("../controller/user.controller.js");

const {imgPostController,imgGetController,imgMapGetController} = require("../controller/imgMap.controller.js");
const {productGetController, productPostController} = require("../controller/product.controller.js");
const {
  cateGetController, catePostController,
  tagGetController, tagAddPostController,tagDelController
} = require("../controller/cate.controller.js");
const router = new Router({prefix: '/api/admin'})
const {showSpecsController} = require("../controller/specs.controller.js");
const {specsController} = require("../controller/specs.controller.js");
//----后台管理----
const authPath = new Set(['/admin/admin-login'])
router.use(async (ctx,next)=>{
  const path = ctx.request.path
  if (authPath.has(path.replace(/^\/api/, ''))) {
    await next()
  }else {
    const token = ctx.request.headers.admintoken || ''
    let data = null
    try {
      data = jwt.verify(token, adminSecret)
      ctx.state.users = data
      await next()
      // 挂在登入的用户id
    } catch (e) {
      ctx.body = backMsg401({})
    }
  }
})

// 管理员登入
/**
 * @swagger
 * /api/admin/admin-login:
 *   post:
 *     summary: 管理员登入
 *     description: 管理员登入
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.post('/admin-login',adminUserLogin)
/**
 * @swagger
 * /api/admin/get-admin-info:
 *   get:
 *     summary: 获取管理用户信息
 *     description: 获取管理用户信息
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.get('/get-admin-info',adminUserInfo)

/**
 * @swagger
 * /api/admin/add-admin:
 *   post:
 *     summary: 新增管理员用户
 *     description: 新增管理员用户
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.post('/add-admin',addAdminUser)
/**
 * @swagger
 * /api/admin/admin:
 *   get:
 *     summary: 获取管理员用户
 *     description: 获取管理员用户
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.get('/admin',getAdminUser)
/**
 * @swagger
 * /api/admin/admin:
 *   delete:
 *     summary: 删除管理员用户
 *     description: 删除管理员用户
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.delete('/admin',delAdminUser)
// 图片
/**
 * @swagger
 * /api/admin/img-map-keys:
 *   post:
 *     summary: 新增图片
 *     description: 新增图片
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.post('/img-map-keys',imgPostController)
/**
 * @swagger
 * /api/admin/img-map-keys:
 *   get:
 *     summary: 获取图片
 *     description: 获取图片
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.get('/img-map-keys',imgGetController)
//获取图片地址
/**
 * @swagger
 * /api/admin/imgs:
 *   post:
 *     summary: 上传图片
 *     description: 获取图片
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.post('/imgs',imgMapGetController)

//规格属性
/**
 * @swagger
 * /api/admin/specs:
 *   post:
 *     summary: 新增商品规格属性
 *     description: 新增商品规格属性
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.post('/specs', specsController)
/**
 * @swagger
 * /api/admin/specs:
 *   get:
 *     summary: 获取商品规格属性
 *     description: 获取商品规格属性
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.get('/specs', showSpecsController)
/**
 * @swagger
 * /api/admin/specs:
 *   delete:
 *     summary: 删除商品规格属性
 *     description: 删除商品规格属性
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.delete('/specs',delSpecsController)

// 类型
/**
 * @swagger
 * /api/admin/cate:
 *   post:
 *     summary: 新增商品类型
 *     description: 新增商品类型
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.post('/cate', catePostController)
/**
 * @swagger
 * /api/admin/cate:
 *   get:
 *     summary: 获取商品类型
 *     description: 获取商品类型
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.get('/cate', cateGetController)
/**
 * @swagger
 * /api/admin/cate:
 *   delete:
 *     summary: 删除商品类型
 *     description: 删除商品类型
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.delete('/cate', cateDelController)
/**
 * @swagger
 * /api/admin/cate:
 *   put:
 *     summary: 更新商品类型
 *     description: 更新商品类型
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.put('/cate', cateUpdateController)

// tag 标签
/**
 * @swagger
 * /api/admin/tags:
 *   get:
 *     summary: 更新商品标签
 *     description: 更新商品标签
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.get('/tags', tagGetController)
/**
 * @swagger
 * /api/admin/tags:
 *   post:
 *     summary: 更新商品标签
 *     description: 更新商品标签
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.post('/tags', tagAddPostController)
/**
 * @swagger
 * /api/admin/tags:
 *   delete:
 *     summary: 更新商品标签
 *     description: 更新商品标签
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.delete('/tags',tagDelController)




// 商品
/**
 * @swagger
 * /api/admin/product:
 *   post:
 *     summary: 新增商品
 *     description: 新增商品
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.post('/product', productPostController)
/**
 * @swagger
 * /api/admin/product:
 *   get:
 *     summary: 获取商品
 *     description: 获取商品
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.get('/product', productGetController)

//更新商品
/**
 * @swagger
 * /api/admin/product:
 *   put:
 *     summary: 更新商品
 *     description: 更新商品
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.put('/product',productPutController)



// 用户
/**
 * @swagger
 * /api/admin/shop-user:
 *   get:
 *     summary: 获取用户列表
 *     description: 获取用户列表
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.get('/shop-user', shopUserPageController)
/**
 * @swagger
 * /api/admin/shop-user:
 *   post:
 *     summary: 更新用户状态
 *     description: 更新用户状态
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.post('/shop-user',updateUserPageController)

/**
 * @swagger
 * /api/admin/order:
 *   get:
 *     summary: 获取订单信息
 *     description: 获取订单信息
 *     tags:
 *       - 管理员后台Api
 *     parameters:
 *     responses:
 *       200:
 *         description: 成功获取
 */
router.get('/order',showAdminOrderController)

module.exports = router
