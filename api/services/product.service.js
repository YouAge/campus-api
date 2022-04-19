const {GoodUserModel} = require("../../models/good_user.model.js");
const {Op} = require("sequelize");
const {CateModel} = require("../../models/cate.model.js");
const {GoodsTagModel} = require("../../models/goods_tag.model.js");
const {ByProductModel} = require("../../models/byProduct.model.js");
const {UserByOrderModel} = require("../../models/userByOrder.model.js");
const {GoodsSkuModel} = require("../../models/goods_sku.model.js");
const {GoodsModel} = require("../../models/goods.model.js");


async function productService(data, pageIndex, pageSize,where ={}, order= [['created_at', 'DESC']]) {
  //先获取分类的所以子分类
  // const cateids =  await CateModel.findAll({where:{superId:data.cateId},attributes:['id']})
  // console.log('=======>',cateids)
  return await GoodsModel.findAndCountAll({
    // where,
    include: [{
      model: GoodsSkuModel,
      as: 'skus',
      order: [['price'], 'DESC']
    },
      {
        model:GoodsTagModel,
        as:'tags',
      },
      {
        model:CateModel,
        as:'cate',
      }
    ],
    limit: pageSize,
    offset: (pageIndex - 1) * pageSize,
    distinct:true,// 不计算子查询待数据，
   order,
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
  // console.log(countdown, newTimer, payLatestTime)
  order.setDataValue('payLatestTime', payLatestTime)
  order.setDataValue('countdown', countdown)
  return order
}

async function orderPageService(where,data){

  return  await UserByOrderModel.findAndCountAll({
    where, include: [{
      model: ByProductModel,
      as: 'goods',
     },
      {
        model:GoodUserModel,
        as:'user'
      }
    ],
    order:[['created_at','DESC']],
    limit:data.pageSize,
    offset:  (data.pageIndex - 1) * data.pageSize,
    distinct:true
  })
}


// 商品列表查询
async function productListService(data,where,order= [['created_at', 'DESC']]){
  //获取
  let cateIds = []
  if(data.cateId){
    const cateId =  await CateModel.findAll({where:{superId:data.cateId},attributes:['id']})
    if(cateId){
      cateIds = cateId.map(f=>f.id)
      where= {
        cateId:{
          [Op.in]:cateIds
        }
      }
    }
  }
  // console.log(cateIds)
  return  await GoodsModel.findAndCountAll({
    where,
    include: [{
      model: GoodsSkuModel,
      as: 'skus',
      order: [['price'], 'DESC'],
    },
      {
        model:GoodsTagModel,
        as:'tags',
      },
      {
        model:CateModel,
        as:'cate',
      }
    ],
    limit: data.pageSize,
    offset: (data.pageIndex - 1) * data.pageSize,
    order,
    distinct:true // 不计算子查询待数据，
    // subQuery:false //单个好用，多个不好用，不再子查询中分页
  })

}



module.exports = {
  productService,
  orderTimeService,
  orderPageService,
  productListService
}
