const {ByProductModel} = require("../../models/byProduct.model.js");
const {UserByOrderModel} = require("../../models/userByOrder.model.js");
const {GoodsSkuModel} = require("../../models/goods_sku.model.js");
const {GoodsModel} = require("../../models/goods.model.js");


async function productService(where = {}, pageIndex, pageSize) {

  return await GoodsModel.findAndCountAll({
    where,
    include: {
      model: GoodsSkuModel,
      as: 'skus',
      order: [['price'], 'DESC']
    },
    limit: pageSize,
    offset: (pageIndex - 1) * pageSize,
    order: [['created_at', 'DESC']],
    // subQuery:false // 不在子查询中分页

    // where:{id:1},
    // include:[{
    //   model:CateModel,as:'children',
    //   include:{
    //     model:GoodsModel,
    //     order:[['created_at','DESC']],
    //     limit:  pageSize,
    //     offset: (pageIndex - 1) * pageSize,
    //     include:{
    //       model:GoodsSkuModel,
    //       as: 'skus',
    //       order: [['price'],'DESC']
    //     }
    //   }
    // },{
    //   model:GoodsModel,
    //   order:[['created_at','DESC']],}]
  })

}


async function orderTimeService(orderId, userId) {
  const order = await UserByOrderModel.findOne({
    where: {orderId, userId,}, include: {
      model: ByProductModel,
      as: 'goods'
    }
  })
  // const stimer = new Date(order.created_at)
  const dtim = new Date(order.created_at)
  const payLatestTime = new Date(dtim.setMinutes(dtim.getMinutes() + 30))
  const newTimer = new Date()
  let countdown = payLatestTime.getTime() - newTimer.getTime()
  countdown = countdown > 0 ? parseInt(countdown / 1000) : -1
  console.log(countdown, newTimer, payLatestTime)
  order.setDataValue('payLatestTime', payLatestTime)
  order.setDataValue('countdown', countdown)
  return order
}

module.exports = {
  productService,
  orderTimeService
}
