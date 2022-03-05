/**
 *@ github： https://github.com/YouAge
 *@ 文件介绍:
 */


const {GoodsTagModel} = require("../../models/goods_tag.model.js");
const {productService} = require("../services/product.service.js");
const {GoodsSkuModel} = require("../../models/goods_sku.model.js");
const {GoodsModel} = require("../../models/goods.model.js");
const {backMsg200} = require("../../utils/backMsg.js");
const {ajvValid} = require("../../utils/ajv-verify.js");


const schema = {
  type: 'object',
  properties: {
    name: {type: 'string', errorMessage: {type: '必须是字符串',}},
    value: {type: 'array', errorMessage: {type: '是一个数组包裹'}},
    status: {type: 'boolean', default: false},
    cateId: {type: 'array'},
    picture: {type: 'array', errorMessage: {type: '图片是一个地址'}},
    desc: {type: 'string'}, // 描述
    //商品sku  商品多种属性规格， 价格 图片
    skus: {type: 'array'},
    specs: {type: 'array'},
    particulars: {type: 'string', errorMessage: {type: '说明是一个html string'}},
    tags: {type: 'array',},
    isTypeExplain: {type: "number", default: 1},
    brandId: {type: 'number'}
  },
  required: ['name', 'picture', 'skus',]
}

const demoDate = {
  name:'商品一',
  status:true,
  cateId:1,
  picture:'fds',
  desc:'sdhafhls',
  details:'sdfdsaf',
  skus:[{
    goodsId:10,
    name:'sdf',
    picture : "saf",
    price : 0.0,
    oldPrice : 0.0,
    inventory : 122,
    desc: 'dsds',
    specs: [
      {key:'颜色',value:'红色'},
      {key:'尺码',value:32}
    ]
  }]
}


async function productPostController(ctx, next) {
  const data = ctx.request.body || ctx.request.params || {}
  ajvValid(data, schema)
  var goods = await GoodsModel.create(data,
    {
      include: [{
        model: GoodsSkuModel,
        as: 'skus'
      }]
    }
  )
  goods.setTags(data.tags) // 关联标签
  ctx.body = backMsg200({msg: '添加商品成功'})
}


const productSchema = {
  type: 'object',
  properties: {
    cateId: {type: 'number', errorMessage: {type: '必须是数字'}},
    pageSize: {type: 'number', default: 100, errorMessage: {type: '必须是字符串或者数字',}},
    pageIndex: {type: 'number', default: 1, errorMessage: {type: '是一个数组包裹'}},
    order: {type: 'string', default: 'DESC'},
    keyword: {type: 'string'},
  },
  // required:['cateId']
}

// 获取商品
async function productGetController(ctx, next) {
  const data = ctx.query
  ajvValid(data, productSchema)
  const {cateId, pageSize, pageIndex} = data
  const where = {}
  const f = await productService(data, pageIndex, pageSize,where)
  ctx.body = backMsg200({data: f, msg: '获取商品'})
}

//[批量] 删除商品
async function delProductPostController(ctx, next) {
  let goodsIds = ctx.request.body.goodsIds || ctx.request.params.goodsIds || []
  goodsIds = Array.isArray(goodsIds) ? goodsIds : [goodsIds]
  for (let id of goodsIds) {
    await GoodsModel.destroy(
      {
        where: id, include: [{
          model: GoodsSkuModel,
          as: 'skus'
        }]
        // ,force:true // 强制删除
      })
  }
  ctx.body = backMsg200({msg: '删除成功'})

}

const goodsSchema = {
  type: 'object',
  properties: {
    name: {type: 'string', errorMessage: {type: '必须是字符串',}},
    value: {type: 'array', errorMessage: {type: '是一个数组包裹'}},
    status: {type: 'boolean', default: false},
    // cateId: {type: 'array'},
    picture: {type: 'array', errorMessage: {type: '图片是一个地址'}},
    desc: {type: 'string'}, // 描述
    //商品sku  商品多种属性规格， 价格 图片
    skus: {type: 'array'},
    specs: {type: 'array'},
    particulars: {type: 'string', errorMessage: {type: '说明是一个html string'}},
    tags: {type: 'array',},
    isTypeExplain: {type: "number", default: 1},
    brandId: {type: 'number'}
  },
  // required:['cateId']
}
async function productPutController(ctx,next){
  const data = ctx.request.body || ctx.request.params || {}
  ajvValid(data, goodsSchema)
  if(data.type ===1){
    // 改变商品状态
    await GoodsModel.update({
      status:data.status,
    },{where:{id:data.id}})
    ctx.body = backMsg200({msg: '更新成功'})
  }else if(data.type ===2){
    await GoodsModel.update({ cateId:data.cateId,name:data.name,
      desc:data.desc,particulars:data.particulars, picture:data.picture
    },{where:{id:data.id}})
    const goods = await GoodsModel.findOne({where:{ id:data.id}})
    goods.setTags(data.tags) // 关联标签
    ctx.body = backMsg200({msg: '更新成功'})
  }
}


module.exports = {
  productPostController,
  productGetController,
  productPutController
}
