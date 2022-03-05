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

router.use(async (ctx,next)=>{
  // const token = ctx.request.headers.admintoken || ''
  // let data = null
  // try {
  //   data = jwt.verify(token, adminSecret)
  //   // 挂在登入的用户id
  // } catch (e) {
  //   ctx.body = backMsg401({})
  // }
  // ctx.state.users = data
  await next()
})

// 管理员登入
router.post('/admin-login',adminUserLogin)
router.get('/get-admin-info',adminUserInfo)

router.post('/add-admin',addAdminUser)
router.get('/admin',getAdminUser)
router.delete('/admin',delAdminUser)
// 图片
router.post('/img-map-keys',imgPostController)
router.get('/img-map-keys',imgGetController)
//获取图片地址
router.post('/imgs',imgMapGetController)

//规格属性
router.post('/specs', specsController)
router.get('/specs', showSpecsController)
router.delete('/specs',delSpecsController)

// 类型
router.post('/cate', catePostController)
router.get('/cate', cateGetController)
router.delete('/cate', cateDelController)
router.put('/cate', cateUpdateController)

// tag 标签
router.get('/tags', tagGetController)
router.post('/tags', tagAddPostController)
router.delete('/tags',tagDelController)




// 商品
router.post('/product', productPostController)
router.get('/product', productGetController)

//更新商品
router.put('/product',productPutController)



// 用户
router.get('/shop-user', shopUserPageController)
router.post('/shop-user',updateUserPageController)

router.get('/order',showAdminOrderController)

module.exports = router
