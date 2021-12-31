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

module.exports = {
  productService
}
