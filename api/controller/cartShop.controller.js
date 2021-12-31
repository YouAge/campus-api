const {ajvValid} = require("../../utils/ajv-verify.js");


const schema = {
  type: 'object',
  properties: {
    goodsId: {type: 'string', errorMessage: {type: '必须是字符串或者数字',}},
    userId: {type: 'number', default: 0},
    shopNumber: {type: 'string', errorMessage: {type: '图片地址必须要'}},
    skuId: {type: 'string'},
  },
  required: ['goodsId', 'shopNumber', 'skuId']
}

// 添加购物测， goodsid，skuid，
async function addCartShopController(ctx, next) {
  const data = ctx.request.body || ctx.request.params || {}
  ajvValid(data, schema)
  console.log(ctx.state.userId)

}


module.exports = {
  addCartShopController
}
