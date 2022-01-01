const {GoodsSkuModel} = require("../../models/goods_sku.model.js");
const {GoodsModel} = require("../../models/goods.model.js");
const {backMsg200} = require("../../utils/backMsg.js");
const {ShopCartModel} = require("../../models/shopCart.model.js");
const {ajvValid} = require("../../utils/ajv-verify.js");


const schema = {
  type: 'object',
  properties: {
    goodsId: {type: 'number', errorMessage: {type: '必须是字符串或者数字',}},
    userId: {type: 'number', default: 0},
    shopNumber: {type: 'number', errorMessage: {type: '图片地址必须要'}},
    skuId: {type: 'number'},
  },
  required: ['goodsId', 'shopNumber', 'skuId']
}

// 添加购物测， goodsid，skuid，
async function addCartShopController(ctx, next) {
  const data = ctx.request.body || ctx.request.params || {}
  ajvValid(data, schema)
  //先查询是否存在该商品， 如果存在就 增加数量， 如果不存在就添加
  const under = {
    userId: ctx.state.users.id,
    goodsId:data.goodsId,
    skuId:data.skuId
  }
  const [cart,created] = await ShopCartModel.findOrCreate({where:under,defaults:{
    ...under,
      shopNumber:data.shopNumber
    }
  })
  if(!created){
    await ShopCartModel.update({
      // 需要判断 产品的最大库存， 不能超过。 通过skuid 获取最大量判断，这里就展示空着
      shopNumber:cart.shopNumber +=data.shopNumber
    },{
     where:under
    })
  }
  ctx.body = backMsg200({msg:"加入成功"})

}


// 获取用户购物数据
async function showCartShopController(ctx,next){
  const userId = ctx.state.users.id
  const carts =  await ShopCartModel.findAll({
    where:{userId},
    include:[
      {
        model: GoodsModel,
        as:'goods'
      },{
      model:GoodsSkuModel,
        as:'goodsSku'
      }
    ]
  })
  ctx.body =  backMsg200({data:carts,msg:'ok'})
}



// 删除购物车商品,批量 []
async function delCartShopController(ctx,next){
  const cartIds = ctx.request.body || ctx.request.params || {}
  const userId = ctx.state.users.id
  for (let id of cartIds){
    await ShopCartModel.destroy({
      where:{id,userId}
    })
  }
  ctx.body =  backMsg200({})
}


const updateSchema = {
  type: 'object',
  properties: {
    shopNumber: {type: 'number',},
    cartId: {type: 'number'},
  },
  required: ['cartId', 'shopNumber']
}
//更新, 目前只更新数量， 至于规格，后续再加入
async function updateCartShopController(ctx,next){
  const data = ctx.request.body || ctx.request.params || {}
  ajvValid(data, updateSchema)
  const userId = ctx.state.users.id
  await ShopCartModel.update({ shopNumber:data.shopNumber},{where:{id:data.cartId,userId}})
  ctx.body =  backMsg200({})
}




module.exports = {
  addCartShopController,
  updateCartShopController,
  delCartShopController,
  showCartShopController
}
