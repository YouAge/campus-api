const {orderTimeService} = require("../services/product.service.js");
const {byShopStatus} = require("../../models/userByOrder.model.js");
const {backMsg400} = require("../../utils/backMsg.js");
const {getRandom} = require("../../utils");
const {ByProductModel} = require("../../models/byProduct.model.js");
const {UserByOrderModel} = require("../../models/userByOrder.model.js");
const {backMsg200} = require("../../utils/backMsg.js");
const {ajvValid} = require("../../utils/ajv-verify.js");

async function setOrderId() {
  //订单号生成， 4+时间戳+4
  // UserByShopModel.findOne({where:{id:'1'}})
  // const h = getRandom(4)
  const f = getRandom(10)
  const orderId = '' + new Date().getTime() + f
  const p = await UserByOrderModel.findOne({where: {orderId: orderId}})
  if (p) {
    return await setOrderId()
  }
  return orderId
}

const specsSchema = {
  type: 'object',
  properties: {
    key: {type: 'string'},
    value: {type: 'string'}
  }
}

const goodsSchema = {
  type: 'object',
  properties: {
    name: {type: 'string', errorMessage: {type: '必须是字符串',}},
    picture: {type: 'array', errorMessage: {type: '图片是一个地址[]'}},
    oldPrice: {type: "number", errorMessage: {type: '原价'}},
    price: {type: "number", errorMessage: {type: '支付价格'}},
    specs: {type: 'array', items: specsSchema},
    count: {type: "number"},
    // tags: {type: 'array',},
    desc: {type: 'string'}, // 描述
    // brandId: {type: 'number'}
  },
  required: ['name', 'picture', 'oldPrice', 'price', 'count', 'specs']
}

const addOrderSchema = {
  type: 'object',
  properties: {
    // oId: {type: 'string', default:'121313' }, // 后端自己生成的，跟前端无关。
    shopNumber: {type: 'number', errorMessage: {type: '商品总件数'}},
    status: {type: 'number', default: 0}, // 默认状态，
    goods: {
      type: 'array',
      items: goodsSchema
    },
    address: {
      type: "object", properties: {
        name: {type: "string",},
        iPhone: {type: 'string', minLength: 11, errorMessage: {minLength: '长度必须大于等于11',}},
        address: {type: 'string',},
        fullLocation: {type: 'string',},
        postalCode: {type: 'string', default: '0000'},
      }
    }
  },
  required: ['goods', 'shopNumber', 'address']
}


// 生成订单
async function addShopOrderController(ctx, next) {
  const userId = ctx.state.users.id
  const data = ctx.request.body || ctx.request.params || {}
  ajvValid(data, addOrderSchema)
  const orderId = await setOrderId()
  // 生成订单, // 计算总价格，是否与传过来的价格一直

  let order = await UserByOrderModel.create({...data, userId, orderId}, {
    include: {
      model: ByProductModel,
      as: 'goods'
    }
  })
  ctx.body = backMsg200({data: order.orderId, msg: '成功'})
}


// 删除
async function delShopOrderController(ctx, next) {

}

// 更新订单状态
async function updateShopOrderController(ctx, next) {
}

//获取所有的订单
async function showShopOrderController(ctx, next) {
  const userId = ctx.state.users.id
  const data = ctx.query || {}
  if (data.orderId) {
    // 查找指定订单 //订单计时 支付， 30分钟倒计时， 更具生成订单开始计算
    const order = await orderTimeService(data.orderId, userId)
    return ctx.body = backMsg200({data: order, msg: 'ok'})
  }


}


module.exports = {
  addShopOrderController,
  delShopOrderController,
  updateShopOrderController,
  showShopOrderController
}
